"""djangoPerf URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, re_path
from Performance.views import Platform, User, Manufacturers, PerformanceTestResults, Case, Logs
from django.contrib import admin
from django.views.static import serve
from django.conf import settings

urlpatterns = [
    # 启用media
    re_path(r'^media/(?P<path>.*)$', serve, {'document_root': settings.MEDIA_ROOT}, name='media'),

    # path("admin/", admin.site.urls),

    # ========== 人员信息表 ==========
    path("user/list/", User.user_list),
    path("user/add/", User.user_add),
    path("user/delete/", User.user_delete),
    path("user/detail/", User.user_detail),
    path("user/edit/", User.user_edit),

    # ========== 厂商信息表 ==========
    path("manufacturer/list/", Manufacturers.manufacturer_list),
    path("manufacturer/add/", Manufacturers.manufacturer_add),
    path("manufacturer/delete/", Manufacturers.manufacturer_delete),
    path("manufacturer/detail/", Manufacturers.manufacturer_detail),
    path("manufacturer/edit/", Manufacturers.manufacturer_edit),

    # ========== 平台信息表 ==========
    path("platform/list/", Platform.platform_list),
    path("platform/add/", Platform.platform_add),
    path("platform/delete/", Platform.platform_delete),
    path("platform/detail/", Platform.platform_detail),
    path("platform/edit/", Platform.platform_edit),

    # ========== 性能测试结果表 ==========
    path("performance/list/", PerformanceTestResults.performance_list),
    path("performance/add/", PerformanceTestResults.performance_add),
    path("performance/delete/", PerformanceTestResults.performance_delete),
    path("performance/detail/", PerformanceTestResults.performance_detail),
    path("performance/edit/", PerformanceTestResults.performance_edit),
    path("performance/process_log/", PerformanceTestResults.performance_process_log),

    path("performance/chart_list/", PerformanceTestResults.chart_list),
    path("performance/get_chart_attributes/", PerformanceTestResults.get_chart_attributes),
    path("performance/chart_line/", PerformanceTestResults.chart_line),
    path("performance/chart_bar/", PerformanceTestResults.chart_bar),
    path("performance/chart_pie/", PerformanceTestResults.chart_pie),

    # ========== 用例脚本信息表 ==========
    path("case/list/", Case.case_list),
    path("case/add/", Case.case_add),
    path("case/delete/", Case.case_delete),
    path("case/detail/", Case.case_detail),
    path("case/edit/", Case.case_edit),

    # ====================== 测试结果列表 ======================
    path("logs/list/", Logs.log_list),
    path("logs/add/", Logs.log_add),
    path("logs/delete/", Logs.log_delete),
    path("logs/<int:edit_id>/update/", Logs.log_update),
]
