# coding=utf-8
"""
@File    : PerformanceTestResults.py
@Time    : 2024/2/9 16:01
@Author  : Sun
@Description : 性能测试结果
"""
import datetime
import random

from django.shortcuts import *
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
from Performance.utils.pagination import Pagination
from Performance.form.AllForm import *
from Performance.utils.ProcessingLogDb import ProcessLog


def performance_list(request):
    """列表信息"""
    # 界面搜索数据
    data_dict = {}
    search_name = request.GET.get('search_name', "")
    search_gender = request.GET.get('search_gender', "")
    if search_name:
        # name__contains 关键词匹配前端页面用户名name
        data_dict['name__contains'] = search_name
    if search_gender:
        # gender__contains 关键词匹配前端页面用户性别gender
        data_dict['gender__contains'] = search_gender

    queryset = models.PerformanceTestResults.objects.all().filter(del_flag=1).order_by('-id')
    # queryset = models.PerformanceTestResults.objects.all().filter(del_flag=1, **data_dict).order_by('-id')
    page_obj = Pagination(request, queryset)
    form = PerformanceModelForm()

    context = {
        'form': form,
        'queryset': page_obj.page_queryset,  # 分完页的数据
        'page_string': page_obj.html(),
    }
    return render(request, 'performance_list.html', context)


@csrf_exempt
def performance_add(request):
    """新建"""
    form = PerformanceModelForm(data=request.POST, files=request.FILES)
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


def performance_delete(request):
    """删除"""
    uid = request.GET.get('uid')
    exists = models.PerformanceTestResults.objects.filter(id=uid).exists()
    if not exists:
        return JsonResponse({"status": False, 'error': "删除失败，数据不存在。"})

    models.PerformanceTestResults.objects.filter(id=uid).update(del_flag=0)
    return JsonResponse({"status": True})


def performance_detail(request):
    """根据ID获取信息"""
    uid = request.GET.get("uid")
    # 获取数据库相关指定字段信息
    row_dict = models.PerformanceTestResults.objects.filter(id=uid).values("year", 'batch', "category", 'manufacturer',
                                                                           "platform",
                                                                           'test_case', "log",
                                                                           'test_result', "test_threshold", 'test_user',
                                                                           'create_edit_time').first()
    if not row_dict:
        return JsonResponse({"status": False, 'error': "数据不存在。"})

    # 从数据库中获取到一个对象 row_object
    result = {
        "status": True,
        "data": row_dict
    }
    return JsonResponse(result)


@csrf_exempt
def performance_edit(request):
    """编辑"""
    uid = request.GET.get("uid")
    row_object = models.PerformanceTestResults.objects.filter(id=uid).first()
    if not row_object:
        return JsonResponse({"status": False, 'tips': "数据不存在，请刷新重试。"})
    print(f'row_object:{row_object}')
    form = PerformanceModelForm(data=request.POST, files=request.FILES, instance=row_object)
    if form.is_valid():
        form.instance.create_edit_time = datetime.datetime.now()
        form.save()
        return JsonResponse({"status": True})

    return JsonResponse({"status": False, 'error': form.errors})


@csrf_exempt
def performance_process_log(request):
    """log处理"""
    # 获取关键字
    key_word = request.POST.get('key_word', "")
    print(f'performance_process_log:{key_word}')

    # 获取数据库里所有的对象
    queryset = models.PerformanceTestResults.objects.filter(del_flag=1)
    for obj in queryset:
        print(f'obj.log:{obj.log}  obj.test_result:{obj.test_result}')
        if obj.log:
            results = ProcessLog.find_key_values(file_path=obj.log.path, key_word=key_word)
            print(results)
            for result in results:
                value = result.get('value', '')
                print('Value:', value)
                models.PerformanceTestResults.objects.filter(id=obj.id).update(test_result=value)
            print('=============================')
    # return redirect('/performance/list')
    return JsonResponse({'status': True})


def chart_list(request):
    """用户数据统计页面"""
    # 获取数据库表设计字段及名称，设置为字典
    model_attributes_verbose = {field.name: field.verbose_name for field in
                                models.PerformanceTestResults._meta.get_fields() if
                                field.name != 'orders'}

    print(f'model_attributes_verbose:{model_attributes_verbose}')
    return render(request, "performance_chart_list.html",
                  {"model_attributes_verbose": model_attributes_verbose})


def get_chart_attributes(request):
    """用户数据统计页面 x,y轴 属性获取"""
    model_id_verbose = {field.name: field.verbose_name for field in models.PerformanceTestResults._meta.get_fields() if
                        field.name != 'orders'}
    if request.method == 'POST':
        x_key = request.POST.get('xValue')
        y_key = request.POST.get('yValue')
        x_value = model_id_verbose.get(x_key, "Unknown")
        # y_value = models.Case.objects.filter(id=model_id_verbose.get(y_key, "Unknown"))
        y_value = model_id_verbose.get(y_key, "Unknown")
        print(f'get_chart_attributes x_key:{x_key}')
        print(f'get_chart_attributes y_key:{y_key}')
        print(f'get_chart_attributes x_value:{x_value}')
        print(f'get_chart_attributes y_value:{y_value}')

        # 在这里执行您希望的操作，例如将选中的 x 和 y 值传递给另一个视图函数进行处理
        result = {
            'X_KEY': x_key,
            'Y_KEY': y_key,
            'X_VALUE': x_value,
            'Y_VALUE': y_value,
        }
        return JsonResponse({'status': True, 'data': result})
    else:
        return JsonResponse({'status': False, 'error': 'Invalid request'})


