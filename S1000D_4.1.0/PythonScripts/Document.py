#!/usr/bin/env ipy
# -*- coding: UTF-8 -*-


import clr
import sys
import System
import re

sys.path.append("D:\S1000D XML Editor\PythonScripts\Lib")
sys.path.append("D:\S1000D XML Editor\PythonScripts")
sys.path.append("D:\S1000D XML Editor\DocTypes\S1000D_4.1.0\PythonScripts")

import os
import shutil
import datetime
import io
import tempfile
import re
import time
import xml.etree.ElementTree as ET
from PM_Preparation import XmlKey
from PB_CreateTempFolders import TempFolders
from PB_CreateCMD import CmdFileCreator
from Outlook import OutlookManager
from PDFFinder import LastPDFFinder
from IPDParser import ExcelWriter

path = sys.argv[0]
sys.path.append(path)

clr.AddReference("Fluent")
clr.AddReference("IronPython")
clr.AddReference("IronPython.Modules")
clr.AddReference("Microsoft.Dynamic")
clr.AddReference("Microsoft.Scripting")
clr.AddReference("Microsoft.Scripting.Metadata")
clr.AddReference("mscorlib")
clr.AddReference("PresentationCore")
clr.AddReference("PresentationFramework")
clr.AddReference("System")
clr.AddReference("System.Collections")
clr.AddReference("System.Core")
clr.AddReference("System.Data")
clr.AddReference("System.IO")
clr.AddReference("System.Windows.Forms")
clr.AddReference("System.Xml")
clr.AddReference("System.Xml.Linq")
clr.AddReference("WindowsBase")


clr.ImportExtensions(System.Linq)
clr.ImportExtensions(System.Xml.XPath)

from System.Text import Encoding
from System.Collections.Generic import List
from System.Xml.Linq import XElement, XAttribute, XNode, XDocument
from System.IO import Directory, Path, File
from System.Windows.Input import KeyGesture, Key, ModifierKeys
from System import Environment
from System.Windows.Forms import MessageBox, Application, Form, SendKeys, OpenFileDialog, DialogResult
from System.Diagnostics import Process
import System.Windows.Controls as win
import System.Threading as Threading
import Fluent
import logging

now = datetime.datetime.now()
date_time = now.strftime("%H-%M-%S_%Y-%m-%d")

# Also you can use os.getcwd() from module "os"
path = Environment.CurrentDirectory + "\\DocTypes\\S1000D_4.1.0\\PythonScripts\\"


def setup_logger(log_file):
    logger = logging.getLogger('MyLogger')
    logger.setLevel(logging.DEBUG)
    # Создаем обработчик для записи в файл
    file_handler = logging.FileHandler(log_file)
    file_handler.setLevel(logging.DEBUG)
    # Создаем форматтер для указания формата записей в логе
    formatter = logging.Formatter('%(asctime)s - %(name)s - %(levelname)s - %(message)s')
    # Назначаем обработчику форматтер
    file_handler.setFormatter(formatter)
    # Добавляем обработчик к логгеру
    logger.addHandler(file_handler)
    return logger


# Fluent-controls
def ButtonsGroupBoxControls():
    buttonControls = Fluent.RibbonGroupBox(Header="Buttons")

    largeButton = Fluent.Button(Header="Large Button", LargeIcon=path + "icons\\large.png")
    largeButton.Size = Fluent.RibbonControlSize.Large

    middleButton = Fluent.Button(Header="Middle Button", Icon=path + "icons\\medium.png")
    middleButton.Size = Fluent.RibbonControlSize.Middle

    smallButton = Fluent.Button(ToolTip="Small Button", Icon=path + "icons\\small.png")
    smallButton.Click += lambda s, e: MessageBox.Show(ApiDocument.Selection.ToString())
    smallButton.Size = Fluent.RibbonControlSize.Small

    toggleButton = Fluent.ToggleButton(Header="Toggle Button", ToolTip="Notification....")
    toggleButton.Click += lambda s, e: MessageBox.Show("Pressed: " + str(toggleButton.IsChecked), "Button Status")

    splitButton = Fluent.SplitButton(Header="splite button", LargeIcon=path + "icons\\split.png")
    gallery = Fluent.Gallery()
    gallery.Items.Add(Fluent.Button(Header="Button 1"))
    gallery.Items.Add(Fluent.Button(Header="Button 2"))
    splitButton.Items.Add(gallery)

    buttonControls.Items.Add(toggleButton)
    buttonControls.Items.Add(smallButton)
    buttonControls.Items.Add(middleButton)
    buttonControls.Items.Add(largeButton)
    buttonControls.Items.Add(splitButton)
    return buttonControls


