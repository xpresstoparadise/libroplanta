# !/usr/bin/env ipy
# -*- coding: UTF-8 -*-

import clr



clr.AddReference("System.Windows.Forms")
clr.AddReference("System.Drawing")

from System.Windows.Forms import Application, Button, Form, MouseButtons, Timer
from System.Drawing import Color


class MainForm(Form):
    def __init__(self):
        self.button = Button()
        self.timer = Timer()
        self.mode = 1

        self.button.Text = "Режим 1"
        self.button.MouseDown += self.button_MouseDown
        self.button.MouseUp += self.button_MouseUp

        self.timer.Interval = 500  # 1 секунда
        self.timer.Tick += self.timer_Tick

        self.Controls.Add(self.button)

    def button_MouseDown(self, sender, e):
        if e.Button == MouseButtons.Left:
            self.timer.Start()

    def button_MouseUp(self, sender, e):
        if e.Button == MouseButtons.Left:
            self.timer.Stop()
            if self.mode == 1:
                self.mode = 2
                self.button.Text = "Режим 2"
            else:
                self.mode = 1
                self.button.Text = "Режим 1"

    def timer_Tick(self, sender, e):
        self.timer.Stop()
        if self.mode == 1:
            # Действия для режима 1
            print(u"Режим 1")
        else:
            # Действия для режима 2
            print(u"Режим 2")


# Создание и запуск формы
form = MainForm()
Application.Run(form)
