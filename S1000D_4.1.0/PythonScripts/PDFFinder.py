# !/usr/bin/env ipy
# -*- coding: UTF-8 -*-
import clr
import os

clr.AddReference("System.Windows.Forms")

from System.Windows.Forms import MessageBox
# from System.Windows.Forms import DialogResult


class LastPDFFinder:
    def __init__(self, folder):
        self.folder = folder

    def get_latest_folder(self):
        try:
            folders = [f for f in os.listdir(self.folder) if os.path.isdir(os.path.join(self.folder, f))]
            if not folders:
                return None
            latest_folder = max(folders, key=lambda f: os.path.getctime(os.path.join(self.folder, f)))
            latest_folder_path = os.path.join(self.folder, latest_folder)

            xmldone_folder = os.path.join(latest_folder_path, 'xmldone')
            if not os.path.exists(xmldone_folder):
                return None

            pdf_files = [f for f in os.listdir(xmldone_folder) if f.lower().endswith('.pdf')]
            if not pdf_files:
                MessageBox.Show(u"PDF-файл не найден в папке XMLDone.")
            else:
                latest_pdf = max(pdf_files, key=lambda f: os.path.getctime(os.path.join(xmldone_folder, f)))
                return os.path.join(xmldone_folder, latest_pdf)
        except Exception as e:
            MessageBox.Show(u"Ошибка при поиске PDF-файла, опубликуйте документ (МД или МП): " + '\n' + str(e).lstrip("[Errno 2,3]"))

        return None


# # Пример использования
# temp_folder = os.path.join(os.environ["LOCALAPPDATA"], "Temp\\Libroplanta_temp")
# temp_folder_obj = LastPDFFinder(temp_folder)
# latest_pdf_file = temp_folder_obj.get_latest_folder()
# if latest_pdf_file:
#     print(latest_pdf_file)
#
# # Продолжение выполнения кода
# print(u"Prodolzhenie vy`polneniia koda...")
