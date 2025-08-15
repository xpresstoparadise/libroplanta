#!/usr/bin/env ipy
# -*- coding: UTF-8 -*-

import clr
import sys

sys.path.append("D:\S1000D XML Editor\PythonScripts\Lib")
sys.path.append("D:\S1000D XML Editor\PythonScripts")
OUT = []

import os
import shutil
import tempfile
import datetime
import io
import System
import re
import itertools

path = sys.argv[0]
sys.path.append(path)
clr.AddReference("Fluent")
clr.AddReference("PresentationFramework")
clr.AddReference("System.Net")
clr.AddReference("System.Xml.Linq")
clr.AddReference("System.Core")
clr.AddReference("System.Windows")
clr.AddReference("System.Windows.Forms")
clr.AddReference("PresentationCore")
clr.AddReference("System.Collections")
clr.AddReference("System.Xaml")

import Fluent
from System.Net import WebClient
from System.Collections.Generic import List
from System.Windows.Controls import StackPanel, TextBlock, TextBox, ScrollViewer, Button, Image, Separator, Grid, ColumnDefinition
from System.Windows.Markup import XamlReader
from System.Windows.Media import SolidColorBrush, Colors
from System.Text import Encoding
from System.Xml.Linq import XDocument, XNamespace
from System.Windows import HorizontalAlignment, VerticalAlignment
from itertools import groupby
from System import Environment
from System import Uri
from System.Windows import Thickness, GridLength
from System.Diagnostics import Process
from System.Windows.Media.Imaging import BitmapImage, BitmapCacheOption
from System.Windows.Forms import FolderBrowserDialog, DialogResult, Form

now = datetime.datetime.now()
date_time = now.strftime("%H-%M-%S_%Y-%m-%d")

path = Environment.CurrentDirectory + "\\PythonScripts\\"  # путь до скриптов

