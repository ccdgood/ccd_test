from datetime import datetime
from django.template.defaulttags import register
from django.http import HttpResponse, HttpResponseRedirect
from django.shortcuts import render
from sign.models import Computer_status
import re
from pymysql import cursors,connect
import urllib
import os
import sys
import telnetlib
import time
from PIL import Image
import csv,codecs
import json
from django.shortcuts import render
from bs4 import BeautifulSoup
import time
import lxml
import requests
import base64
import io
from lxml import etree
from fontTools.ttLib import TTFont
import html

# Create your views here.
#!/usr/bin/env python
# -*- coding: utf-8 -*-
QUANJU = 0

def index(request):
    return render(request,"index.html")

#curl自动获取参数
def login_action(request):
    if request.method=='POST':
        request.encoding ='gb2312'
        system_type1 = request.POST.get('system_type','')
        print (request.POST.get('c_network', ''))
        c_network1 = request.POST.get('c_network', '').split(',')
        c_network1_text = '192.168'
        c_network_2 = ""
        print('==============================')
        #c_add 遍历网卡里面传过来的数组,ping的通，IP地址就是正确的，ping不同，IP地址为数组最后一个
        for c_add in c_network1:
            #如果字符串包含‘192.168’   用于识别虚拟网卡
            if c_network1_text in c_add:
                c_network_2 = mac_network1
                if os.system('ping -n 1 -w 1 %s' % c_add)==0:
                    break
            #需要提取的非IP地址，而是MAC地址
            mac_network1 = c_add

        #print(c_network1[0])
        #c_network1 = re.findall(r"\b(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\b",request.POST.get('c_network', ''))#提取IP地址
        # username = request.POST.get('username','')
        # password = request.POST.get('password','')
        #((2(5[0-5]|[0-4]\d))|[0-1]?\d{1,2})(\.((2(5[0-5]|[0-4]\d))|[0-1]?\d{1,2})){3} 匹配IP地址
        #(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)
        #r"\b(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\b")
        #urllib.parse.unquote('\xc3\x86\xc3\xac\xc2\xbd\xc2\xa2\xc2\xb0\xc3\xa6')
        conn = connect(host='127.0.0.1', port=3306, user='root', passwd='123456', db='computer_status',cursorclass=cursors.DictCursor)
        myconn = conn.cursor()
        # print(request.POST.get('c_date',''))
        name1=request.POST.get('name','')
        name_yu1 = request.POST.get('name_yu', '')
        computer_name1 = request.POST.get('computer_name', '')
        c_cpu1 = request.POST.get('c_cpu', '')
        c_memory1 = request.POST.get('c_memory', '')
        c_network1 = c_add
        c_display1 = request.POST.get('c_display', '')
        c_date1 = request.POST.get('c_date', '')
        c_time1 = datetime.now()
        if c_network1_text in mac_network1:
            mac_network1 = c_network_2
        try:
            #Computer_status.objects.create(name=request.POST.get('name',''),name_yu=request.POST.get('name_yu',''),computer_name=request.POST.get('computer_name',''),system_type=system_type1,c_cpu=request.POST.get('c_cpu',''),c_memory=request.POST.get('c_memory',''),c_network=c_network1,c_display=request.POST.get('c_display',''),c_date=request.POST.get('c_date',''))
            #Computer_status.objects.create(,,,,)
            sql='INSERT INTO sign_computer_status(name ,name_yu,computer_name,system_type,c_cpu,c_memory,c_network,c_display,mac_network,it_number,c_date,c_time,asset_users,seat_number) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)'
            val = (name1,name_yu1,computer_name1,system_type1,c_cpu1,c_memory1,c_network1,c_display1,mac_network1,"",c_date1,c_time1,"","")
            # print(sql)
            # print(val)
            print(sql,val)
            myconn.execute(sql,val)
            conn.commit()
            # print(system_type1)
        except Exception as e:
            sql = "UPDATE sign_computer_status SET c_time = %s WHERE name = %s AND mac_network = %s"
            val = (datetime.now(),name1,mac_network1)
            myconn.execute(sql,val)
            conn.commit()
            #Computer_status.objects.select_for_update().filter(name=request.POST.get('name',''),computer_name=request.POST.get('computer_name','')).update(c_time=datetime.now())
            print(e)
        finally:
            conn.close()
        # update = Computer_status(name=request.POST.get('name',''),name_yu=request.POST.get('name_yu',''),computer_name=request.POST.get('computer_name','')
        # update.save()
    # name = models.CharField(max_length=100)             #用户名
    # name_yu = models.CharField(max_length=20)           #域
    # computer_name = models.CharField(max_length=100)    #计算机名
    # system_type = models.CharField(max_length=100)      #系统类型
    # c_cpu = models.CharField(max_length=100)            #CPU
    # c_memory = models.CharField(max_length=100)         #内存
    # c_network = models.CharField(max_length=100)        #网卡
    # c_display = models.CharField(max_length=100)        #显示
