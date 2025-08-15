import xml.etree.ElementTree as ET
from nltk import word_tokenize, sent_tokenize
from nltk.corpus import stopwords
from nltk.tokenize.treebank import TreebankWordDetokenizer

def compare_xml(file1, file2):
    # Парсим первый XML-файл
    tree1 = ET.parse(file1)
    root1 = tree1.getroot()

    # Парсим второй XML-файл
    tree2 = ET.parse(file2)
    root2 = tree2.getroot()

    # Сравниваем тэги и атрибуты
    results = {"added_tags": [], "added_attrs": {}, "deleted_tags": [], "deleted_attrs": {}, "modified_tags": [], "modified_attrs": {}}
    compare_elements(root1, root2, results)

    return results

def compare_elements(elem1, elem2, results):
    # Сравниваем тэги
    if elem1.tag != elem2.tag:
        if elem1.tag not in results["added_tags"]:
            results["added_tags"].append(elem1.tag)
        if elem2.tag not in results["deleted_tags"]:
            results["deleted_tags"].append(elem2.tag)
    else:
        # Сравниваем атрибуты
        for attr, value in elem1.attrib.items():
            if attr not in elem2.attrib:
                if elem1.tag not in results["added_attrs"]:
                    results["added_attrs"][elem1.tag] = {}
                results["added_attrs"][elem1.tag][attr] = value
            elif value != elem2.attrib[attr]:
                if elem1.tag not in results["modified_attrs"]:
                    results["modified_attrs"][elem1.tag] = {}
                results["modified_attrs"][elem1.tag][attr] = (value, elem2.attrib[attr])

        for attr, value in elem2.attrib.items():
            if attr not in elem1.attrib:
                if elem2.tag not in results["deleted_attrs"]:
                    results["deleted_attrs"][elem2.tag] = {}
                results["deleted_attrs"][elem2.tag][attr] = value

        # Рекурсивно сравниваем дочерние элементы
        for child1, child2 in zip(elem1, elem2):
            compare_elements(child1, child2, results)

def generate_report(file1, file2):
    # Получаем результаты сравнения файлов
    results = compare_xml(file1, file2)

    # Вычисляем количество добавленных, удаленных и измененных тэгов и атрибутов
    num_added_tags = len(results["added_tags"])
    num_added_attrs = sum(len(attrs) for _, attrs in results["added_attrs"].items())
    num_deleted_tags = len(results["deleted_tags"])
    num_deleted_attrs = sum(len(attrs) for _, attrs in results["deleted_attrs"].items())
    num_modified_tags = len(results["modified_tags"])
    num_modified_attrs = sum(len(attrs) for _, attrs in results["modified_attrs"].items())

    # Генерируем список изменений
    modified_changes = []
    for tag, attrs in results["modified_attrs"].items():
        for attr, values in attrs.items():
            old_value, new_value = values
            modified_changes.append(f"- В тэге '{tag}' атрибут '{attr}' был изменен с '{old_value}' на '{new_value}'.")

    # Генерируем текст отчета на основе шаблона
    template = "В результате сравнения файлов {file1} и {file2} были обнаружены следующие изменения:\n" \
               "- Добавлено {num_added_tags} новых тэгов и {num_added_attrs} новых атрибутов.\n" \
               "- Удалено {num_deleted_tags} тэгов и {num_deleted_attrs} атрибутов.\n" \
               "- Изменено {num_modified_tags} тэгов и {num_modified_attrs} атрибутов.\n\n" \
               "Конкретные изменения:\n{modified_changes}"
    report = template.format(file1=file1, file2=file2, num_added_tags=num_added_tags, num_added_attrs=num_added_attrs,
                             num_deleted_tags=num_deleted_tags, num_deleted_attrs=num_deleted_attrs,
                             num_modified_tags=num_modified_attrs, num_modified_attrs=num_modified_attrs, modified_changes='\n'.join(modified_changes))

    # Возвращаем сгенерированный отчет
    return report

file1 = r'C:\Users\xpesstoparadise\Desktop\Новая папка (3)\DMC-21000-A-04-11-00-00A-0B3A-A_001-00_ru-RU.xml'
file2 = r'C:\Users\xpesstoparadise\Desktop\Новая папка (3)\DMC-21000-A-04-11-00-00A-0B3A-A_002-00_ru-RU.xml'

compare_xml(file1, file2)