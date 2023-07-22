# !/usr/bin/env ipy
# -*- coding: UTF-8 -*-


import os
import win32com.client as win32


class OutlookEmail:
    def __init__(self, recipient, subject, body):
        self.recipient = recipient
        self.subject = subject
        self.body = body

    def send_email(self):
        outlook = win32.Dispatch('Outlook.Application')
        mail = outlook.CreateItem(0)
        mail.To = self.recipient
        mail.Subject = self.subject
        mail.Body = self.body

        # Add signature to the email
        signature_path = os.path.join(os.getenv('APPDATA') + '\\Microsoft\Signatures\Подпись.htm')
        print(signature_path)
        if os.path.isfile(signature_path):
            with open(signature_path, 'r') as f:
                signature_html = f.read()
            mail.HTMLBody = self.body + signature_html

        mail.Display(True)


email = OutlookEmail('recipient@example.com', 'Test email', 'Hello, world!')
email.send_email()
