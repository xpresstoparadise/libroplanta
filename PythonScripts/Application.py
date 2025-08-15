#!/usr/bin/env ipy
#-*- coding: UTF-8 -*-

import clr
import sys
sys.path.append("D:\S1000D XML Editor\PythonScripts\Lib")
sys.path.append("D:\S1000D XML Editor\PythonScripts")
sys.path.append("D:\S1000D XML Editor\DocTypes\S1000D_4.1.0\PythonScripts")
OUT = []
import os
path = sys.argv[0]

sys.path.append(path)
clr.AddReference("PresentationFramework")

import System.Windows.Controls as win
from System.Windows import Window, Thickness, HorizontalAlignment, VerticalAlignment, WindowStartupLocation

#Main entry point of starting application
def StartApplication():
    os.chdir(r"D:\S1000D XML Editor")
#     formAuth = AuthorizeForm()
#     formAuth.ShowDialog() #Открываем диалоговое окно до запуска XmlEditor
#     pass
#
# #Dialog creation
# class AuthorizeForm(Window):
#     def __init__(self):
#         self.Title = "Authorize"
#         self.Height = 200
#         self.Width = 350
#         self.AddControls()
#         self.WindowStartupLocation = WindowStartupLocation.CenterScreen
#
#     login = win.TextBox(Margin = Thickness(5), Height = 20, Text = "admin")
#     password = win.PasswordBox(Name = "password", Margin = Thickness(5), Height = 20, Password = "password")
#     def AddControls(self):
#         stackPanel = win.StackPanel()
#         stackPanel.Children.Add(win.TextBlock(Text = "Login:", Margin = Thickness(5, 0, 0, 0)))
#         stackPanel.Children.Add(self.login)
#         stackPanel.Children.Add(win.TextBlock(Text = "Password:", Margin = Thickness(5, 0, 0, 0)))
#         stackPanel.Children.Add(self.password)
#
#         grid = win.Grid()
#         btn = win.Button(Margin = Thickness(5), Content = "Log On", Width = 200, HorizontalAlignment = HorizontalAlignment.Right)
#         btn.Click += self.ClickAuthorize
#         grid.Children.Add(btn)
#         grid.Children.Add(win.CheckBox(Margin = Thickness(5), VerticalAlignment = VerticalAlignment.Center, Content = "Remember Me", HorizontalAlignment = HorizontalAlignment.Left))
#
#         stackPanel.Children.Add(grid)
#         self.AddChild(stackPanel)
#
#     def ClickAuthorize(self,s,e):
#         if self.login.Text == "admin" and self.password.Password  == "password":
#             self.Hide() #Hide the form and start XmlEditor
#         else:
#             self.Close() #Close the application