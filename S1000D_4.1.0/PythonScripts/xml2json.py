import json

with open('output.json', encoding='utf-8') as json_file:
    data = json.load(json_file)

model_ident_code = data['dmodule']['identAndStatusSection']['dmAddress']['dmIdent']['dmCode']['@modelIdentCode']

items = []
catalog_seq_numbers = data['dmodule']['content']['illustratedPartsCatalog']['catalogSeqNumber']
for catalog_seq_number in catalog_seq_numbers:
    item = catalog_seq_number['@item']
    items.append(item)


part_refs = []
catalog_seq_numbers = data['dmodule']['content']['illustratedPartsCatalog']['catalogSeqNumber']
item_seq_numbers = catalog_seq_numbers['itemSeqNumber']

# Проход по элементам itemSeqNumber и доступ к словарю partRef
for item in item_seq_numbers:
    part_ref = item['partRef']
    part_number_value = part_ref['@partNumberValue']
    part_refs.append(part_number_value)


print(part_refs)
print(model_ident_code)
print(items)