def chart_line(request):
    """折线图数据"""
    # 数据库获取下列数据
    x_key = request.GET.get('xKey')
    y_key = request.GET.get('yKey')

    # 获取Y轴坐标的名称
    model_id_verbose = {field.name: field.verbose_name for field in models.PerformanceTestResults._meta.get_fields() if
                        field.name == y_key}
    y_value_legend = model_id_verbose.get(y_key, "Unknown")

    '''
    要获取 PerformanceTestResults 表下 test_case 字段关联的 Case 表的 test_case_id 值，您可以使用双下划线 __ 进行跨表查询，
    然后在 values_list 中指定字段名即可。
    在这里，test_case__test_case_id 表示要跨表查询 PerformanceTestResults 表中的 test_case 字段对应的 Case 表中的 test_case_id 字段。
    '''
    x_axis_list = list(
        models.PerformanceTestResults.objects.filter(del_flag=1).values_list('test_case__test_case_id', flat=True))

    # x_axis_list = list(models.PerformanceTestResults.objects.filter(del_flag=1).values_list(x_key, flat=True))
    series_data = list(models.PerformanceTestResults.objects.filter(del_flag=1).values_list(y_key, flat=True))
    series_data_threshold = list(
        models.PerformanceTestResults.objects.filter(del_flag=1).values_list("test_threshold", flat=True))
    print(f'x_axis_list:{x_axis_list}')
    print(f'series_data:{series_data}')
    print(f'series_data_threshold:{series_data_threshold}')
    series_list = [
        {
            "name": y_value_legend,
            "type": 'line',
            "stack": 'Total',
            "data": series_data
        },
        {
            "name": "测试结果阈值",
            "type": 'line',
            # "stack": 'Total',
            "color": 'red',
            "data": series_data_threshold
        },
    ]

    result = {
        "status": True,
        "data": {
            'x_axis_list': x_axis_list,
            'series_list': series_list,
        }
    }

    return JsonResponse(result)


def chart_bar(request):
    """柱状图数据"""
    # 获取传递的 x 和 y 值
    x_key = request.GET.get('xValue')
    y_key = request.GET.get('yValue')
    print(f'chart_bar x_key:{x_key}')
    print(f'chart_bar y_key:{y_key}')

    # 获取Y轴坐标的名称
    model_id_verbose = {field.name: field.verbose_name for field in models.PerformanceTestResults._meta.get_fields() if
                        field.name == y_key}
    y_value_legend = model_id_verbose.get(y_key, "Unknown")

    # 使用传递的 x 值替换 x_axis_list 中的属性名
    x_axis_list = list(
        models.PerformanceTestResults.objects.filter(del_flag=1).values_list('test_case__test_case_id', flat=True))

    # 使用传递的 y 值替换 series_data 中的属性名
    series_data = list(models.PerformanceTestResults.objects.filter(del_flag=1).values_list(y_key, flat=True))
    series_data_threshold = list(
        models.PerformanceTestResults.objects.filter(del_flag=1).values_list("test_threshold", flat=True))

    series_list = [
        {
            "name": y_value_legend,
            "type": 'bar',
            "data": series_data,
        },
        {
            "name": "测试结果阈值",
            "type": 'line',
            # "stack": 'Total',
            "color": 'red',
            "data": series_data_threshold
        },
    ]

    result = {
        "status": True,
        "data": {
            'x_axis_list': x_axis_list,
            'series_list': series_list,
        }
    }

    return JsonResponse(result)


def chart_pie(request):
    """饼状图数据"""
    # 数据库获取下列数据
    x_key = request.GET.get('xValue')
    y_key = request.GET.get('yValue')

    # 获取Y轴坐标的名称
    model_id_verbose = {field.name: field.verbose_name for field in models.PerformanceTestResults._meta.get_fields() if
                        field.name == y_key}
    y_value_legend = model_id_verbose.get(y_key, "Unknown")
    print(f'PIE y_value_legend:{y_value_legend}')

    x_axis_list = list(
        models.PerformanceTestResults.objects.filter(del_flag=1).values_list('test_case__test_case_id', flat=True))
    series_data = list(models.PerformanceTestResults.objects.filter(del_flag=1).values_list(y_key, flat=True))

    # 构建 series_data 列表
    series_data_list = [{"value": series_data[i], "name": x_axis_list[i]} for i in range(len(x_axis_list))]
    result = {
        "status": True,
        "name": y_value_legend,
        "data": {
            "series_data": series_data_list
        }
    }

    return JsonResponse(result)