# Other controls
def OthersGroupBoxControls():
    otherControls = Fluent.RibbonGroupBox(Header="Other")

    checkBox = Fluent.CheckBox(Header="CheckBox", IsChecked=True)
    radioButton = Fluent.RadioButton(Header="1", IsChecked=True)
    radioButton2 = Fluent.RadioButton(Header="2")

    spinner = Fluent.Spinner(Maximum=100, Minimum=0, Value=5)

    textBox = Fluent.TextBox(Width=150, Text="Hello World!")

    comboBox = Fluent.ComboBox(SelectedIndex=1, IsReadOnly=True)
    comboBox.Items.Add("Item 1")
    comboBox.Items.Add("Item 2")
    comboBox.Items.Add("Item 3")
    comboBox.Items.Add("Item 4")

    otherControls.Items.Add(radioButton)
    otherControls.Items.Add(radioButton2)
    otherControls.Items.Add(textBox)
    otherControls.Items.Add(spinner)
    otherControls.Items.Add(checkBox)
    otherControls.Items.Add(comboBox)
    return otherControls


# Regular controls
def WindowsGroupBoxControls():
    # https://msdn.microsoft.com/en-us/library/system.windows.controls(v=vs.110).aspx
    winControls = Fluent.RibbonGroupBox(Header="Windows Controls")
    button = win.Button(Content="Button")

    listBox = win.ListBox(Width=100)
    for i in range(5):
        listBox.Items.Add("Item " + str(i))

    calendar = win.DatePicker()

    progressBar = win.ProgressBar(Maximum=100, Value=55)
    slider = win.Slider(Maximum=100)

    winControls.Items.Add(button)
    winControls.Items.Add(listBox)
    winControls.Items.Add(calendar)
    winControls.Items.Add(slider)
    winControls.Items.Add(progressBar)

    return winControls


# API Examples
progressBar = win.ProgressBar()
calendar = win.DatePicker()


def ApiPanelSample():
    apiPanel = Fluent.RibbonGroupBox(Header="API Panel Sample")

    # Loading files from folder
    btnLoader = Fluent.Button(Header="Load Files", Icon=path + "icons\\medium.png")
    btnLoader.Size = Fluent.RibbonControlSize.Middle
    btnLoader.Click += ClickEventLoadFiles

    # Encasing fragment selection with verbatimText element
    btnVerbatim = Fluent.Button(Header="Verbatim")
    btnVerbatim.Size = Fluent.RibbonControlSize.Middle
    btnVerbatim.Click += ClickEventVerbatim

    # Changing issue date to the selected date "calendar"
    btnChangeDate = Fluent.Button(Header="Сhange date")
    btnChangeDate.Size = Fluent.RibbonControlSize.Middle
    btnChangeDate.Click += ClickEventChangeDate

    apiPanel.Items.Add(btnLoader)
    apiPanel.Items.Add(progressBar)
    apiPanel.Items.Add(btnVerbatim)
    apiPanel.Items.Add(btnChangeDate)
    apiPanel.Items.Add(calendar)

    return apiPanel


