# !/usr/bin/env ipy
# -*- coding: UTF-8 -*-

import clr
import sys

sys.path.append("D:\S1000D XML Editor\PythonScripts\Lib")
OUT = []
import os
import shutil
import datetime
import io
import xml.etree.ElementTree as ET
import tempfile
import System
import xml.sax.handler
import re

path = sys.argv[0]
sys.path.append(path)

clr.AddReference("Fluent")
clr.AddReference("PresentationFramework")
clr.AddReference("System.Windows.Forms")
clr.AddReference("System")
clr.AddReference("System.Xml")
clr.AddReference("System.IO")
clr.AddReference("mscorlib")
clr.AddReference("PresentationCore")
clr.AddReference("System.Collections")
clr.AddReference("System.Core")
clr.AddReference("WindowsBase")
clr.AddReference("System.Xml.Linq")
clr.AddReference("IronPython")
clr.AddReference("IronPython.Modules")
clr.AddReference("Microsoft.Scripting.Metadata")
clr.AddReference("Microsoft.Scripting")
clr.AddReference("Microsoft.Dynamic")
clr.AddReference("mscorlib")
clr.AddReference("System.Data")

clr.ImportExtensions(System.Linq)
clr.ImportExtensions(System.Xml.XPath)

clr.ImportExtensions(System.Diagnostics)
clr.ImportExtensions(System.Text)
clr.ImportExtensions(System.Threading.Tasks)

from System.Xml import XmlUrlResolver
from System.Xml.Linq import XDocument
from System.Xml.XPath import Extensions
from System.IO import File, StringReader, StringWriter
from System.Xml import XmlDocument, XmlReaderSettings, XmlNodeType
from System.Xml.Xsl import XslCompiledTransform
from System.IO import File, StringReader, StringWriter
from System.Xml import XmlDocument, XmlReaderSettings, XmlNodeType
from System.Xml.Xsl import XslCompiledTransform
from System.IO import StringReader, StringWriter
from System.Xml import XmlDocument, Xsl
from System.Collections.Generic import List
from System.Xml.Linq import XElement, XAttribute, XNode, XText
from System.IO import Directory
from System.Windows.Input import KeyGesture, Key, ModifierKeys
from System import Environment
from System.Windows.Forms import MessageBox, Application, Form, OpenFileDialog, DialogResult
from System.Diagnostics import Process
from System.Xml import XmlReader, DtdProcessing
import System.Windows.Controls as win
import Fluent
import System.IO
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
    apiPanel = Fluent.RibbonGroupBox(Header="Irkut Customization")

    # Распарсить XML документ и получить корневой элемент
    tree = ET.parse(ApiDocument.FileName)
    root_element = tree.getroot()

    # ExternalSinglePDFPublicaitionButton
    largeButton1 = Fluent.Button(Header="External single PDF Publicaition")
    largeButton1.Size = Fluent.RibbonControlSize.Large
    largeButton1.Click += ClickEventExternalSinglePDFPublicaition

    if root_element.tag == 'pm':
        largeButton1.IsEnabled = False
        largeButton1.LargeIcon = path + "icons\\PDF_file_icon2.png"
    else:
        largeButton1.IsEnabled = True
        largeButton1.LargeIcon = path + "icons\\PDF_file_icon.png"

    # ExternalFullPDFPublicaitionButton
    largeButton2 = Fluent.Button(Header="External Full PDF Publicaition", LargeIcon=path + "icons\\PDF_file_icon.png")
    largeButton2.Size = Fluent.RibbonControlSize.Large
    largeButton2.Click += ClickEventExternalFullPDFPublicaition

    # Loading files from folder
    # btnLoader = Fluent.Button(Header = "Load Files", Icon = path + "icons\\medium.png")
    # btnLoader.Size = Fluent.RibbonControlSize.Middle
    # btnLoader.Click += ClickEventLoadFiles

    # Encasing fragment selection with verbatimText element

    btnVerbatim = Fluent.Button(Header="Verbatim")
    btnVerbatim.Size = Fluent.RibbonControlSize.Middle
    btnVerbatim.Click += ClickEventVerbatim

    # Changing issue date to the selected date "calendar"
    # btnChangeDate = Fluent.Button(Header = "Сhange date")
    # btnChangeDate.Size = Fluent.RibbonControlSize.Middle
    # btnChangeDate.Click += ClickEventChangeDate

    apiPanel.Items.Add(largeButton1)
    apiPanel.Items.Add(largeButton2)
    # apiPanel.Items.Add(btnLoader)
    # apiPanel.Items.Add(progressBar)
    apiPanel.Items.Add(btnVerbatim)
    # apiPanel.Items.Add(btnChangeDate)
    # apiPanel.Items.Add(calendar)

    return apiPanel


