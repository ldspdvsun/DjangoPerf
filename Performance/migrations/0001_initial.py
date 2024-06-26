# Generated by Django 4.1 on 2024-02-09 15:55

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = []

    operations = [
        migrations.CreateModel(
            name="Case",
            fields=[
                (
                    "id",
                    models.BigAutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                (
                    "test_case_name",
                    models.CharField(
                        blank=True, max_length=64, null=True, verbose_name="用例名称"
                    ),
                ),
                ("test_case_id", models.CharField(max_length=32, verbose_name="用例标识")),
                (
                    "test_script_id",
                    models.CharField(max_length=32, verbose_name="脚本标识"),
                ),
                ("test_script", models.TextField(verbose_name="测试脚本")),
                (
                    "type",
                    models.SmallIntegerField(
                        choices=[(0, "基本"), (1, "可选"), (2, "关键")], verbose_name="用例类别"
                    ),
                ),
                ("create_edit_time", models.DateTimeField(verbose_name="录入/修改时间")),
                ("del_flag", models.SmallIntegerField(default=1, verbose_name="删除标志")),
            ],
        ),
        migrations.CreateModel(
            name="Manufacturers",
            fields=[
                (
                    "id",
                    models.BigAutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                ("name", models.CharField(max_length=32, verbose_name="名称")),
                (
                    "category",
                    models.SmallIntegerField(
                        choices=[(0, "通用"), (1, "嵌入式")], verbose_name="厂商类别"
                    ),
                ),
                ("del_flag", models.SmallIntegerField(default=1, verbose_name="删除标志")),
            ],
        ),
        migrations.CreateModel(
            name="Platform",
            fields=[
                (
                    "id",
                    models.BigAutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                ("name", models.CharField(max_length=32, verbose_name="平台名称")),
                (
                    "description",
                    models.CharField(
                        blank=True, max_length=128, null=True, verbose_name="详细信息"
                    ),
                ),
                ("del_flag", models.SmallIntegerField(default=1, verbose_name="删除标志")),
            ],
        ),
        migrations.CreateModel(
            name="User",
            fields=[
                (
                    "id",
                    models.BigAutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                ("name", models.CharField(max_length=32, verbose_name="姓名")),
                ("password", models.CharField(max_length=64, verbose_name="密码")),
                ("del_flag", models.SmallIntegerField(default=1, verbose_name="删除标志")),
            ],
        ),
        migrations.CreateModel(
            name="PerformanceTestResults",
            fields=[
                (
                    "id",
                    models.BigAutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                (
                    "year",
                    models.SmallIntegerField(
                        choices=[
                            (0, "2017"),
                            (1, "2018"),
                            (2, "2019"),
                            (3, "2020"),
                            (4, "2021"),
                            (5, "2022"),
                            (6, "2023"),
                            (7, "2024"),
                            (8, "2025"),
                        ],
                        verbose_name="测试时间",
                    ),
                ),
                (
                    "batch",
                    models.SmallIntegerField(
                        choices=[(0, "第一批"), (1, "第二批"), (2, "第三批")],
                        verbose_name="测试批次",
                    ),
                ),
                (
                    "category",
                    models.SmallIntegerField(
                        choices=[(0, "通用"), (1, "嵌入式")], verbose_name="厂商类别"
                    ),
                ),
                (
                    "test_result",
                    models.DecimalField(
                        decimal_places=2, default=0, max_digits=10, verbose_name="测试结果"
                    ),
                ),
                (
                    "test_threshold",
                    models.DecimalField(
                        decimal_places=2,
                        default=0,
                        max_digits=10,
                        verbose_name="测试用例阈值",
                    ),
                ),
                ("create_edit_time", models.DateField(verbose_name="录入/修改时间")),
                ("del_flag", models.SmallIntegerField(default=1, verbose_name="删除标志")),
                (
                    "manufacturer",
                    models.ForeignKey(
                        on_delete=django.db.models.deletion.CASCADE,
                        to="Performance.manufacturers",
                        verbose_name="测试厂商",
                    ),
                ),
                (
                    "platform",
                    models.ForeignKey(
                        on_delete=django.db.models.deletion.CASCADE,
                        to="Performance.platform",
                        verbose_name="测试平台",
                    ),
                ),
                (
                    "test_case",
                    models.ForeignKey(
                        on_delete=django.db.models.deletion.DO_NOTHING,
                        to="Performance.case",
                        verbose_name="测试用例",
                    ),
                ),
                (
                    "test_user",
                    models.ForeignKey(
                        on_delete=django.db.models.deletion.CASCADE,
                        to="Performance.user",
                        verbose_name="测试人员",
                    ),
                ),
            ],
        ),
        migrations.AddField(
            model_name="case",
            name="user",
            field=models.ForeignKey(
                on_delete=django.db.models.deletion.DO_NOTHING,
                to="Performance.user",
                verbose_name="负责人",
            ),
        ),
    ]