def PublishPanel():
    tree = ET.parse(ApiDocument.FileName)
    root_element = tree.getroot()

    publishPanel = Fluent.RibbonGroupBox(Header="Publish the S1000D document")

    # ExternalSinglePDFPublicaitionButton
    largeButtonSinglePDF = Fluent.Button(Header="External Single PDF Publicaition")
    largeButtonSinglePDF.Size = Fluent.RibbonControlSize.Large
    largeButtonSinglePDF.Click += ClickEventExternalSinglePDFPublicaition

    if root_element.tag == 'pm':
        largeButtonSinglePDF.IsEnabled = False
        largeButtonSinglePDF.LargeIcon = path + "icons\\PDF_file_icon2.png"
    else:
        largeButtonSinglePDF.IsEnabled = True
        largeButtonSinglePDF.LargeIcon = path + "icons\\PDF_file_icon.png"

    # ExternalFullPDFPublicaitionButton
    largeButtonFullPDF = Fluent.Button(Header="External Full PDF Publicaition",
                                       LargeIcon=path + "icons\\PDF_file_full.png")
    largeButtonFullPDF.Size = Fluent.RibbonControlSize.Large
    largeButtonFullPDF.Click += ClickEventExternalFullPDFPublicaition

    if root_element.tag == 'dmodule':
        largeButtonFullPDF.IsEnabled = False
        largeButtonFullPDF.LargeIcon = path + "icons\\PDF_file_full2.png"
    else:
        largeButtonFullPDF.IsEnabled = True
        largeButtonFullPDF.LargeIcon = path + "icons\\PDF_file_full.png"

    publishPanel.Items.Add(largeButtonSinglePDF)
    publishPanel.Items.Add(largeButtonFullPDF)

    return publishPanel


def CreateDocumentPanel():
    tree = ET.parse(ApiDocument.FileName)
    root_element = tree.getroot()

    CreateDocumentPanel = Fluent.RibbonGroupBox(Header="Create Document")

    # AddDM2PM
    largeButtonAddDM2PM = Fluent.Button(Header="Add a data module to PM")
    largeButtonAddDM2PM.Size = Fluent.RibbonControlSize.Large
    largeButtonAddDM2PM.Click += AddDM2PM

    if root_element.tag == 'dmodule':
        largeButtonAddDM2PM.IsEnabled = False
        largeButtonAddDM2PM.LargeIcon = path + "icons\\DM2PM2.png"
    else:
        largeButtonAddDM2PM.IsEnabled = True
        largeButtonAddDM2PM.LargeIcon = path + "icons\\DM2PM.png"

    # DeleteDMFromPM
    largeButtonDeleteDMFromPM = Fluent.Button(Header="Delete selected data module from PM")
    largeButtonDeleteDMFromPM.Size = Fluent.RibbonControlSize.Large
    largeButtonDeleteDMFromPM.Click += DeleteDMFromPM

    if root_element.tag == 'dmodule':
        largeButtonDeleteDMFromPM.IsEnabled = False
        largeButtonDeleteDMFromPM.LargeIcon = path + "icons\\delete_dm2.jpg"
    else:
        largeButtonDeleteDMFromPM.IsEnabled = True
        largeButtonDeleteDMFromPM.LargeIcon = path + "icons\\delete_dm.png"

    CreateDocumentPanel.Items.Add(largeButtonAddDM2PM)
    CreateDocumentPanel.Items.Add(largeButtonDeleteDMFromPM)

    return CreateDocumentPanel


def IPDPanel():
    tree = ET.parse(ApiDocument.FileName)
    root = tree.getroot()

    IPDPanel = Fluent.RibbonGroupBox(Header="IPD extensions")

    # AddDM2PM
    largeButtonExportDPLTable = Fluent.Button(Header="Exporting a DPL table to excel")
    largeButtonExportDPLTable.Size = Fluent.RibbonControlSize.Large
    largeButtonExportDPLTable.Click += IPDParse

    if root.find('.//illustratedPartsCatalog') is None:
        largeButtonExportDPLTable.IsEnabled = False
        largeButtonExportDPLTable.LargeIcon = path + "icons\\XL2.jpg"
    else:
        largeButtonExportDPLTable.IsEnabled = True
        largeButtonExportDPLTable.LargeIcon = path + "icons\\XL1.png"

    IPDPanel.Items.Add(largeButtonExportDPLTable)

    return IPDPanel

def OutlookPanel():
    outlookPanel = Fluent.RibbonGroupBox(Header="Outlook")

    btnSendMessage = Fluent.Button(Header="Send a letter to the...", LargeIcon=path + "icons\\outlook.jpg")
    btnSendMessage.Size = Fluent.RibbonControlSize.Large
    btnSendMessage.Click += SendMessage

    outlookPanel.Items.Add(btnSendMessage)

    return outlookPanel


