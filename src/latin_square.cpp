#include <iostream>
#include <vector>
#include <sstream>

using namespace std;

bool isLatinSquare(const vector<vector<int>>& matrix, int size) {
    // Проверка на уникальность значений в строках
    for (int i = 0; i < size; ++i) {
        vector<bool> seen(size, false);
        for (int j = 0; j < size; ++j) {
            if (matrix[i][j] < 1 || matrix[i][j] > size || seen[matrix[i][j] - 1]) {
                return false;
            }
            seen[matrix[i][j] - 1] = true;
        }
    }

    // Проверка на уникальность значений в столбцах
    for (int j = 0; j < size; ++j) {
        vector<bool> seen(size, false);
        for (int i = 0; i < size; ++i) {
            if (seen[matrix[i][j] - 1]) {
                return false;
            }
            seen[matrix[i][j] - 1] = true;
        }
    }

    return true;
}

int main(int argc, char* argv[]) {
    vector<vector<int>> matrix;
    int size = 0;

    if (argc > 1) {
        // Если аргументы переданы в командной строке
        istringstream ss(argv[1]);
        string line;
        while (getline(ss, line)) {
            stringstream ssLine(line);
            vector<int> row;
            int num;
            while (ssLine >> num) {
                row.push_back(num);
            }
            matrix.push_back(row);
            if (size == 0) {
                size = row.size();
            }
        }
    } else {
        // Если аргументы не переданы, запрашиваем ввод с клавиатуры
        cout << "Введите размер матрицы: ";
        cin >> size;
        matrix.resize(size, vector<int>(size));

        cout << "Введите элементы матрицы (по строкам):\n";
        for (int i = 0; i < size; ++i) {
            for (int j = 0; j < size; ++j) {
                cin >> matrix[i][j];
            }
        }
    }

    // Проверка, является ли матрица латинским квадратом
    if (isLatinSquare(matrix, size)) {
        cout << "Матрица является латинским квадратом.\n";
    } else {
        cout << "Матрица не является латинским квадратом.\n";
    }

    return 0;
}
