#!/usr/bin/env ipy
# -*- coding: UTF-8 -*-

import pandas as pd
import xml.etree.ElementTree as ET

# загрузить данные из таблицы Excel в DataFrame
df = pd.read_excel(r'C:\Users\xpesstoparadise\Desktop\AMM\dir1\DMC-21000-A-52-31-00-08S-941A-D_001-00_ru-RU.xlsx')

# загрузить XML-файл в ElementTree
tree = ET.parse(r'C:\Users\xpesstoparadise\Desktop\AMM\dir1\DMC-21000-A-52-31-00-08S-941A-D_001-00_ru-RU.xml')
root = tree.getroot()

# найти элементы в XML-файле, которые нужно обновить
catalogSeqNumbers = root.findall("./content/illustratedPartsCatalog//catalogSeqNumber")
updated_values = 0
total_values = len(catalogSeqNumbers)

# найти элементы в XML-файле, которые нужно обновить
catalogSeqNumbers = root.findall("./content/illustratedPartsCatalog//catalogSeqNumber")
for catalogSeqNumber in catalogSeqNumbers:
    item = catalogSeqNumber.attrib.get('item')
    partRef = catalogSeqNumber.find('./itemSeqNumber/partRef')
    partNumberValue = partRef.attrib.get('partNumberValue')
    itemIdentData = catalogSeqNumber.find('./itemSeqNumber/partSegment/itemIdentData')
    descrForPart = itemIdentData.find("descrForPart").text
    itemSeqNumber = catalogSeqNumber.find('./itemSeqNumber')
    quantityPerNextHigherAssy = itemSeqNumber.find('quantityPerNextHigherAssy')

    # найти соответствующие значения в таблице Excel на основе значения атрибута 'item'
    row = df.loc[df['№ Поз.'] == item]

    # обновить значения в XML-файле
    if not row.empty:
        quantityPerNextHigherAssy.text = str(row.iloc[0]['Кол. на сб.ед.'])
        descrForPart = row.iloc[0]['Наименование']
        updated_values += 1

# сохранить обновленный XML-файл
xml_update = r'C:\Users\xpesstoparadise\Desktop\AMM\dir1\DMC-21000-A-52-31-00-08S-941A-D_001-00_ru-RU_update.xml'
tree.write(xml_update, encoding='utf-8', xml_declaration='<?xml version="1.0" encoding="utf-8"?>\n')

# вывести результат в консоль
print("Найдено значений:", total_values)
print("Обновлено значений:", updated_values)