def SendMessage(s, e):
    tree = ET.parse(ApiDocument.FileName)
    root_element = tree.getroot()

    # Пример использования
    temp_folder = os.path.join(os.environ["LOCALAPPDATA"], "Temp\\Libroplanta_temp")
    temp_folder_obj = LastPDFFinder(temp_folder)
    latest_pdf_file = temp_folder_obj.get_latest_folder()

    outlook_manager = OutlookManager()


    if root_element.tag == 'dmodule':
        dmTitle = ApiDocument.XDocument.XPathSelectElement(
            "//dmodule/identAndStatusSection/dmAddress/dmAddressItems/dmTitle/techName")
        infoName = ApiDocument.XDocument.XPathSelectElement(
            "//dmodule/identAndStatusSection/dmAddress/dmAddressItems/dmTitle/infoName")
        dmTitle_string = dmTitle.ToString()
        infoName_string = infoName.ToString()

        # Убираем тэги
        clean_dmTitle = re.sub('<[^<]+?>', '', dmTitle_string)
        clean_infoName = re.sub('<[^<]+?>', '', infoName_string)

        # Получаем имя файла и преобразовываем его в нужный вид для темы письма
        filePath = ApiDocument.FileName
        file_name = os.path.splitext(os.path.basename(filePath))[0]
        modified_file_name = file_name[:-13].lstrip("DMC-")

        # Открываем окно создания сообщения в Outlook, передаем аргументы (3): тема письма, тело, вложение
        outlook_manager.create_new_email(file_name,
                                         u"Прошу выполнить проверку:\n" + modified_file_name + '\n' + clean_dmTitle + ' - ' + clean_infoName,
                                         latest_pdf_file)

    elif root_element.tag == 'pm':
        pmTitle = ApiDocument.XDocument.XPathSelectElement(
            "//pm/identAndStatusSection/pmAddress/pmAddressItems/pmTitle")
        pmTitle_string = pmTitle.ToString()

        # Убираем тэги
        clean_pmTitle = re.sub('<[^<]+?>', '', pmTitle_string)

        # Получаем имя файла и преобразовываем его в нужный вид для темы письма
        filePath = ApiDocument.FileName
        file_name = os.path.splitext(os.path.basename(filePath))[0]
        modified_file_name = file_name[:-13].lstrip("PMC-")


        # Открываем окно создания сообщения в Outlook, передаем аргументы (3): тема письма, тело, вложение
        outlook_manager.create_new_email(file_name,
                                         u"Прошу выполнить проверку:\n" + modified_file_name + '\n' + clean_pmTitle,
                                         latest_pdf_file)
    else:
        pass

def IPDParse (s, e):
    excel_writer = ExcelWriter(ApiDocument.FileName)
    excel_writer.write_to_excel()


