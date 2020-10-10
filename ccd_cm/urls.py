"""ccd_cm URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.conf.urls import url
from django.contrib import admin
from django.urls import path
from sign import views
from static import *


urlpatterns = [
    path('admin/', admin.site.urls),
    url(r'^$',views.index),
    url(r'index/$',views.index),
    url(r'login_action$',views.login_action),
    url(r'^event_manage/$',views.event_manage),
    url(r'^Statistical_computer/$',views.Statistical_computer),
    url(r'search_name/$',views.search_name),
    url(r'Statistical_computer_in/$',views.Statistical_computer_in),
    url(r'show_ip/$',views.show_ip),
    url(r'input_datebase/$',views.input_datebase),
    url('Inventory/$',views.Inventory),
    url(r'up',views.up_Inventory),
    url(r'zhuanhuan/$',views.char_png),
    url(r'index_house/$',views.index_house),
    url(r'ccd_huose/$',views.in_huose),
]
