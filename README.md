# script_razbienie
Содержание файла script_razbienie.sh
```
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
```
Содержание postinst в debian (включен также скрипт по монтированию)
```
#!/bin/bash
cat <<EOF > /opt/myscript.sh
#!/bin/bash
echo "Что вы хотите сделать? 1. Примонтировать. 2. Отмонтировать"
read num
if [ $num =  1 ]; then
        sudo mkdir /mnt/usb
        sudo mount /dev/sda /mnt/usb
        ls /mnt/usb
else
        sudo umount /dev/sda
fi
EOF
chmod +x /opt/myscript.sh
cat <<- 'EOF' > /opt/script_razbienie.sh
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
EOF
chmod +x /opt/script_razbienie.sh
```