def ClickEventExternalSinglePDFPublicaition(s, e):
    temp_folder = os.path.join(os.path.expandvars("%LOCALAPPDATA%"),
                               "Temp\\Libroplanta_temp")  # строим путь к папке пользователя AppData\Local\Temp
    temp_folder = tempfile.mkdtemp(prefix=date_time + '_DM_', dir=temp_folder,
                                   suffix='')  # создаем временную директорию в папке пользователя AppData\Local\Temp

    subfolder_temp = "temp"
    subfolder_log = "log"
    subfolder_XMLDone = "XMLDone"
    subfolder_xml = "XML"

    subfolder_temp_path = os.path.join(temp_folder, subfolder_temp)
    subfolder_log_path = os.path.join(temp_folder, subfolder_log)
    subfolder_XMLDone_path = os.path.join(temp_folder, subfolder_XMLDone)
    subfolder_xml_path = os.path.join(temp_folder, subfolder_xml)

    if not os.path.exists(subfolder_xml_path):
        os.mkdir(subfolder_temp_path)
        os.mkdir(subfolder_log_path)
        os.mkdir(subfolder_XMLDone_path)
        os.mkdir(subfolder_xml_path)

    # ApiDocument.SaveAs(subfolder_xml_path + "\\temp.xml")
    ApiDocument.Save()
    doc_path = ApiDocument.FileName
    shutil.copy(doc_path, subfolder_xml_path)  # копирование XML

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

    # Вот эта портянка копирует картинки из рабочей области пользователя которые объявлены в XML
    doc_fullpath = ApiDocument.FileName
    doc_path2 = Path.GetDirectoryName(doc_fullpath)

    # Определение шаблона регулярного выражения
    pattern = r'<!ENTITY (\S+) SYSTEM "(\S+)" NDATA (\S+)>'

    # Чтение содержимого файла
    with open(doc_fullpath, 'r') as file:
        input_string = file.read()

    # Использование регулярного выражения для поиска значений
    matches = re.findall(pattern, input_string)

    # Открытие файла для записи
    with open(doc_path2 + "\\EntityName.txt", 'w') as file:
        # Запись значений в файл
        for match in matches:
            name, systemId, ndata = match
            # file.write("Name: {}\n".format(name))
            file.write("{}\n".format(systemId))
            # file.write("Ndata: {}\n".format(ndata))
            # file.write("-------------------------\n")

    # Указываем путь к txt файлу
    txt_file = doc_path2 + "\\EntityName.txt"

    # Определяем текущую директорию
    current_dir = doc_path2

    # Открываем txt файл для чтения
    with open(txt_file, "r") as file:
        # Читаем содержимое файла
        lines = file.readlines()

        # Перебираем каждую строку из файла
        for line in lines:
            # Удаляем символ новой строки
            line = line.strip()

            # Формируем полный путь к файлу из текущей директории
            file_path = os.path.join(current_dir, line)

            # Проверяем, является ли файл
            if os.path.isfile(file_path):
                # Получаем только имя файла
                file_name = os.path.basename(file_path)

                # Определяем путь к папке для копирования
                destination_folder = subfolder_xml_path
                destination_path = os.path.join(current_dir, destination_folder)

                # Проверяем, существует ли папка, иначе создаем ее
                if not os.path.exists(destination_path):
                    os.makedirs(destination_path)

                # Копируем файл в папку назначения
                shutil.copy2(file_path, os.path.join(destination_path, file_name))

    # Удаляем EntityName.txt
    os.remove(txt_file)

    # Запуск командной строки
    Process.Start(temp_folder + "\\publication_standalone.cmd")


def ClickEventExternalFullPDFPublicaition(s, e):
    doc_fullpath = ApiDocument.FileName
    source_folder = Path.GetDirectoryName(doc_fullpath)

    temp_folders = TempFolders()
    temp_folders.create_temp_folders()

    xml_subfolder_path = temp_folders.get_folder_path()['xml_subfolder']

    dest_folder = xml_subfolder_path

    xml_key = XmlKey(source_folder).get_xml_key_from_dm()
    pm_key = XmlKey(source_folder).get_xml_key_from_pm()

    count = 0
    not_found_keys = []
    for pm_file_path, pm_key_value in pm_key:
        found = False
        for xml_file_path, xml_key_value in xml_key:
            if xml_key_value == pm_key_value:
                shutil.copy(xml_file_path, dest_folder)
                shutil.copy(pm_file_path, dest_folder)
                found = True
                break
        if not found:
            not_found_keys.append(pm_key_value)
            count += 1

    if not not_found_keys:
        MessageBox.Show(u"Все ключи найдены")
        cmd_path = temp_folders.get_folder_path()['temp_folder']
        creator = CmdFileCreator(cmd_path, 'publication_issue.cmd')
        creator.create_file()
        Process.Start(cmd_path + "\\publication_issue.cmd")

    if not_found_keys:
        MessageBox.Show(u'Ошибка! Отсутствуют ключи: ' + ', '.join(not_found_keys))

    parser = XmlKey(dest_folder)
    parser.get_entity_names(source_folder, dest_folder)


