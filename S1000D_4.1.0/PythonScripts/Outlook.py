# !/usr/bin/env ipy
# -*- coding: UTF-8 -*-


import clr
clr.AddReference("Microsoft.Office.Interop.Outlook")

from Microsoft.Office.Interop import Outlook

class OutlookManager:
    def __init__(self):
        self.outlook = Outlook.ApplicationClass()
        self.namespace = self.outlook.GetNamespace("MAPI")
        self.inbox = self.namespace.GetDefaultFolder(Outlook.OlDefaultFolders.olFolderInbox)

    def create_new_email(self, subject, body=None, attachment_path=None):
        mail_item = self.outlook.CreateItem(Outlook.OlItemType.olMailItem)
        mail_item.Subject = subject
        if body is not None:
            mail_item.Body = body
        if attachment_path is not None:
            mail_item.Attachments.Add(attachment_path)
        mail_item.Display()

# # Пример использования класса OutlookManager
# outlook_manager = OutlookManager()
# outlook_manager.create_new_email("Тема письма", "Текст письма")