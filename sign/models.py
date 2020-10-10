from django.db import models
from django import forms
# Create your models here.

#用户计算机
class Computer_status(models.Model):
    name = models.CharField(verbose_name="登录用户",max_length=100)               #用户名
    name_yu = models.CharField(verbose_name="域",max_length=20)                  #域
    computer_name = models.CharField(verbose_name="计算机名",max_length=100)      #计算机名
    system_type = models.CharField(verbose_name="系统类型",max_length=100)       #系统类型
    c_cpu = models.CharField(verbose_name="CPU",max_length=100)            #CPU
    c_memory = models.CharField(verbose_name="内存",max_length=100)         #内存
    c_network = models.CharField(verbose_name="IP地址",max_length=100)        #网卡
    mac_network = models.CharField(verbose_name="MAC地址",max_length=100)
    c_display = models.CharField(verbose_name="显卡",max_length=100)        #显示
    c_date = models.CharField(verbose_name="硬盘",max_length=100)           #硬盘
    c_time = models.DateTimeField(verbose_name="更新时间",auto_now_add=True)        #时间自动记录
    it_number = models.CharField(verbose_name="IT资产编号",max_length=100,blank=True)
    seat_number = models.CharField(verbose_name="座位编号",max_length=100,blank=True)
    asset_users = models.CharField(verbose_name="资产使用者",max_length=100,blank=True)

    class Meta:
        managed=True
        unique_together = ("name","computer_name","mac_network")

    def __str__(self):
        return self.name

#IP地址测试地段
class show_address(models.Model):
    protocol = models.CharField(verbose_name="协议类型",max_length=20,blank=True)
    address = models.CharField(verbose_name="IP地址", max_length=20,blank=True)
    min = models.CharField(verbose_name="延迟时间", max_length=20,blank=True)
    ip_mac = models.CharField(verbose_name="MAC地址", max_length=20,blank=True)
    ip_type = models.CharField(verbose_name="类型", max_length=20,blank=True)
    interface = models.CharField(verbose_name="接口地址", max_length=20,blank=True)

#其他非电子类产品资产
class o_assets(models.Model):
    o_number = models.CharField(verbose_name="其他资产编号",max_length=100,blank=True)
    o_name = models.CharField(verbose_name="资产名称", max_length=100, blank=True)
    o_category = models.CharField(verbose_name="类别", max_length=100, blank=True)
    o_num = models.CharField(verbose_name="数量", max_length=100, blank=True)
    o_seat_number = models.CharField(verbose_name="具体位置", max_length=100, blank=True)
    o_time = models.DateTimeField(verbose_name="更新时间", auto_now_add=True)
    o_remarks = models.CharField(verbose_name="备注", max_length=100, blank=True)

#盘点测试表
# class number_inspect(models.Model):
#     in_number = models.CharField(verbose_name="资产编号",max_length=100,blank=True)
#     in_users = models.CharField(verbose_name="资产使用者", max_length=100, blank=True)
#     in_seat_number = models.CharField(verbose_name="具体位置", max_length=100, blank=True)
#     in_category = models.CharField(verbose_name="类别", max_length=100, blank=True)
#     in_category = models.CharField(verbose_name="备注", max_length=100, blank=True)
#     in_time = models.DateTimeField(verbose_name="更新时间", max_length=100, blank=True)
#     in_flag = models.CharField(verbose_name="确认标志", max_length=10, blank=True)
#保存判断列表数据的表
class number_table(models.Model):
#       tab_number = models.IntegerField(verbose_name="数据表序列",primary_key = True)
       tab_name = models.CharField(verbose_name="数据表名称",max_length=100,blank=True)