#         if username == 'admin' and password =='admin123':
#             return HttpResponseRedirect('/event_manage/')
#         else:
#             return render(request,'index.html',{'error':'username or password error!'})
#
# def event_manage(request):
#     return render(request,"event_manage.html")
        return HttpResponse("成功")

#信息展示模块
def event_manage(request):

    conn = connect(host='127.0.0.1', port=3306, user='root', passwd='123456', db='computer_status',
                   cursorclass=cursors.DictCursor)
    myconn = conn.cursor()
    sql = 'SELECT * FROM sign_computer_status'
    myconn.execute(sql)
    r_computer_status = myconn.fetchall()
    number = len(r_computer_status)

    if request.method=="POST":
        global QUANJU
        QUANJU = request.POST.get('ziduan')
        r_computer_status.sort(key=function)
        return render(request, 'dis_em.html', {'computer_statuses': r_computer_status, 'number': number})

    return render(request,'event_manage.html',{'computer_statuses':r_computer_status,'number':number})

#在线资产测试模块
def Statistical_computer(request):
    flag = dict()
    conn = connect(host='127.0.0.1', port=3306, user='root', passwd='123456', db='computer_status',
                   cursorclass=cursors.DictCursor)
    myconn = conn.cursor()
    print('=============')
    print(request.GET.get('computer_statuses'))
    print('=============')
    sql = 'SELECT * FROM sign_computer_status'
    myconn.execute(sql)
    r_computer_status = myconn.fetchall()
    # if (request.GET.get(index_name)==""):
    #
    # else:
        #r_computer_status =
    number = len (r_computer_status)
    for flag_computer_status in r_computer_status:
        print(flag_computer_status['c_network'])
        backinfo = os.system('ping -n 1 -w 1 %s'%flag_computer_status['c_network'])
        flag[flag_computer_status['c_network']] = backinfo
        print(flag[flag_computer_status['c_network']])
    return render(request,'Statistical_computer.html',{"computer_statuses":r_computer_status,'flag':flag,'number':number})

#返回字典值
@register.filter
def get_item(dictionary, key):
    return dictionary.get(key)

#返回余数，用于界面css类表单样式处理
@register.filter
def get_quyu(number):
    return number % 2

#索引处理模块1
def search_name(request):
    conn = connect(host='127.0.0.1', port=3306, user='root', passwd='123456', db='computer_status',
                   cursorclass=cursors.DictCursor)
    myconn = conn.cursor()
    sql = '''SELECT * FROM sign_computer_status WHERE {0} like '%{1}%' '''.format(request.GET.get('index_computer'),request.GET.get('index_name'))
    #val =(request.GET.get('index_name'))
    myconn.execute(sql)
    index_computer_status = myconn.fetchall()
    #print(len(index_computer_status))
    number = len(index_computer_status)
    return render(request,'event_manage.html',{'computer_statuses':index_computer_status,'number':number})

