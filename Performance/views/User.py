# coding=utf-8
"""
@File    : User.py
@Time    : 2024/2/9 16:00
@Author  : Sun
@Description : 人员信息
"""
from django.shortcuts import *
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
from Performance.utils.pagination import Pagination
from Performance.form.AllForm import *


def user_list(request):
    """列表信息"""
    queryset = models.User.objects.all().filter(del_flag=1).order_by('-id')
    page_obj = Pagination(request, queryset)

    form = UserModelForm()
    context = {
        'form': form,
        'queryset': page_obj.page_queryset,  # 分完页的数据
        'page_string': page_obj.html(),
    }
    return render(request, 'user_list.html', context)


@csrf_exempt
def user_add(request):
    """新建"""
    form = UserModelForm(data=request.POST)
    if form.is_valid():
        # 订单号：额外增加一些不是用户输入的值（自己计算出来）
        # form.instance.oid = datetime.now().strftime("%Y%m%d%H%M%S") + str(random.randint(1000, 9999))
        #
        # # 固定设置管理员ID，去哪里获取？
        # form.instance.user_id = request.session["info"]["id"]

        # 保存到数据库中
        form.save()
        return JsonResponse({"status": True})
    return JsonResponse({"status": False, 'error': form.errors})


def user_delete(request):
    """删除"""
    uid = request.GET.get('uid')
    exists = models.User.objects.filter(id=uid).exists()
    if not exists:
        return JsonResponse({"status": False, 'error': "删除失败，数据不存在。"})

    models.User.objects.filter(id=uid).update(del_flag=0)
    return JsonResponse({"status": True})


def user_detail(request):
    """根据ID获取信息"""
    uid = request.GET.get("uid")
    # 获取数据库相关指定字段信息
    row_dict = models.User.objects.filter(id=uid).values("name", 'password').first()
    if not row_dict:
        return JsonResponse({"status": False, 'error': "数据不存在。"})

    # 从数据库中获取到一个对象 row_object
    result = {
        "status": True,
        "data": row_dict
    }
    return JsonResponse(result)


@csrf_exempt
def user_edit(request):
    """编辑"""
    uid = request.GET.get("uid")
    row_object = models.User.objects.filter(id=uid).first()
    if not row_object:
        return JsonResponse({"status": False, 'tips': "数据不存在，请刷新重试。"})

    form = UserModelForm(data=request.POST, instance=row_object)
    if form.is_valid():
        form.save()
        return JsonResponse({"status": True})

    return JsonResponse({"status": False, 'error': form.errors})
