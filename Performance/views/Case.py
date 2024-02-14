# coding=utf-8
"""
@File    : Case.py
@Time    : 2024/2/9 16:00
@Author  : Sun
@Description : 用例脚本
"""
import datetime
import random

from django.shortcuts import *
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
from Performance.utils.pagination import Pagination
from Performance.form.AllForm import *


def case_list(request):
    """列表信息"""
    # for i in range(20):
    #     models.Case.objects.create(test_case_name=f'Test_Case_Name{i:02}', test_case_id=f'GN-003-0{i:02}',
    #                                test_script_id=f'S0100201GN_{i:02}', test_script=f'Test_Script_{i:02}',
    #                                type=random.randint(0, 2), user_id=random.randint(1, 3),
    #                                create_edit_time="2024-02-10 08:32:03.148996")
    # 界面搜索数据
    data_dict = {}
    test_case_id = request.GET.get('test_case_id', "")
    if test_case_id:
        # test_case_id__contains 关键词匹配前端页面用户名 test_case_id
        data_dict['test_case_id__contains'] = test_case_id

    # search_result = models.Case.objects.filter(del_flag=1).order_by("name")
    # search_result = models.UserInfo.objects.filter(del_flag=1, **data_dict).order_by("name")

    queryset = models.Case.objects.all().filter(del_flag=1, **data_dict).order_by('-id')
    page_obj = Pagination(request, queryset)
    form = CaseModelForm()

    context = {
        'form': form,
        'queryset': page_obj.page_queryset,  # 分完页的数据
        'page_string': page_obj.html(),
    }
    return render(request, 'case_list.html', context)


@csrf_exempt
def case_add(request):
    """新建"""
    form = CaseModelForm(data=request.POST)
    if form.is_valid():
        # 订单号：额外增加一些不是用户输入的值（自己计算出来）
        # form.instance.oid = datetime.now().strftime("%Y%m%d%H%M%S") + str(random.randint(1000, 9999))
        #
        # # 固定设置管理员ID，去哪里获取？
        form.instance.create_edit_time = datetime.datetime.now()

        # 保存到数据库中
        form.save()
        return JsonResponse({"status": True})
    return JsonResponse({"status": False, 'error': form.errors})


def case_delete(request):
    """删除"""
    uid = request.GET.get('uid')
    exists = models.Case.objects.filter(id=uid).exists()
    if not exists:
        return JsonResponse({"status": False, 'error': "删除失败，数据不存在。"})

    models.Case.objects.filter(id=uid).update(del_flag=0)
    return JsonResponse({"status": True})


def case_detail(request):
    """根据ID获取信息"""
    uid = request.GET.get("uid")
    # 获取数据库相关指定字段信息
    row_dict = models.Case.objects.filter(id=uid).values("test_case_name", 'test_case_id', 'test_script_id',
                                                         'test_script', 'type',
                                                         'user').first()
    if not row_dict:
        return JsonResponse({"status": False, 'error': "数据不存在。"})

    # 从数据库中获取到一个对象 row_object
    result = {
        "status": True,
        "data": row_dict
    }
    return JsonResponse(result)


@csrf_exempt
def case_edit(request):
    """编辑"""
    uid = request.GET.get("uid")
    row_object = models.Case.objects.filter(id=uid).first()
    if not row_object:
        return JsonResponse({"status": False, 'tips': "数据不存在，请刷新重试。"})

    form = CaseModelForm(data=request.POST, instance=row_object)
    if form.is_valid():
        form.instance.create_edit_time = datetime.datetime.now()
        form.save()
        return JsonResponse({"status": True})

    return JsonResponse({"status": False, 'error': form.errors})
