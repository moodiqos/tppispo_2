#!/bin/bash

# Определяем путь к тестируемой программе
PROGRAM_PATH="./usr/bin/latin_square"

# Проверяем, существует ли файл
if [ ! -f "$PROGRAM_PATH" ]; then
    echo "Ошибка: Файл $PROGRAM_PATH не найден!"
    exit 1
fi

# Тест 1: Проверка с корректным латинским квадратом 3x3
echo "Тест 1: Проверка с корректным латинским квадратом 3x3"
INPUT="1 2 3
2 3 1
3 1 2"
OUTPUT=$($PROGRAM_PATH <<< "$INPUT")
EXPECTED="Матрица является латинским квадратом."
if [ "$OUTPUT" == "$EXPECTED" ]; then
    echo "Тест 1 пройден успешно"
else
    echo "Тест 1 не пройден. Ожидалось: $EXPECTED, но получено: $OUTPUT"
fi

# Тест 2: Проверка с некорректным латинским квадратом 3x3
echo "Тест 2: Проверка с некорректным латинским квадратом 3x3"
INPUT="1 2 3
2 3 1
3 2 2"
OUTPUT=$($PROGRAM_PATH <<< "$INPUT")
EXPECTED="Матрица не является латинским квадратом."
if [ "$OUTPUT" == "$EXPECTED" ]; then
    echo "Тест 2 пройден успешно"
else
    echo "Тест 2 не пройден. Ожидалось: $EXPECTED, но получено: $OUTPUT"
fi

# Тест 3: Проверка с пустым вводом
echo "Тест 3: Проверка с пустым вводом"
INPUT=""
OUTPUT=$($PROGRAM_PATH <<< "$INPUT")
EXPECTED="Матрица не является латинским квадратом."
if [ "$OUTPUT" == "$EXPECTED" ]; then
    echo "Тест 3 пройден успешно"
else
    echo "Тест 3 не пройден. Ожидалось: $EXPECTED, но получено: $OUTPUT"
fi

# Тест 4: Проверка с квадратом, содержащим дубликаты в строках
echo "Тест 4: Проверка с дубликатами в строках"
INPUT="1 2 3
1 2 3
3 1 2"
OUTPUT=$($PROGRAM_PATH <<< "$INPUT")
EXPECTED="Матрица не является латинским квадратом."
if [ "$OUTPUT" == "$EXPECTED" ]; then
    echo "Тест 4 пройден успешно"
else
    echo "Тест 4 не пройден. Ожидалось: $EXPECTED, но получено: $OUTPUT"
fi
