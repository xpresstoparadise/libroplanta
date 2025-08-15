#!/usr/bin/env ipy
#-*- coding: UTF-8 -*-

"""import clr
import sys
import System
import re

path = sys.argv[0]
sys.path.append(path)

clr.AddReference("Fluent")
clr.AddReference("PresentationFramework")
clr.AddReference("System.Windows.Forms")
clr.AddReference("System")
clr.AddReference("mscorlib")
clr.AddReference("PresentationCore")
clr.AddReference("System.Collections")
clr.AddReference("System.Core")
clr.AddReference("WindowsBase")
clr.AddReference("System.Xml.Linq")

clr.ImportExtensions(System.Linq)
clr.ImportExtensions(System.Xml.XPath)

from System.Collections.Generic import List
from System.Xml.Linq import XElement, XAttribute, XNode
from System.IO import Directory
from System.Windows.Input import KeyGesture, Key, ModifierKeys
from System import Environment
from System.Windows.Forms import MessageBox, Application, Form
import System.Windows.Controls as win
import Fluent


#Also you can use os.getcwd() from module "os"
path = Environment.CurrentDirectory + "\\DocTypes\\S1000D_4.2.0\\PythonScripts\\"

#Fluent-controls
def ButtonsGroupBoxControls():
    buttonControls = Fluent.RibbonGroupBox(Header = "Buttons")
 
    largeButton = Fluent.Button(Header = "Large Button", LargeIcon = path + "icons\\large.png")
    largeButton.Size = Fluent.RibbonControlSize.Large

    middleButton = Fluent.Button(Header = "Middle Button", Icon = path + "icons\\medium.png")
    middleButton.Size = Fluent.RibbonControlSize.Middle

    smallButton = Fluent.Button(ToolTip = "Small Button", Icon = path + "icons\\small.png")
    smallButton.Click += lambda s, e: MessageBox.Show(ApiDocument.Selection.ToString())
    smallButton.Size = Fluent.RibbonControlSize.Small

    toggleButton = Fluent.ToggleButton(Header = "Toggle Button", ToolTip = "Notification....")
    toggleButton.Click += lambda s, e: MessageBox.Show("Pressed: " + str(toggleButton.IsChecked), "Button Status")

    splitButton = Fluent.SplitButton(Header = "splite button", LargeIcon = path + "icons\\split.png")
    gallery = Fluent.Gallery()
    gallery.Items.Add(Fluent.Button(Header = "Button 1"))
    gallery.Items.Add(Fluent.Button(Header = "Button 2"))
    splitButton.Items.Add(gallery)

    buttonControls.Items.Add(toggleButton)
    buttonControls.Items.Add(smallButton)
    buttonControls.Items.Add(middleButton)
    buttonControls.Items.Add(largeButton)
    buttonControls.Items.Add(splitButton)
    return buttonControls

#Other controls
def OthersGroupBoxControls():
    otherControls = Fluent.RibbonGroupBox(Header = "Other")

    checkBox = Fluent.CheckBox(Header = "CheckBox", IsChecked = True)
    radioButton = Fluent.RadioButton(Header = "1", IsChecked = True)
    radioButton2 = Fluent.RadioButton(Header = "2")

    spinner = Fluent.Spinner(Maximum = 100, Minimum = 0, Value = 5)

    textBox = Fluent.TextBox(Width = 150, Text = "Hello World!")

    comboBox = Fluent.ComboBox(SelectedIndex = 1, IsReadOnly = True)
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

#Regular controls
def WindowsGroupBoxControls():
    #https://msdn.microsoft.com/en-us/library/system.windows.controls(v=vs.110).aspx
    winControls = Fluent.RibbonGroupBox(Header = "Windows Controls")
    button = win.Button(Content="Button")

    listBox = win.ListBox(Width=100)
    for i in range(5): 
        listBox.Items.Add("Item " + str(i))
    
    calendar = win.DatePicker()

    progressBar = win.ProgressBar(Maximum = 100, Value = 55)
    slider = win.Slider(Maximum = 100)

    winControls.Items.Add(button)
    winControls.Items.Add(listBox)
    winControls.Items.Add(calendar)
    winControls.Items.Add(slider)
    winControls.Items.Add(progressBar)
   
    return winControls

#API Examples
progressBar = win.ProgressBar()
calendar = win.DatePicker()
def ApiPanelSample():
    apiPanel = Fluent.RibbonGroupBox(Header = "API Panel Sample")

    #Loading files from folder
    btnLoader = Fluent.Button(Header = "Load Files", Icon = path + "icons\\medium.png")
    btnLoader.Size = Fluent.RibbonControlSize.Middle
    btnLoader.Click += ClickEventLoadFiles

    #Encasing fragment selection with verbatimText element
    
    btnVerbatim = Fluent.Button(Header = "Verbatim")
    btnVerbatim.Size = Fluent.RibbonControlSize.Middle
    btnVerbatim.Click += ClickEventVerbatim

    #Changing issue date to the selected date "calendar"
    btnChangeDate = Fluent.Button(Header = "Сhange date")
    btnChangeDate.Size = Fluent.RibbonControlSize.Middle
    btnChangeDate.Click += ClickEventChangeDate

    apiPanel.Items.Add(btnLoader)
    apiPanel.Items.Add(progressBar)
    apiPanel.Items.Add(btnVerbatim)
    apiPanel.Items.Add(btnChangeDate)
    apiPanel.Items.Add(calendar)

    return apiPanel

def ClickEventChangeDate(s,e):
    try:
        #Start transaction
        ApiDocument.TransactionManager.StartTransaction("Date Changed")
        date = calendar.SelectedDate
        day = str(date.Day).zfill(2)
        month = str(date.Month).zfill(2)
        year = str(date.Year)
                                                                                                                                            
        doc = ApiDocument.XDocument.XPathSelectElement("//dmodule/identAndStatusSection/dmAddress/dmAddressItems/issueDate")
        doc.Attribute("day").SetValue(day)
        doc.Attribute("month").SetValue(month)
        doc.Attribute("year").SetValue(year)
        #End transaction
        ApiDocument.TransactionManager.EndTransaction()
    except: 
        #Rollback transaction in case of exception catching
        ApiDocument.TransactionManager.RollbackTransaction()
    
def ClickEventVerbatim(s,e):
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

def ClickEventLoadFiles(s,e):
    progressBar.Maximum = Directory.GetFiles(path + "Files").Length
    for file in Directory.GetFiles(path + "Files"):
        ApiDocument.AddS1000DFile(file)
        progressBar.Value += 1
    MessageBox.Show("Done!")
    ApiDocument.UpdateRepositorties()
    ApiDocument.UpdateBrex()
       

#Main entry point of opening document
def Document():
    if not ApiDocument.Ribbon.Tabs.Any(lambda s: s.Name == "ApiPanel"):
        ribbonTabItem = Fluent.RibbonTabItem(Header="Controls Panel", Name="ApiPanel")

        ribbonTabItem.Groups.Add(ButtonsGroupBoxControls())
        ribbonTabItem.Groups.Add(OthersGroupBoxControls())
        ribbonTabItem.Groups.Add(WindowsGroupBoxControls())
        ribbonTabItem.Groups.Add(ApiPanelSample())
    
        ApiDocument.Ribbon.Tabs.Add(ribbonTabItem)

        #Shortcuts binding
        ApiDocument.CreateKeyBinding(MethodBindingKey, KeyGesture(Key.L, ModifierKeys.Control))

        ApiDocument.Selection.SelectionChanged += XmlSelectionChangedEvent

        ApiDocument.DocumentClosing += Closing
        ApiDocument.DocumentClosed += Closed
        ApiDocument.DocumentSaving += Saving
        ApiDocument.DocumentSaved += Saved

def Saving(s,e):
    MessageBox.Show("Saving")

def Saved(e):
    MessageBox.Show("Saved")

def Closed(e):
    MessageBox.Show("Closed")

def Closing(s,e):
    MessageBox.Show("Closing")

def MethodBindingKey(): 
    MessageBox.Show("Test Keys")

def XmlSelectionChangedEvent(s,e): 
    pass """