def ClickEventChangeDate(s, e):
    try:
        # Start transaction
        ApiDocument.TransactionManager.StartTransaction("Date Changed")
        date = calendar.SelectedDate
        day = str(date.Day).zfill(2)
        month = str(date.Month).zfill(2)
        year = str(date.Year)

        doc = ApiDocument.XDocument.XPathSelectElement(
            "//dmodule/identAndStatusSection/dmAddress/dmAddressItems/issueDate")
        doc.Attribute("day").SetValue(day)
        doc.Attribute("month").SetValue(month)
        doc.Attribute("year").SetValue(year)
        # End transaction
        ApiDocument.TransactionManager.EndTransaction()
    except:
        # Rollback transaction in case of exception catching
        ApiDocument.TransactionManager.RollbackTransaction()


# ExternalSinglePDFPublicaition
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
        # Запуск командной строки
    Process.Start(temp_folder + "\\publication_standalone.cmd")


# ExternalFullPDFPublicaition
def ClickEventExternalFullPDFPublicaition(s, e):

    # Создаем диалог выбора файла
    dialog = OpenFileDialog()

    # Устанавливаем некоторые свойства диалога
    dialog.Title = "Выберите файл"
    dialog.CheckFileExists = True
    dialog.Multiselect = True

    # Отображаем диалог и проверяем результат
    result = dialog.ShowDialog()
    if result == DialogResult.OK:
        # Получаем путь к выбранному файлу
        selected_file = dialog.FileName
        print("Выбран файл:", selected_file)

        # Обрабатываем выбранный файл
        # doc_fullpath1 = ApiDocument.FileName.Path.GetDirectoryName
        # doc_path1 = Path.GetDirectoryName(doc_fullpath1)
        # MessageBox.Show(doc_path1)
        output_file_path = r'C:\Users\xpesstoparadise\Desktop\AMM\dir1\outputxml.txt'
        processed_file = process_xml_file(selected_file, output_file_path)
        MessageBox.Show("Обработанный файл:", processed_file)

    # # result = process_xml_file(r'C:\Users\xpesstoparadise\Desktop\AMM\dir1\DMC-21000-A-52-31-00-08S-941A-D_001-00_ru-RU.xml',
    # #                           r'C:\Users\xpesstoparadise\Desktop\AMM\dir1\DMC-21000-A-52-31-00-08S-941A-D_001-00_ru-RU_output.txt')
    # # MessageBox.Show(result)


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
    if not ApiDocument.Ribbon.Tabs.Any(lambda s: s.Name == "ApiPanel"):
        ribbonTabItem = Fluent.RibbonTabItem(Header="Разработчик", Name="ApiPanel")

        # ribbonTabItem.Groups.Add(ButtonsGroupBoxControls())
        # ribbonTabItem.Groups.Add(OthersGroupBoxControls())
        # ribbonTabItem.Groups.Add(WindowsGroupBoxControls())
        ribbonTabItem.Groups.Add(ApiPanelSample())

        ApiDocument.Ribbon.Tabs.Add(ribbonTabItem)

        # Shortcuts binding
        ApiDocument.CreateKeyBinding(MethodBindingKey, KeyGesture(Key.L, ModifierKeys.Control))

        ApiDocument.Selection.SelectionChanged += XmlSelectionChangedEvent

        # ApiDocument.DocumentClosing += Closing
        ApiDocument.DocumentClosed += Closed
        # ApiDocument.DocumentSaving += Saving
        # ApiDocument.DocumentSaved += Saved


# def Saving(s,e):
# MessageBox.Show("Saving")

# def Saved(e):
# MessageBox.Show("Saved")

def Closed(e):
    # MessageBox.Show("Closed")
    temp_dir_path = os.path.join(os.environ["LOCALAPPDATA"], "Temp\\Libroplanta_temp")
    shutil.rmtree(temp_dir_path, ignore_errors=True)


# def Closing(s,e):
#     MessageBox.Show("Closing")

def MethodBindingKey():
    MessageBox.Show("Test Keys")


def XmlSelectionChangedEvent(s, e):
    pass
