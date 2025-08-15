# !/usr/bin/env ipy
# -*- coding: UTF-8 -*-


import os
import tempfile
import datetime

now = datetime.datetime.now()
date_time = now.strftime("%H-%M-%S_%Y-%m-%d")


class TempFolders:
    def __init__(self):
        local_appdata = os.getenv('LOCALAPPDATA')
        self.root_folder = os.path.join(local_appdata, 'Temp\\Libroplanta_temp')
        self.temp_folder = tempfile.mkdtemp(prefix=date_time + '_PM_', dir=self.root_folder)
        self.temp_subfolder = os.path.join(self.temp_folder, 'temp')
        self.log_subfolder = os.path.join(self.temp_folder, 'log')
        self.xmldone_subfolder = os.path.join(self.temp_folder, 'XMLDone')
        self.xml_subfolder = os.path.join(self.temp_folder, 'XML')

    def create_temp_folders(self):
        folders = [self.root_folder, self.temp_folder, self.temp_subfolder, self.log_subfolder, self.xmldone_subfolder,
                   self.xml_subfolder]
        for folder in folders:
            if not os.path.exists(folder):
                os.makedirs(folder)

    def get_folder_path(self):
         return {
            'root_folder': self.root_folder,
            'temp_folder': self.temp_folder,
            'temp_subfolder': self.temp_subfolder,
            'log_subfolder': self.log_subfolder,
            'xmldone_subfolder': self.xmldone_subfolder,
            'xml_subfolder': self.xml_subfolder}