def AddDM2PM(s, e):
    dialog = OpenFileDialog()

    dialog.Title = "Выберите файл"
    dialog.CheckFileExists = True
    dialog.Multiselect = False

    temp_folder = os.path.join(os.path.expandvars("%LOCALAPPDATA%"),
                               "Temp\\Libroplanta_temp")  # строим путь к папке пользователя AppData\Local\Temp
    temp_folder = tempfile.mkdtemp(prefix=date_time + '_DM2PM_', dir=temp_folder,
                                   suffix='')  # создаем временную директорию в папке пользователя AppData\Local\Temp

    result = dialog.ShowDialog()
    if result == DialogResult.OK:
        selected_file = dialog.FileName
        # MessageBox.Show("Выбран файл:", selected_file)

        output_file_path = temp_folder + "\\dm2pm_parsed.txt"
        process_xml_file(selected_file, output_file_path)

        # Загрузка основного XML-документа
        tree = ET.parse(ApiDocument.FileName)
        root = tree.getroot()

        # Создание кусочка XML, который нужно вставить
        with open(output_file_path, 'r') as f:
            insert_xml = f.read()

        # Нахождение тега, после которого нужно вставить кусочек XML
        pmentry_tag = root.find(".//pmEntry")

        prev_element = pmentry_tag.getchildren()[-1]

        # Создание нового элемента из кусочка XML
        insert_element = ET.fromstring(insert_xml)

        pmentry_tag.insert(list(pmentry_tag).index(prev_element) + 1, insert_element)

        xml_declaration = '<?xml version="1.0" encoding="utf-8"?>\n'
        xml_content = ET.tostring(root, encoding='utf-8')

        with open(ApiDocument.FileName, "wb") as file:
            file.write(xml_declaration.encode('utf-8'))
            file.write(xml_content)

        SendKeys.SendWait("{ENTER}")
        MessageBox.Show("Данные добавлены успешно")


def DeleteDMFromPM(s, e):
    ApiDocument.TransactionManager.StartTransaction("ApiTransaction")
    ApiDocument.Selection.Delete()
    ApiDocument.TransactionManager.EndTransaction()


def process_xml_file(xml_file_path, output_file_path):
    # Открываем файл и считываем его содержимое в переменную xml_string
    with open(xml_file_path, 'r') as f:
        xml_string = f.read()

    # Создаем объект ElementTree из XML-строки
    root = ET.fromstring(xml_string)

    # Находим элементы, которые нужно поменять местами
    language = root.find('./identAndStatusSection/dmAddress/dmIdent/language')
    issue_info = root.find('./identAndStatusSection/dmAddress/dmIdent/issueInfo')

    issue_Date = root.find('./identAndStatusSection/dmAddress/dmAddressItems/issueDate')
    dm_Title = root.find('./identAndStatusSection/dmAddress/dmAddressItems/dmTitle')

    # Удаляем элемент language из дерева
    root.find('./identAndStatusSection/dmAddress/dmIdent').remove(language)
    root.find('./identAndStatusSection/dmAddress/dmAddressItems').remove(issue_Date)

    # Вставляем элемент language после элемента issue_info
    root.find('./identAndStatusSection/dmAddress/dmIdent').insert(
        list(root.find('./identAndStatusSection/dmAddress/dmIdent')).index(issue_info) + 1, language)

    root.find('./identAndStatusSection/dmAddress/dmAddressItems').insert(
        list(root.find('./identAndStatusSection/dmAddress/dmAddressItems')).index(dm_Title) + 1, issue_Date)

    # Находим элемент dmIdent и заменяем его на dmRefIdent
    dm_ident = root.find('./identAndStatusSection/dmAddress/dmIdent')
    dm_ident.tag = 'dmRefIdent'

    # Находим элемент dmIdent и заменяем его на dmRefIdent
    dmAddress_items = root.find('./identAndStatusSection/dmAddress/dmAddressItems')
    dmAddress_items.tag = 'dmRefAddressItems'

    # Находим элемент dmIdent и заменяем его на dmRefIdent
    dm_Address = root.find('./identAndStatusSection/dmAddress')
    dm_Address.tag = 'dmRef'

    # Ищем элемент dmIdent и выводим его в виде строки
    dm_ident = ET.tostring(root.find('./identAndStatusSection/dmRef'), encoding='utf-8')

    # Записываем результат в файл
    with open(output_file_path, 'w') as f:
        f.write(dm_ident)

    return u"Результат записан в файл {}".format(output_file_path).encode('utf-8')


