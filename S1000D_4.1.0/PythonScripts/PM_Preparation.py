# !/usr/bin/env ipy
# -*- coding: UTF-8 -*-

import os
import xml.etree.ElementTree as ET
import re
import shutil


class XmlKey:
    def __init__(self, source_folder):
        self.source_folder = source_folder

    def get_xml_key_from_dm(self):
        xml_key = []
        for file in os.listdir(self.source_folder):
            if file.endswith('.xml') or file.endswith('.XML'):
                xml_file_path = os.path.join(self.source_folder, file)
                tree = ET.parse(xml_file_path)
                root = tree.getroot()
                if root.tag != 'dmodule':
                    continue
                modelIdentCode = root.find("./identAndStatusSection/dmAddress/dmIdent/dmCode").attrib.get(
                    'modelIdentCode')
                systemDiffCode = root.find("./identAndStatusSection/dmAddress/dmIdent/dmCode").attrib.get(
                    'systemDiffCode')
                systemCode = root.find("./identAndStatusSection/dmAddress/dmIdent/dmCode").attrib.get('systemCode')
                subSystemCode = root.find("./identAndStatusSection/dmAddress/dmIdent/dmCode").attrib.get(
                    'subSystemCode')
                subSubSystemCode = root.find("./identAndStatusSection/dmAddress/dmIdent/dmCode").attrib.get(
                    'subSubSystemCode')
                assyCode = root.find("./identAndStatusSection/dmAddress/dmIdent/dmCode").attrib.get('assyCode')
                disassyCode = root.find("./identAndStatusSection/dmAddress/dmIdent/dmCode").attrib.get('disassyCode')
                disassyCodeVariant = root.find("./identAndStatusSection/dmAddress/dmIdent/dmCode").attrib.get(
                    'disassyCodeVariant')
                infoCode = root.find("./identAndStatusSection/dmAddress/dmIdent/dmCode").attrib.get('infoCode')
                infoCodeVariant = root.find("./identAndStatusSection/dmAddress/dmIdent/dmCode").attrib.get(
                    'infoCodeVariant')
                itemLocationCode = root.find("./identAndStatusSection/dmAddress/dmIdent/dmCode").attrib.get(
                    'itemLocationCode')
                issueNumber = root.find("./identAndStatusSection/dmAddress/dmIdent/issueInfo").attrib.get('issueNumber')
                inWork = root.find("./identAndStatusSection/dmAddress/dmIdent/issueInfo").attrib.get('inWork')
                languageIsoCode = root.find("./identAndStatusSection/dmAddress/dmIdent/language").attrib.get(
                    'languageIsoCode')
                countryIsoCode = root.find("./identAndStatusSection/dmAddress/dmIdent/language").attrib.get(
                    'countryIsoCode')
                key = '-'.join(
                    ['DMC', modelIdentCode, systemDiffCode, systemCode, subSystemCode + subSubSystemCode, assyCode,
                     disassyCode + disassyCodeVariant, infoCode + infoCodeVariant, itemLocationCode + '_' + issueNumber,
                     inWork + '_' + languageIsoCode, countryIsoCode])
                xml_key.append((xml_file_path, key))
        return xml_key

    def get_xml_key_from_pm(self):
        pm_key = []
        for file in os.listdir(self.source_folder):
            if file.endswith('.xml') or file.endswith('.XML'):
                xml_file_path = os.path.join(self.source_folder, file)
                tree = ET.parse(xml_file_path)
                root = tree.getroot()
                if root.tag != 'pm':
                    continue
                for dmRef in root.findall("./content//pmEntry/dmRef"):
                    dmCode = dmRef.find('./dmRefIdent/dmCode')
                    modelIdentCode = dmCode.attrib.get('modelIdentCode')
                    systemDiffCode = dmCode.attrib.get('systemDiffCode')
                    systemCode = dmCode.attrib.get('systemCode')
                    subSystemCode = dmCode.attrib.get('subSystemCode')
                    subSubSystemCode = dmCode.attrib.get('subSubSystemCode')
                    assyCode = dmCode.attrib.get('assyCode')
                    disassyCode = dmCode.attrib.get('disassyCode')
                    disassyCodeVariant = dmCode.attrib.get('disassyCodeVariant')
                    infoCode = dmCode.attrib.get('infoCode')
                    infoCodeVariant = dmCode.attrib.get('infoCodeVariant')
                    itemLocationCode = dmCode.attrib.get('itemLocationCode')

                    issueInfo = dmRef.find('./dmRefIdent/issueInfo')
                    issueNumber = issueInfo.attrib.get('issueNumber')
                    inWork = issueInfo.attrib.get('inWork')

                    language = dmRef.find('./dmRefIdent/language')
                    languageIsoCode = language.attrib.get('languageIsoCode')
                    countryIsoCode = language.attrib.get('countryIsoCode')

                    key = '-'.join(
                        ['DMC', modelIdentCode, systemDiffCode, systemCode, subSystemCode + subSubSystemCode, assyCode,
                         disassyCode + disassyCodeVariant, infoCode + infoCodeVariant,
                         itemLocationCode + '_' + issueNumber, inWork + '_' + languageIsoCode, countryIsoCode])
                    pm_key.append((xml_file_path, key))
        return pm_key

    def get_entity_names(self, source_folder, dest_folder):
        pattern = r'<!ENTITY (\S+) SYSTEM "(\S+)" NDATA (\S+)>'
        entities = []
        for filename in os.listdir(self.source_folder):
            if filename.endswith('.xml') or filename.endswith('.XML'):
                with open(os.path.join(source_folder, filename), 'r') as f:
                    xml = f.read()
                    entities += re.findall(pattern, xml)
        # Копирование файлов из source_folder в dest_folder
        for entity in entities:
            entity_filename = entity[1].split('/')[-1]
            shutil.copy(os.path.join(source_folder, entity_filename), os.path.join(dest_folder, entity_filename))
        return [entity[1] for entity in entities]