# Main entry point of opening window
def LoadWindow():
    # os.chdir("D:\\S1000D XML Editor\\PythonScripts")
    # os.chdir("D:\\S1000D XML Editor\\DocTypes\\S1000D_4.1.0\\PythonScripts\\")
    stackPanel = StackPanel()

    grid = Grid()
    grid.HorizontalAlignment = HorizontalAlignment.Left

    # Определение столбцов
    column1 = ColumnDefinition()
    column2 = ColumnDefinition()
    column1.Width = GridLength.Auto
    column2.Width = GridLength.Auto
    grid.ColumnDefinitions.Add(column1)
    grid.ColumnDefinitions.Add(column2)

    text = TextBlock()
    text.Text = "IRKUT Customization for Libroplanta XML Editor (External PDF Publisher)"
    color = SolidColorBrush(Colors.MediumBlue)
    text.Foreground = color
    text.FontSize = 24
    text.HorizontalAlignment = HorizontalAlignment.Left
    text.Margin = Thickness(10, 0, 0, 0)

    text1 = TextBlock()
    text1.Text = "Укажите путь к папке с модулями данных S1000D:"
    color = SolidColorBrush(Colors.MediumBlue)
    text1.Foreground = color
    text1.FontSize = 14
    text1.HorizontalAlignment = HorizontalAlignment.Left
    text1.Margin = Thickness(10, 0, 0, 0)

    folder_path = TextBox()
    folder_path.Width = 600  # Ширина текстового поля
    folder_path.HorizontalAlignment = HorizontalAlignment.Left
    folder_path.Margin = Thickness(10)
    Grid.SetColumn(folder_path, 0)  # Размещение во втором столбце

    button_select = Button()
    button_select.Content = "Выбрать папку"
    button_select.Width = 100  # Ширина кнопки
    button_select.Height = 10 # Высота кнопки
    button_select.HorizontalAlignment = HorizontalAlignment.Left
    button_select.Margin = Thickness(5, 0, 0, 0)
    Grid.SetColumn(button_select, 1)  # Размещение во втором столбце

    button_copy_and_run = Button()
    button_copy_and_run.Content = "Опубликовать"
    button_copy_and_run.Width = 200  # Ширина кнопки
    button_copy_and_run.Height = 50  # Высота кнопки
    button_copy_and_run.FontSize = 18
    button_copy_and_run.HorizontalAlignment = HorizontalAlignment.Left
    button_copy_and_run.Margin = Thickness(10, 10, 5, 0)


    button_clear_cache = Button()
    button_clear_cache.Content = "Очистить кэш"
    button_clear_cache.Width = 200  # Ширина кнопки
    button_clear_cache.Height = 50
    button_clear_cache.FontSize = 18
    button_clear_cache.HorizontalAlignment = HorizontalAlignment.Left
    button_clear_cache.Margin = Thickness(10, 10, 0, 0)

    separator = Separator()
    separator.Height = 50

    grid.Children.Add(folder_path)
    grid.Children.Add(button_select)

    stackPanel.Children.Add(text)
    stackPanel.Children.Add(image)
    stackPanel.Children.Add(separator)
    stackPanel.Children.Add(text1)
    stackPanel.Children.Add(grid)
    # stackPanel.Children.Add(folder_path)
    # stackPanel.Children.Add(button_select)
    stackPanel.Children.Add(button_copy_and_run)
    stackPanel.Children.Add(button_clear_cache)

    scrollView = ScrollViewer()
    scrollView.Content = stackPanel

    backstage = Fluent.BackstageTabItem()
    backstage.Header = "Публикация документа S1000D"
    backstage.Icon = BitmapImage(Uri(path + "211404.png"))
    backstage.Content = scrollView

    ApiWindow.Backstage.Items.Add(backstage)


    def select_folder(sender, event):
        dialog = FolderBrowserDialog()
        result = dialog.ShowDialog()
        if result == DialogResult.OK:
            folder_path.Text = dialog.SelectedPath
    button_select.Click += select_folder

    def copy_and_run(sender, event):
        temp_folder = os.path.join(os.path.expandvars("%LOCALAPPDATA%"),
                                   "Temp\\Libroplanta_temp")  # строим путь к папке пользователя AppData\Local\Temp
        temp_folder = tempfile.mkdtemp(prefix=date_time + '_', dir=temp_folder,
                                       suffix='')  # создаем временную директорию в папке пользователя AppData\Local\Temp

        source_folder = folder_path.Text  # Исходная папка
        target_folder = temp_folder  # Целевая папка

        subfolder_temp = "temp"
        subfolder_log = "log"
        subfolder_XMLDone = "XMLDone"
        subfolder_xml = "XML"

        subfolder_temp_path = os.path.join(target_folder, subfolder_temp)
        subfolder_log_path = os.path.join(target_folder, subfolder_log)
        subfolder_XMLDone_path = os.path.join(target_folder, subfolder_XMLDone)
        subfolder_xml_path = os.path.join(target_folder, subfolder_xml)

        if not os.path.exists(subfolder_xml_path):
            os.mkdir(subfolder_temp_path)
            os.mkdir(subfolder_log_path)
            os.mkdir(subfolder_XMLDone_path)
            os.mkdir(subfolder_xml_path)

        # Копирование файлов
        for file_name in os.listdir(source_folder):
            source_file = os.path.join(source_folder, file_name)
            target_file = os.path.join(subfolder_xml_path, file_name)
            shutil.copy(source_file, target_file)

        # Create CMD
        publication_standalone_cmd = temp_folder + "\\publication_standalone.cmd"
        cmd_text = """for /f "delims=" %%x in (config.txt) do (set "%%x")
                        set STANDALONE_PUB_HOME=%~dp0
                        set CMD_LINE_ARGS=%*
                        set TEMP_FOLDER=%TEMP%
                        cscript //E:jscript "%SERVER_PUB_HOME%publisher\\res\script\\test.js" ^
                            -pubSource "%SERVER_PUB_HOME%pubSource_issue.xml" ^
                            -temp "%STANDALONE_PUB_HOME%temp" ^
                            -xmlPath "%STANDALONE_PUB_HOME%XML" ^
                            -pmPreviousPath "%STANDALONE_PUB_HOME%pmPrevious" ^
                            -resultPath "%STANDALONE_PUB_HOME%XMLDone" ^
                            -log "%STANDALONE_PUB_HOME%log" ^
                            -standalone ^
                            -mode "singleDM"^
                            %CMD_LINE_ARGS%"
                        """
        with io.open(publication_standalone_cmd, "w", newline='', encoding='utf-8') as file:
            file.write(cmd_text)
        # Запуск командной строки
        Process.Start(temp_folder + "\\publication_standalone.cmd")
    button_copy_and_run.Click += copy_and_run

    def clear_cache(sender, event):
        # Получаем путь к папке Appdata\local\temp
        temp_dir_path = os.path.join(os.environ["LOCALAPPDATA"], "Temp\\Libroplanta_temp")
        shutil.rmtree(temp_dir_path, ignore_errors=True)
    button_clear_cache.Click += clear_cache

image = Image()
image_path = os.path.join(path + "IrkutLogo.png")  # Путь к изображению
if os.path.exists(image_path):
    bitmap_image = BitmapImage()
    bitmap_image.BeginInit()
    bitmap_image.CacheOption = BitmapCacheOption.OnLoad
    bitmap_image.UriSource = Uri(image_path)
    bitmap_image.DecodePixelWidth = 274
    bitmap_image.DecodePixelHeight = 56
    bitmap_image.EndInit()
    image.Source = bitmap_image
    image.Width = bitmap_image.DecodePixelWidth  # Установка ширины изображения
    image.Height = bitmap_image.DecodePixelHeight  # Установка высоты изображения
    image.HorizontalAlignment = HorizontalAlignment.Left  # Горизонтальное выравнивание
    image.VerticalAlignment = VerticalAlignment.Top  # Вертикальное выравнивание
    image.Margin = Thickness(10)