# Generated by Django 4.1 on 2024-02-12 02:30

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ("Performance", "0003_performancetestresults_log_alter_logs_test_script_id"),
    ]

    operations = [
        migrations.AlterField(
            model_name="performancetestresults",
            name="test_result",
            field=models.DecimalField(
                decimal_places=4, default=0, max_digits=10, verbose_name="测试结果"
            ),
        ),
    ]
