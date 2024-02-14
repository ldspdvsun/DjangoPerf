# coding=utf-8
"""
@File    : Logs.py
@Time    : 2024/2/10 22:30
@Author  : Sun
@Description : 
"""

from django.forms import *
from django.shortcuts import *
from Performance import models
from Performance.form.AllForm import LogsModelForm


def log_list(request):
    """Log列表"""
    query_set = models.Logs.objects.all().filter(del_flag=1)
    return render(request, "logs_list.html", {"query_set": query_set})


def log_add(request):
    """新增Log"""
    title = "新增Log"
    if request.method == "GET":
        form = LogsModelForm()
        return render(request, "log_update.html", {"form": form, "title": title})

    form = LogsModelForm(data=request.POST, files=request.FILES)
    if form.is_valid():
        # 自动保存，上传文件到指定位置
        form.save()
        return redirect("/logs/list/")
    return render(request, "log_update.html", {"form": form, "title": title})


def log_delete(request):
    """删除Log"""
    # 获取ID
    del_id = request.GET.get('del_id')

    # 逻辑删除
    models.Logs.objects.filter(id=del_id).update(del_flag=0)

    # 重定向到列表页面
    return redirect("/logs/list/")


def log_update(request, edit_id):
    """修改Log"""
    # 根据ID获取要更新的对象
    edit_obj = models.Logs.objects.filter(id=edit_id).first()

    # 点击编辑后界面展示数据
    if request.method == "GET":
        # 通过instance获取要编辑对象的值
        form = LogsModelForm(instance=edit_obj)
        return render(request, 'log_update.html', {"form": form})

    # edit_obj.img = request.FILES.get('img')
    # 界面数据更新后更新数据库对象
    form = LogsModelForm(data=request.POST, files=request.FILES, instance=edit_obj)
    if form.is_valid():
        print(form.cleaned_data)
        form.save()
        return redirect('/logs/list/')
    return render(request, 'log_update.html', {'form': form})
