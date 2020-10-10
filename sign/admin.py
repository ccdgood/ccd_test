from django.contrib import admin
from sign.models import Computer_status
from sign.models import o_assets
from sign.models import show_address
# Register your models here.


class Computer_statusAdmin(admin.ModelAdmin):
    list_display = ['c_network','system_type','it_number','name','computer_name','c_cpu','c_memory','c_display','asset_users','seat_number','c_time']

class O_assetsAdmin(admin.ModelAdmin):
    list_display = ['o_number','o_name','o_category','o_seat_number','o_time','o_remarks']

class show_addressAdmin(admin.ModelAdmin):
    list_display = ['address','protocol','ip_mac','ip_type','interface']


admin.site.register(Computer_status,Computer_statusAdmin)
admin.site.register(o_assets,O_assetsAdmin)
admin.site.register(show_address,show_addressAdmin)