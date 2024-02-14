# coding=utf-8
"""
@File    : AllForm.py
@Time    : 2024/2/9 16:28
@Author  : Sun
@Description : 
"""
from Performance.utils.bootstrap import BootStrapModelForm, BootStrapForm
from Performance import models
from django import forms

class UserModelForm(BootStrapModelForm):
    """User"""

    class Meta:
        model = models.User
        exclude = ['del_flag']
        fields = "__all__"


class PlatformModelForm(BootStrapModelForm):
    """Platform"""

    class Meta:
        model = models.Platform
        exclude = ['del_flag']
        fields = "__all__"


class ManufacturerModelForm(BootStrapModelForm):
    """User"""

    class Meta:
        model = models.Manufacturers
        exclude = ['del_flag']
        fields = "__all__"


class PerformanceModelForm(BootStrapModelForm):
    """User"""
    bootstrap_exclude_fields = ['log']

    class Meta:
        model = models.PerformanceTestResults
        exclude = ['del_flag']
        fields = "__all__"


class CaseModelForm(BootStrapModelForm):
    """Case"""

    class Meta:
        model = models.Case
        exclude = ['del_flag', 'create_edit_time']
        fields = "__all__"


class LogsModelForm(BootStrapModelForm):
    """Logs"""
    bootstrap_exclude_fields = ['log']

    class Meta:
        model = models.Logs
        exclude = ['del_flag']
        fields = "__all__"

    log = forms.FileField(label='Log文件', required=False)  # 添加文件上传字段