def ClickEventChangeDate(s, e):
    try:
        # Start transaction
        ApiDocument.TransactionManager.StartTransaction("Date Changed")
        date = calendar.SelectedDate
        day = str(date.Day).zfill(2)
        month = str(date.Month).zfill(2)
        year = str(date.Year)

        # doc = ApiDocument.XDocument.XPathSelectElement("//dmodule/identAndStatusSection/dmAddress/dmAddressItems/issueDate")
        doc = ApiDocument.XDocument.XPathSelectElement("//identAndStatusSection/pmAddress/pmAddressItems/issueDate")
        doc.Attribute("day").SetValue(day)
        doc.Attribute("month").SetValue(month)
        doc.Attribute("year").SetValue(year)
        # End transaction
        ApiDocument.TransactionManager.EndTransaction()
    except:
        # Rollback transaction in case of exception catching
        ApiDocument.TransactionManager.RollbackTransaction()


def ClickEventVerbatim(s, e):
    ApiDocument.TransactionManager.StartTransaction("ApiTransaction")
    check = ApiDocument.Selection.CheckValidOutter("verbatimText")
    if check:
        verbatim = XElement("verbatimText", XAttribute("verbatimStyle", "vs01"))
        for exnode in ApiDocument.Selection.EXNodes:
            xnode = exnode.GetNewXNode()
            verbatim.Add(xnode)
        listXNodes = List[XNode]()
        listXNodes.Add(verbatim)
        ApiDocument.Selection.Replace(listXNodes)
    ApiDocument.TransactionManager.EndTransaction()


def ClickEventLoadFiles(s, e):
    progressBar.Maximum = Directory.GetFiles(path + "Files").Length
    for file in Directory.GetFiles(path + "Files"):
        ApiDocument.AddS1000DFile(file)
        progressBar.Value += 1
    MessageBox.Show("Done!")
    ApiDocument.UpdateRepositorties()
    ApiDocument.UpdateBrex()


# Main entry point of opening document
def Document():
    # os.chdir("C:\\Program Files (x86)\\Libroplanta\\S1000D XML Editor\\DocTypes\\S1000D_4.1.0\\PythonScripts")
    if not ApiDocument.Ribbon.Tabs.Any(lambda s: s.Name == "ApiPanel"):
        ribbonTabItem = Fluent.RibbonTabItem(Header="Controls Panel", Name="ApiPanel")
        ribbonTabItem.Groups.Add(ButtonsGroupBoxControls())
        ribbonTabItem.Groups.Add(OthersGroupBoxControls())
        ribbonTabItem.Groups.Add(WindowsGroupBoxControls())
        ribbonTabItem.Groups.Add(ApiPanelSample())
        ApiDocument.Ribbon.Tabs.Add(ribbonTabItem)

        ribbonTabItem1 = Fluent.RibbonTabItem(Header="S1000D Extension Panel", Name="ApiPanel")
        ribbonTabItem1.Groups.Add(PublishPanel())
        ribbonTabItem1.Groups.Add(CreateDocumentPanel())
        ribbonTabItem1.Groups.Add(IPDPanel())
        ApiDocument.Ribbon.Tabs.Add(ribbonTabItem1)

        ribbonTabItem2 = Fluent.RibbonTabItem(Header="Outlook", Name="OutlookPanel")
        ribbonTabItem2.Groups.Add(OutlookPanel())
        ApiDocument.Ribbon.Tabs.Add(ribbonTabItem2)

        # Shortcuts binding
        ApiDocument.CreateKeyBinding(MethodBindingKey, KeyGesture(Key.L, ModifierKeys.Control))

        ApiDocument.Selection.SelectionChanged += XmlSelectionChangedEvent

        # ApiDocument.DocumentClosing += Closing
        ApiDocument.DocumentClosed += Closed
        # ApiDocument.DocumentSaving += Saving
        # ApiDocument.DocumentSaved += Saved


# def Saving(s,e):
#    MessageBox.Show("Saving")
#
# def Saved(e):
#    MessageBox.Show("Saved")
#
def Closed(e):
    # MessageBox.Show("Closed")
    temp_dir_path = os.path.join(os.environ["LOCALAPPDATA"], "Temp\\Libroplanta_temp")
    shutil.rmtree(temp_dir_path, ignore_errors=True)


#
# def Closing(s, e):
#     MessageBox.Show("Closing")


def MethodBindingKey():
    MessageBox.Show("Test Keys")


def XmlSelectionChangedEvent(s, e):
    pass
