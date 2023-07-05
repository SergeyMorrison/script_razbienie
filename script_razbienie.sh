#!/bin/bash
echo "Введите имя файла:"
read filename
if [ ! -f "$filename" ]; then
echo "Файл не существует"
exit 1
fi
echo "Введите имя нового файла"
read output_filename
echo "Введите количество символов в строке"
read quantity
sed "s/.\{1,$quantity\}/&\n/g" "$filename" > "$output_filename"
echo "Введите номер строки, в которую нужно добавить фразу 'hello world' (начиная с 1):"
read line_number
sed "${line_number}s/.*/& hello world/" "$output_filename"
