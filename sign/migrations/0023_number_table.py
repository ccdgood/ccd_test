# Generated by Django 2.0 on 2020-08-26 10:53

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('sign', '0022_delete_number_table'),
    ]

    operations = [
        migrations.CreateModel(
            name='number_table',
            fields=[
                ('tab_number', models.IntegerField(primary_key=True, serialize=False, verbose_name='数据表序列')),
                ('tab_name', models.CharField(blank=True, max_length=100, verbose_name='数据表名称')),
            ],
        ),
    ]