#索引处理模块2
def Statistical_computer_in(request):
    flag = dict()
    conn = connect(host='127.0.0.1', port=3306, user='root', passwd='123456', db='computer_status',
                   cursorclass=cursors.DictCursor)
    myconn = conn.cursor()
    sql = '''SELECT * FROM sign_computer_status WHERE {0} like '%{1}%' '''.format(request.GET.get('index_computer'),request.GET.get('index_name'))
    #val =(request.GET.get('index_name'))
    myconn.execute(sql)
    index_computer_status = myconn.fetchall()
    number = len(index_computer_status)
    for flag_computer_status in index_computer_status:
        print(flag_computer_status['c_network'])
        backinfo = os.system('ping -n 1 -w 1 %s'%flag_computer_status['c_network'])
        flag[flag_computer_status['c_network']] = backinfo
        print(flag[flag_computer_status['c_network']])
    return render(request,'Statistical_computer.html',{'computer_statuses':index_computer_status,'flag':flag,'number':number})

#显示IP添加MAC地址
def show_ip(request):
    print("调用成功！！！！！")
    password = "PcFree2014"
    tip = "192.168.20.1"
    cmd = "show arp"
    confComplete=""
    moreReg = '--More--'
    conn = connect(host='127.0.0.1', port=3306, user='root', passwd='123456', db='computer_status',
                   cursorclass=cursors.DictCursor)
    myconn = conn.cursor()
    try:
        tn = telnetlib.Telnet(tip,port=23,timeout=50)
        tn.read_until(b"Password:")
        tn.write(password.encode('ascii') + b'\n')
        time.sleep(1)
    except Exception as e:
        print(e)

    if request.method=='POST':
        print(2222, tn.read_very_eager())
        tn.write(b'\n')
        tn.write(b'enable\n')
        tn.read_until(b'Password:')
        tn.write(password.encode('ascii') + b'\n')
        print(111,tn.read_very_eager())
        password = "conf terminal"
        tn.write(password.encode('ascii') + b'\n')
        print(222,tn.read_very_eager())
        password = "mac access-list extended macin"
        tn.write(password.encode('ascii') + b'\n')
        print(333,tn.read_very_eager())
        password = "permit host " + request.POST.get('str_1','') + " any "
        print(password)
        tn.write(password.encode('ascii') + b'\n')
        password = "exit"
        tn.write(password.encode('ascii') + b'\n')
        tn.write(password.encode('ascii') + b'\n')
        password = "wr"
        tn.write(password.encode('ascii') + b'\n')
    else:
        tn.write(b'\n')
        tn.write(b'enable\n')
        tn.read_until(b'Password:')
        tn.write(password.encode('ascii') + b'\n')
        tn.read_very_eager()
        tn.write(cmd.encode('ascii') + b'\n')
        time.sleep(1)
        msg = tn.read_very_eager().decode('utf-8')
        moerFlag = re.search(moreReg, msg)
        confComplete = re.sub(moreReg, ' ', confComplete)
        confComplete = confComplete + msg
        while (moerFlag):
            tn.write(' '.encode('ascii'))
            time.sleep(0.2)
            msg = tn.read_very_eager().decode('utf-8')
            moerFlag = re.search(moreReg,msg)
            confComplete = re.sub(moreReg,' ',confComplete)
            confComplete = confComplete + msg
            #print(msg)


        filename = 'test_text.txt'
        with open(filename, 'w') as file_object:
            file_object.write(confComplete)
            file_object.close
        with open(filename, 'r') as file_object:

            sql = 'truncate sign_show_address'
            myconn.execute(sql)
            sql='INSERT INTO sign_show_address(protocol,address,min,ip_mac,ip_type,interface) VALUE (%s,%s,%s,%s,%s,%s)'
            for moreReg in file_object.readlines():
                moreReg = re.sub("\\n","",moreReg)
                moreReg = re.sub(" +"," ",moreReg)
                #list_num = moreReg.split(' ')
                if "Internet" in moreReg:
                    myconn.execute(sql,moreReg.split(' '))
                    conn.commit()
            file_object.close
    sql = 'SELECT * FROM sign_show_address'
    myconn.execute(sql)
    r_show_address = myconn.fetchall()
    number = len(r_show_address)
    conn.close
    tn.close
    return render(request,"show_ip.html",{"r_show_address":r_show_address,"number":number})

