from django.db import models


# Create your models here.

class User(models.Model):
    """人员信息表"""
    name = models.CharField(verbose_name='姓名', max_length=32)
    password = models.CharField(verbose_name='密码', max_length=64)
    del_flag = models.SmallIntegerField(verbose_name='删除标志', default=1)

    def __str__(self):
        return self.name


class Manufacturers(models.Model):
    """厂商信息表"""
    name = models.CharField(verbose_name='名称', max_length=32)
    category_choices = (
        (0, "通用"),
        (1, "嵌入式"),
    )
    category = models.SmallIntegerField(verbose_name="厂商类别", choices=category_choices)
    del_flag = models.SmallIntegerField(verbose_name='删除标志', default=1)

    def __str__(self):
        return self.name


class Platform(models.Model):
    """平台信息表"""
    name = models.CharField(verbose_name='平台名称', max_length=32)
    description = models.CharField(verbose_name='详细信息', max_length=128, null=True, blank=True)
    del_flag = models.SmallIntegerField(verbose_name='删除标志', default=1)

    def __str__(self):
        return self.name


class Case(models.Model):
    """测试用例信息表"""
    test_case_name = models.CharField(verbose_name='用例名称', max_length=64, null=True, blank=True)
    test_case_id = models.CharField(verbose_name='用例标识', max_length=32)
    test_script_id = models.CharField(verbose_name='脚本标识', max_length=32)
    test_script = models.TextField(verbose_name='测试脚本')
    type_choices = (
        (0, "基本"),
        (1, "可选"),
        (2, "关键"),
    )
    type = models.SmallIntegerField(verbose_name="用例类别", choices=type_choices)
    user = models.ForeignKey(to=User, on_delete=models.DO_NOTHING, verbose_name='负责人')
    create_edit_time = models.DateTimeField(verbose_name="录入/修改时间")
    del_flag = models.SmallIntegerField(verbose_name='删除标志', default=1)

    def __str__(self):
        return self.test_case_id
        # return self.test_case_id


class PerformanceTestResults(models.Model):
    """性能测试结果表"""
    year_choices = (
        (0, "2017"),
        (1, "2018"),
        (2, "2019"),
        (3, "2020"),
        (4, "2021"),
        (5, "2022"),
        (6, "2023"),
        (7, "2024"),
        (8, "2025"),
    )
    year = models.SmallIntegerField(verbose_name="测试时间", choices=year_choices)
    batch_choices = (
        (0, "第一批"),
        (1, "第二批"),
        (2, "第三批"),
    )
    batch = models.SmallIntegerField(verbose_name="测试批次", choices=batch_choices)
    category_choices = (
        (0, "通用"),
        (1, "嵌入式"),
    )
    category = models.SmallIntegerField(verbose_name="厂商类别", choices=category_choices)
    manufacturer = models.ForeignKey(to=Manufacturers, on_delete=models.CASCADE, verbose_name="测试厂商")
    platform = models.ForeignKey(to=Platform, on_delete=models.CASCADE, verbose_name="测试平台")
    test_case = models.ForeignKey(to=Case, on_delete=models.DO_NOTHING, verbose_name='测试用例')
    test_result = models.DecimalField(verbose_name="测试结果", max_digits=10, decimal_places=4, default=0)
    test_threshold = models.DecimalField(verbose_name="测试用例阈值", max_digits=10, decimal_places=2, default=0)
    test_user = models.ForeignKey(to=User, on_delete=models.CASCADE, verbose_name="测试人员")
    log = models.FileField(verbose_name="Log", upload_to='logs/', null=True, blank=True)
    create_edit_time = models.DateField(verbose_name="录入/修改时间")
    del_flag = models.SmallIntegerField(verbose_name='删除标志', default=1)


class Logs(models.Model):
    """测试结果信息表"""
    name = models.CharField(verbose_name="Log名称", max_length=32, null=True, blank=True)
    keywords = models.CharField(verbose_name="关键词", max_length=32, null=True, blank=True)
    test_script_id = models.ForeignKey(to=Case, on_delete=models.DO_NOTHING, verbose_name='用例标识', null=True,
                                       blank=True)
    # 本质上数据库也是CharField，自动保存数据。
    log = models.FileField(verbose_name="Log", upload_to='logs/')
    del_flag = models.SmallIntegerField(verbose_name='删除标志', default=1)
