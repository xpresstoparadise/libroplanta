#!/usr/bin/env ipy
# -*- coding: UTF-8 -*-

import clr
import sys
import os
import shutil
import tempfile
import datetime
import io
import System
import re
import itertools

OUT = []

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

# Определяем директорию, где лежат скрипты
python_scripts_dir = os.path.dirname(os.path.abspath(sys.argv[0]))
project_root = os.path.dirname(python_scripts_dir)
path = python_scripts_dir # Оставляем для обратной совместимости

# Main entry point of opening window
def LoadWindow():
    # --- Константы ---
    WINDOW_TITLE = "IRKUT Customization for Libroplanta XML Editor (External PDF Publisher)"
    FOLDER_PROMPT_TEXT = "Укажите путь к папке с модулями данных S1000D:"

    stackPanel = StackPanel()

    grid = Grid()
    grid.HorizontalAlignment = HorizontalAlignment.Left

    # --- Определение столбцов для Grid ---
    column1 = ColumnDefinition()
    column2 = ColumnDefinition()
    column1.Width = GridLength.Auto
    column2.Width = GridLength.Auto
    grid.ColumnDefinitions.Add(column1)
    grid.ColumnDefinitions.Add(column2)

    # --- Создание UI элементов ---
    text = TextBlock(
        Text=WINDOW_TITLE,
        Foreground=SolidColorBrush(Colors.MediumBlue),
        FontSize=24,
        HorizontalAlignment=HorizontalAlignment.Left,
        Margin=Thickness(10, 0, 0, 0)
    )

    # --- Загрузка изображения IrkutLogo.png ---
    image = Image()
    image_path = os.path.join(path, "IrkutLogo.png")
    if os.path.exists(image_path):
        bitmap_image = BitmapImage()
        bitmap_image.BeginInit()
        bitmap_image.CacheOption = BitmapCacheOption.OnLoad
        bitmap_image.UriSource = Uri(image_path)
        bitmap_image.DecodePixelWidth = 274
        bitmap_image.DecodePixelHeight = 56
        bitmap_image.EndInit()
        image.Source = bitmap_image
        image.Width = bitmap_image.DecodePixelWidth
        image.Height = bitmap_image.DecodePixelHeight
        image.HorizontalAlignment = HorizontalAlignment.Left
        image.VerticalAlignment = VerticalAlignment.Top
        image.Margin = Thickness(10)

    text1 = TextBlock(
        Text=FOLDER_PROMPT_TEXT,
        Foreground=SolidColorBrush(Colors.MediumBlue),
        FontSize=14,
        HorizontalAlignment=HorizontalAlignment.Left,
        Margin=Thickness(10, 0, 0, 0)
    )

    folder_path = TextBox()
    folder_path.Width = 600
    folder_path.HorizontalAlignment = HorizontalAlignment.Left
    folder_path.Margin = Thickness(10)
    Grid.SetColumn(folder_path, 0)

    button_select = Button()
    button_select.Content = "Выбрать папку"
    button_select.Width = 100
    button_select.Height = 10
    button_select.HorizontalAlignment = HorizontalAlignment.Left
    button_select.Margin = Thickness(5, 0, 0, 0)
    Grid.SetColumn(button_select, 1)

    button_copy_and_run = Button()
    button_copy_and_run.Content = "Опубликовать"
    button_copy_and_run.Width = 200
    button_copy_and_run.Height = 50
    button_copy_and_run.FontSize = 18
    button_copy_and_run.HorizontalAlignment = HorizontalAlignment.Left
    button_copy_and_run.Margin = Thickness(10, 10, 5, 0)

    button_clear_cache = Button()
    button_clear_cache.Content = "Очистить кэш"
    button_clear_cache.Width = 200
    button_clear_cache.Height = 50
    button_clear_cache.FontSize = 18
    button_clear_cache.HorizontalAlignment = HorizontalAlignment.Left
    button_clear_cache.Margin = Thickness(10, 10, 0, 0)

    separator = Separator()
    separator.Height = 50

    # --- Сборка UI ---
    grid.Children.Add(folder_path)
    grid.Children.Add(button_select)

    stackPanel.Children.Add(text)
    if image.Source:
        stackPanel.Children.Add(image)
    stackPanel.Children.Add(separator)
    stackPanel.Children.Add(text1)
    stackPanel.Children.Add(grid)
    stackPanel.Children.Add(button_copy_and_run)
    stackPanel.Children.Add(button_clear_cache)

    scrollView = ScrollViewer()
    scrollView.Content = stackPanel

    backstage = Fluent.BackstageTabItem()
    backstage.Header = "Публикация документа S1000D"
    backstage.Icon = BitmapImage(Uri(os.path.join(path, "211404.png")))
    backstage.Content = scrollView

    ApiWindow.Backstage.Items.Add(backstage)

    # --- Обработчики событий ---
    def select_folder(sender, event):
        dialog = FolderBrowserDialog()
        result = dialog.ShowDialog()
        if result == DialogResult.OK:
            folder_path.Text = dialog.SelectedPath
    button_select.Click += select_folder

    def copy_and_run(sender, event):
        try:
            source_folder = folder_path.Text
            if not os.path.isdir(source_folder):
                print("Ошибка: Указанный путь не является папкой или не существует.")
                return

            # Создание временной директории для публикации
            temp_root = os.path.join(os.path.expandvars("%LOCALAPPDATA%"), "Temp", "Libroplanta_temp")
            if not os.path.exists(temp_root):
                os.makedirs(temp_root)

            temp_folder = tempfile.mkdtemp(prefix=date_time + '_', dir=temp_root)

            # Создание подпапок во временной директории
            subfolder_temp = os.path.join(temp_folder, "temp")
            subfolder_log = os.path.join(temp_folder, "log")
            subfolder_XMLDone = os.path.join(temp_folder, "XMLDone")
            subfolder_xml = os.path.join(temp_folder, "XML")
            os.makedirs(subfolder_temp)
            os.makedirs(subfolder_log)
            os.makedirs(subfolder_XMLDone)
            os.makedirs(subfolder_xml)

            # Копирование файлов данных S1000D
            for file_name in os.listdir(source_folder):
                source_file = os.path.join(source_folder, file_name)
                if os.path.isfile(source_file):
                    shutil.copy(source_file, subfolder_xml)

            # Копирование файла конфигурации
            config_source_path = os.path.join(project_root, "config.txt")
            config_target_path = os.path.join(temp_folder, "config.txt")
            if os.path.exists(config_source_path):
                shutil.copy(config_source_path, config_target_path)

            # Создание и запуск CMD скрипта для публикации
            publication_standalone_cmd = os.path.join(temp_folder, "publication_standalone.cmd")
            cmd_text = """@echo off
if not exist "config.txt" (
    echo [ERROR] Файл config.txt не найден.
    echo Пожалуйста, создайте его в корневой директотории проекта и укажите в нем значение для SERVER_PUB_HOME.
    echo Пример: SERVER_PUB_HOME=C:\\Path\\To\\Libroplanta\\Publisher
    pause
    exit /b 1
)

for /f "usebackq delims=" %%x in ("config.txt") do (set "%%x")

if not defined SERVER_PUB_HOME (
    echo [ERROR] Переменная SERVER_PUB_HOME не определена в файле config.txt.
    echo Пожалуйста, задайте ее значение.
    echo Пример: SERVER_PUB_HOME=C:\\Path\\To\\Libroplanta\\Publisher
    pause
    exit /b 1
)

set STANDALONE_PUB_HOME=%~dp0
set CMD_LINE_ARGS=%*
set TEMP_FOLDER=%TEMP%
cscript //E:jscript "%SERVER_PUB_HOME%publisher\\res\\script\\test.js" ^
    -pubSource "%SERVER_PUB_HOME%pubSource_issue.xml" ^
    -temp "%STANDALONE_PUB_HOME%temp" ^
    -xmlPath "%STANDALONE_PUB_HOME%XML" ^
    -pmPreviousPath "%STANDALONE_PUB_HOME%pmPrevious" ^
    -resultPath "%STANDALONE_PUB_HOME%XMLDone" ^
    -log "%STANDALONE_PUB_HOME%log" ^
    -standalone ^
    -mode "singleDM"^
    %CMD_LINE_ARGS%
"""
            with io.open(publication_standalone_cmd, "w", newline='', encoding='utf-8') as file:
                file.write(cmd_text)

            Process.Start(publication_standalone_cmd)
        except Exception as ex:
            print("Произошла ошибка во время публикации:")
            print(str(ex))
    button_copy_and_run.Click += copy_and_run

    def clear_cache(sender, event):
        temp_dir_path = os.path.join(os.environ["LOCALAPPDATA"], "Temp", "Libroplanta_temp")
        if os.path.isdir(temp_dir_path):
            shutil.rmtree(temp_dir_path, ignore_errors=True)
    button_clear_cache.Click += clear_cache