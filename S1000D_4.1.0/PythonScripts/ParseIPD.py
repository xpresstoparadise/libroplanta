#!/usr/bin/env ipy
# -*- coding: UTF-8 -*-

import xml.etree.ElementTree as ET
from openpyxl import Workbook

# Путь к XML файлу
xml_file_path = r'C:\Users\xpesstoparadise\Desktop\PME-AA62F-01ALL-21000-AA62F-IPC30-01_000-01_RU-RU\DMC-21000-A-30-00-51-05A-941A-D_000-01_ru-RU.xml'

# Создаем ElementTree объект из XML файла
tree = ET.parse(xml_file_path)
root = tree.getroot()

# Создаем новый workbook и получаем активный лист
wb = Workbook()
ws = wb.active

# Записываем заголовки столбцов
ws.append(['Title', 'InfoEntityIdent', 'ApplicationStructureName', 'ObjectDescr'])

# Проходим по всем элементам XML и записываем значения атрибутов в Excel
for figure in root.iter('figure'):
    title = figure.find('.//title').text
    graphic = figure.findall('.//graphic')
    graphic1 = figure.findall('.//hotspot')
    # info_entity_ident = graphic1.get('infoEntityIdent')
    # application_structure_name = graphic.findall('hotspot')
    object_descr = graphic1.get('objectDescr')
    # ws.append([title, info_entity_ident, application_structure_name, object_descr])

# Делаем автоподбор ширины столбцов
for column_cells in ws.columns:
    length = max(len(str(cell.value)) for cell in column_cells)
    ws.column_dimensions[column_cells[0].column_letter].width = length

# Сохраняем workbook в файл
wb.save('output.xlsx')


# import xml.etree.ElementTree as ET
# from openpyxl import Workbook
#
# # Создание нового Excel-файла и выбор активного листа
# wb = Workbook()
# ws = wb.active
#
# # Заголовки столбцов
# ws.append(["Title", "Graphic infoEntityIdent", "Hotspot applicationStructureName", "Hotspot objectDescr"])
#
# # Загрузка XML-файла
# tree = ET.parse(r'C:\Users\xpesstoparadise\Desktop\PME-AA62F-01ALL-21000-AA62F-IPC30-01_000-01_RU-RU\DMC-21000-A-30-00-51-05A-941A-D_000-01_ru-RU.xml')
# root = tree.getroot()
#
# # Проход по каждому элементу в XML и запись атрибутов в Excel
# for content in root.findall('content'):
#     for illustratedPartsCatalog in content.findall('illustratedPartsCatalog'):
#         for figure in illustratedPartsCatalog.findall('figure'):
#             # Получение значений атрибутов
#             title = figure.find('title').text
#             graphic_infoEntityIdent = figure.find('graphic').get('infoEntityIdent')
#             hotspot_applicationStructureName = figure.find('graphic/hotspot').get('applicationStructureName')
#             hotspot_objectDescr = figure.find('graphic/hotspot').get('objectDescr')
#
#             # Запись значений атрибутов в Excel
#             ws.append([title, graphic_infoEntityIdent, hotspot_applicationStructureName, hotspot_objectDescr])
#
# # Делаем автоподбор ширины столбцов
# for column_cells in ws.columns:
#     length = max(len(str(cell.value)) for cell in column_cells)
#     ws.column_dimensions[column_cells[0].column_letter].width = length
#
# # Сохранение Excel-файла
# wb.save('output2.xlsx')