#组合生成数据表和索引用于盘点
def input_datebase(request):
    #表1  电脑查询
    conn = connect(host='127.0.0.1', port=3306, user='root', passwd='123456', db='computer_status',
                   cursorclass=cursors.DictCursor)
    myconn = conn.cursor()
    sql = 'SELECT it_number,asset_users,seat_number,name_yu FROM sign_computer_status union all SELECT o_number,o_seat_number,o_seat_number,o_category FROM sign_o_assets '
    myconn.execute(sql)
    r_computer_status = myconn.fetchall()
    print(111111111,r_computer_status)
    #表2 其他查询
    # o_number：资产编号
    # o_seat_number：资产使用者
    # o_seat_number：具体位置

    # sql = 'SELECT o_number,o_seat_number,o_seat_number,o_category FROM sign_o_assets '
    # myconn.execute(sql)
    # r_assets = myconn.fetchall()
    # #组合数据 表1 + 表2
    # r_assets = r_assets + r_computer_status

    #创建以当前时间为表的名字，和建立索引
    table_name = "table_" + time.strftime('%Y-%m-%d_%H_%M',time.localtime())
    print(22222,table_name)
    #先查询表的最后一个数据
    #select * from test_limit order by id DESC limit 1;
    #sql = '''CREATE TABLE table_name ('id_num' auto_increment NOT NULL,'id_name'  VARCHAR(100) )'''

    sql = '''INSERT INTO sign_number_table (tab_name) VALUE (%s)'''
    myconn.execute(sql,table_name)
    print(333333,sql+"====="+table_name)

    try:
        #创建表
        sql = '''CREATE TABLE `{0}` (`it_number` VARCHAR(100),`asset_users`  VARCHAR(100),`seat_number`  VARCHAR(100),`category`  VARCHAR(100),`flag` VARCHAR (1) )'''.format(table_name)
        myconn.execute(sql)
        print(555555,sql)
        #添加数据
        sql = '''INSERT INTO `{0}` (it_number,asset_users,seat_number,category,flag) VALUE (%s,%s,%s,%s,%s)'''.format(table_name)
        print(66666666, r_computer_status)
        for r_assets_text in r_computer_status:

            val = (r_assets_text['it_number'],r_assets_text['asset_users'],r_assets_text['seat_number'],r_assets_text['name_yu'],"0")
            myconn.execute(sql,val)
            conn.commit()

    except Exception as e:
        print(e)
        print(4444444,sql+"====="+table_name)
        conn.close
    finally:
        conn.close

    return HttpResponse("成功")
# class number_inspect(models.Model):
#     in_number = models.CharField(verbose_name="资产编号",max_length=100,blank=True)
#     in_users = models.CharField(verbose_name="资产使用者", max_length=100, blank=True)
#     in_seat_number = models.CharField(verbose_name="具体位置", max_length=100, blank=True)
#     in_category = models.CharField(verbose_name="类别", max_length=100, blank=True)
#     in_time = models.DateTimeField(verbose_name="更新时间", max_length=100, blank=True)
#     in_flag = models.CharField(verbose_name="确认标志", max_length=10, blank=True)
#     in_category = models.CharField(verbose_name="备注", max_length=100, blank=True)

