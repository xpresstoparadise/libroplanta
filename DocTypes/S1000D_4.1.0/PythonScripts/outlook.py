# !/usr/bin/env ipy
# -*- coding: UTF-8 -*-


import win32com.client as win
from bs4 import BeautifulSoup


def send_message(theme, To, Body, Att_path, Attachment=False):
    path_signature = os.getenv('APPDATA') + '\\Microsoft\\Signatures\\Подпись.htm'
    signature = html.parse(path_signature).xpath('//body')[0].text_content()
    app = win.Dispatch("Outlook.Application")
    # Создания письма
    mess = app.CreateItem(0)
    mess.To = "sakhfdsmbvmautdsdffsdfsdainov@gerdasdsafgdgdmesgroup.com"
    # В копию


    mess.CC = "kamalov@germesgroup.com"
    # Тема
    mess.Subject = theme + ' - ОТК'
    # Тело
    mess.Body = 'Добрый день\n\nДокументы размещены в папке {}\n\n {}'.format(self.server_directory, signature)
    # Отправка
    mess.Send()
