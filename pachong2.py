import requests
from bs4 import BeautifulSoup
import bs4

href_list = []
div_list = []
img_list = []
names = []
info_dict = {}

try:
    url = "https://www.lanqiao.cn/courses/"
    r = requests.get(url)
    r.raise_for_status
    r.encoding = r.apparent_encoding
    demo = r.text

except:
    print("未能获取页面内容")

soup = BeautifulSoup(demo,"html.parser")

div = soup.find('body').div
a = div.find_all('a','link block')

for i in a:

    href_list.append("https://www.lanqiao.cn" + i.get('href'))
    
    div_list.append(i.find('div','course-cover relative'))

for i in div_list:
    img_list.append(i.find('img'))

for i in img_list:
    names.append(i.get('alt'))

for i in range(0,len(names)):
    info_dict[names[i]] = href_list[i]

print(info_dict)