#资产管理处置界面
def Inventory(request):

    print("aaaaaaaaaaaaaaa")
    conn = connect(host='127.0.0.1', port=3306, user='root', passwd='123456', db='computer_status',
                   cursorclass=cursors.DictCursor)
    myconn = conn.cursor()
    #JQ传递资产编号，用于确认状态查询
    if request.method == 'POST':

        it_table = request.POST.get('in_table')#普查的表名in_table
        it_number = request.POST.get('it_number')#资产编号it_number

        if it_number is not None:
            sql = """SELECT flag FROM `{0}` WHERE it_number = %s""".format(it_table)
            myconn.execute(sql,it_number)
            it_number_value = myconn.fetchone()
            print("333333333333333")

            print(it_number_value)
            if it_number_value['flag'] == '0':
                sql = """UPDATE `{0}` SET flag = 1 WHERE it_number = %s""".format(it_table)
                myconn.execute(sql,it_number)
                print(sql,it_number)
                conn.commit()
                print("000000000000")
            else:
                sql = """UPDATE `{0}` SET flag = 0 WHERE it_number = %s""".format(it_table)
                myconn.execute(sql, it_number)
                conn.commit()
                print(sql, it_number)
                print("111111111111")

        sql = 'SELECT * FROM sign_number_table'
        myconn.execute(sql)
        in_table = myconn.fetchall()
        sql = """SELECT * FROM `{0}`""".format(it_table)
        myconn.execute(sql)
        show_vlaue = myconn.fetchall()
        myconn.close()
        conn.close()
        return render(request, "up.html", {"table":it_table, "vlaue":show_vlaue})
    else:
        sql = 'SELECT * FROM sign_number_table'
        myconn.execute(sql)
        in_table = myconn.fetchall()
        print("============",in_table)
        sql = """SELECT * FROM `{0}`""".format(in_table[0].get('tab_name'))

        myconn.execute(sql)
        print("2222222222222222222222")
        show_vlaue = myconn.fetchall()
    myconn.close()
    conn.close()
    return render(request,"Inventory.html",{"table":in_table,"vlaue":show_vlaue})

#资产盘点页面专用返回
def up_Inventory(request):

    if request.method == 'POST':
        #it_table = request.POST.get('in_table')  # 普查的表名in_table
        conn = connect(host='127.0.0.1', port=3306, user='root', passwd='123456', db='computer_status',
                       cursorclass=cursors.DictCursor)
        myconn = conn.cursor()

        sql = """SELECT * FROM `{0}`""".format(request.POST.get('in_table'))
        myconn.execute(sql)
        show_vlaue = myconn.fetchall()
        if request.POST.get('id_num') == "2":
            global QUANJU
            QUANJU = request.POST.get('ziduan')
            show_vlaue.sort(key=function)
            sql = 'SELECT * FROM sign_number_table'
            myconn.execute(sql)
            it_table = myconn.fetchall()
            print("111111111",it_table)
            myconn.close()
            conn.close()

            return render(request, "up.html", {"table": it_table, "vlaue": show_vlaue})

#列表sort字典排序返回值
def function(ziduan):

    return ziduan[QUANJU]

#图片转换成字符
def char_png(request):

    if request.method =="POST":
        print(request.FILES.get('myfile'))
        File = request.FILES.get('myfile',None)

        if File is None:
            return HttpResponse("没有选中文件")

        else:
            with open("c:/ccd_cm/tmp/%s" % File.name, 'wb+') as f:
                for chunk in File.chunks():
                    f.write(chunk)

            #f = open("c:/ccd_cm/tmp/%s" % File.name, 'wb+')
            image_file = Image.open("c:/ccd_cm/tmp/%s" % File.name)
            image_file = image_file.resize((60,60),Image.NEAREST)
            txt = ""
            for i in range(60):
                for j in range(60):
                    txt +=get_char(*image_file.getpixel((j,i)))
                txt += "\n"

        return render(request,"show_jpg.html",{'jpg':txt})

    else:
        return render(request,"zhuanhuan.html")
    #判断是否图片
    # if (img.lower().endswith(('.bmp', '.dib', '.png', '.jpg', '.jpeg', '.pbm', '.pgm', '.ppm', '.tif', '.tiff'))):
    #     print(img)
    # else:
    #     print('请选择正确的图片格式')


    # count = len(codeLib)
    # im = Image.open(IMG)
    # im = im.resize((WIDTH, HEIGHT), Image.NEAREST)
    #
    # txt = ""
    #
    # for i in range(HEIGHT):
    #     for j in range(WIDTH):
    #         txt += get_char(*im.getpixel((j, i)))
    #     txt += '\n'
    #
    # print(txt)

    # 字符画输出到文件
    # if OUTPUT:
    #     with open(OUTPUT, 'w') as f:
    #         f.write(txt)
    # else:
    #     with open("output.txt", 'w') as f:
    #         f.write(txt)






