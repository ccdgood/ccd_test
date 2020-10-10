import requests
from bs4 import BeautifulSoup
import bs4
info = []
i=0
r = requests.get("http://www.shanghairanking.cn/rankings/arwu/2020")

r.encoding = r.apparent_encoding

html = r.text
soup = BeautifulSoup(html,"html.parser")
data = soup.find("tbody").children
for tr in data:

    if isinstance(tr,bs4.element.Tag):
        tds = tr.find_all('td')
        info.append([tds[0].string,tds[1].string,tds[4].string])
        print (info)
    
print(info)
