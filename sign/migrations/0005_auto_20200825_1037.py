# Generated by Django 2.0 on 2020-08-25 10:37

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('sign', '0004_auto_20200820_1725'),
    ]

    operations = [
        migrations.CreateModel(
            name='number_inspect',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('in_number', models.CharField(blank=True, max_length=100, verbose_name='资产编号')),
                ('in_users', models.CharField(blank=True, max_length=100, verbose_name='资产使用者')),
                ('in_seat_number', models.CharField(blank=True, max_length=100, verbose_name='具体位置')),
                ('in_category', models.CharField(blank=True, max_length=100, verbose_name='备注')),
                ('in_time', models.CharField(blank=True, max_length=100, verbose_name='更新时间')),
            ],
        ),
        migrations.CreateModel(
            name='o_assets',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('o_number', models.CharField(blank=True, max_length=100, verbose_name='其他资产编号')),
                ('o_name', models.CharField(blank=True, max_length=100, verbose_name='资产名称')),
                ('o_category', models.CharField(blank=True, max_length=100, verbose_name='类别')),
                ('o_num', models.CharField(blank=True, max_length=100, verbose_name='数量')),
                ('o_seat_number', models.CharField(blank=True, max_length=100, verbose_name='具体位置')),
                ('o_time', models.DateTimeField(auto_now_add=True, verbose_name='更新时间')),
                ('o_remarks', models.CharField(blank=True, max_length=100, verbose_name='备注')),
            ],
        ),
        migrations.AlterField(
            model_name='show_address',
            name='address',
            field=models.CharField(blank=True, max_length=20, verbose_name='IP地址'),
        ),
        migrations.AlterField(
            model_name='show_address',
            name='interface',
            field=models.CharField(blank=True, max_length=20, verbose_name='接口地址'),
        ),
        migrations.AlterField(
            model_name='show_address',
            name='ip_mac',
            field=models.CharField(blank=True, max_length=20, verbose_name='MAC地址'),
        ),
        migrations.AlterField(
            model_name='show_address',
            name='ip_type',
            field=models.CharField(blank=True, max_length=20, verbose_name='类型'),
        ),
        migrations.AlterField(
            model_name='show_address',
            name='min',
            field=models.CharField(blank=True, max_length=20, verbose_name='延迟时间'),
        ),
        migrations.AlterField(
            model_name='show_address',
            name='protocol',
            field=models.CharField(blank=True, max_length=20, verbose_name='协议类型'),
        ),
    ]