#字符画转换公式
def get_char(r,g,b,alpha = 256):

    codeLib = '''@B%8&WM#*oahkbdpqwmZO0QLCJUYXzcvunxrjft/\|()1{}[]?-_+~<>i!lI;:,"^`'. '''  # 生成字符画所需的字符集
    if alpha == 0:
        return '.'
    length = len(codeLib)
    gray = int(0.2126 * r + 0.7152 * g + 0.0722 * b)

    unit = (256.0 + 1)/length
    return codeLib[int(gray/unit)]

# $.post("/index_house/")
# var
# data = {{List | safe}}
# alert(data)

def index_house(request):
    # if request.method =="POST":
    #     with codecs.open("c:/ccd_cm/tmp/rent.csv" , 'r','utf_8_sig') as f:
    #         List = csv.reader(f)
    #     print("11111")
    #     return render(request,"index_house.html",{'List':json.dumps(List)})
    return render(request,"index_house.html")

def in_huose(request):

    # 网址
    url = "https://sh.58.com/pinpaigongyu/pn/{page}/?minprice=1000_4000"
    page = 0
    csv_file = open("rent.csv","w",encoding="utf-8")
    csv_writer = csv.writer(csv_file,delimiter=',')

    while True:
        page += 1
        print("fetch: ", url.format(page=page))
        time.sleep(1)

        response = requests.get(url.format(page=page))

        response.encoding = 'utf-8'
        html1 = BeautifulSoup(response.text,features="lxml")



        text = str(html.unescape(html1))  # 将&#x958f;室变为閏室
        key = re.findall(r"base64,(.*)'\) format", text)[0]  # 用正则表达式提取AAE..AAA
        dehtml = decode58Fangchan(text, key)
        html1 = BeautifulSoup(dehtml)
        house_list = html1.select(".list > li")
        # moneyTags = soup.find_all('div', 'money')
        # print(','.join([m.b.text.strip() for m in moneyTags]))
        if not house_list:
            break

        for house in house_list:
            house_title = house.select("h2")[0].string

            house_url = house.select("a")[0]["href"]
            house_info_list = house_title.split()

            if "公寓" in house_info_list[1] or "青年社区" in house_info_list[1]:
                house_location = house_info_list[0]
            else:
                house_location = house_info_list[1]

            house_money = house.select(".money")[0].select("b")[0].string
            house_title = "".join(house_title.split())
            house_location = "".join(house_location.split())
            house_money = "".join(house_money.split())
            house_url = "".join(house_url.split())
            print([house_title, house_location, house_money, house_url])
            csv_writer.writerow([house_title,house_location,house_money,house_url])


    csv_file.close()

    return HttpResponse("成功！")

def decode58Fangchan(html,key):
    glyphdict = {
        'glyph00001': '0',
        'glyph00002': '1',
        'glyph00003': '2',
        'glyph00004': '3',
        'glyph00005': '4',
        'glyph00006': '5',
        'glyph00007': '6',
        'glyph00008': '7',
        'glyph00009': '8',
        'glyph00010': '9'
    }
    data = base64.b64decode(key)  #base64解码
    fonts = TTFont(io.BytesIO(data))  #生成二进制字节
    cmap = fonts.getBestCmap()  #十进制ascii码到字形名的对应{38006:'glyph00002',...}
    chrMapNum = {}  #将变为{‘龥’:'1',...}
    for asc in cmap:
        chrMapNum[chr(asc)] = glyphdict[cmap[asc]]

    return multReplace(html,chrMapNum)

#使用字典批量替换


def multReplace(text, rpdict):
    rx = re.compile('|'.join(map(re.escape, rpdict)))
    return rx.sub(lambda match:rpdict[match.group(0)], str(text))