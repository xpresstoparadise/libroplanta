# !/usr/bin/env ipy
# -*- coding: UTF-8 -*-
import os

import clr
import xml.etree.ElementTree as ET

clr.AddReference("Microsoft.Office.Interop.Excel")

from Microsoft.Office.Interop import Excel


class ExcelWriter:
    def __init__(self, xml_file_path):
        self.xml_file_path = xml_file_path
        self.xml_file_name = os.path.splitext(os.path.basename(xml_file_path))[0]
        self.excel = Excel.ApplicationClass()
        self.excel.Visible = True
        self.workbook = self.excel.Workbooks.Add()
        self.worksheet = self.workbook.ActiveSheet
        self.row_index = 2

    def write_to_excel(self):
        # Заголовки столбцов
        self.worksheet.Cells[1, 1] = "item"
        self.worksheet.Cells[1, 2] = "partNumberValue"
        self.worksheet.Cells[1, 3] = "descrForPart"
        self.worksheet.Cells[1, 4] = "quantityPerNextHigherAssy"

        # Загрузка XML-файла
        tree = ET.parse(self.xml_file_path)
        root = tree.getroot()

        catalogSeqNumbers = root.findall("./content/illustratedPartsCatalog//catalogSeqNumber")

        for catalogSeqNumber in catalogSeqNumbers:
            item = catalogSeqNumber.attrib.get('item')
            partRef = catalogSeqNumber.find('./itemSeqNumber/partRef')
            partNumberValue = partRef.attrib.get('partNumberValue')
            itemIdentData = catalogSeqNumber.find('./itemSeqNumber/partSegment/itemIdentData')
            descrForPart = itemIdentData.find("descrForPart").text
            itemSeqNumber = catalogSeqNumber.find('./itemSeqNumber')
            quantityPerNextHigherAssy = itemSeqNumber.find('quantityPerNextHigherAssy').text

            self.worksheet.Cells[self.row_index, 1] = item
            self.worksheet.Cells[self.row_index, 2] = partNumberValue
            self.worksheet.Cells[self.row_index, 3] = descrForPart
            self.worksheet.Cells[self.row_index, 4] = quantityPerNextHigherAssy

            self.row_index += 1

        self.worksheet.Columns.AutoFit()

        range_with_data = self.worksheet.Range[self.worksheet.Cells[1, 1], self.worksheet.Cells[self.row_index - 1, 4]]
        range_with_data.Borders.LineStyle = Excel.XlLineStyle.xlContinuous
        range_with_data.Borders.Weight = Excel.XlBorderWeight.xlThin

        # Сохранение файла
        file_name = "{}.xlsx".format(self.xml_file_name)
        file_path = os.path.join(os.path.dirname(self.xml_file_path), file_name)
        self.workbook.SaveAs(file_path)
