# Generated by Django 2.0 on 2020-08-26 10:32

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('sign', '0019_auto_20200826_1031'),
    ]

    operations = [
        migrations.AlterField(
            model_name='number_table',
            name='tab_number',
            field=models.AutoField(primary_key=True, serialize=False, verbose_name='数据表序列'),
        ),
    ]
