# Generated by Django 2.0 on 2020-08-26 10:36

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('sign', '0020_auto_20200826_1032'),
    ]

    operations = [
        migrations.AlterField(
            model_name='number_table',
            name='tab_number',
            field=models.IntegerField(primary_key=True, serialize=False, verbose_name='数据表序列'),
        ),
    ]
