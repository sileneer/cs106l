#include <iostream>
#include <vector>
#include <list>
#include <deque>
#include <set>
#include <typeinfo>
#include "6_templates.h"


using namespace std;

template <typename T>
pair<T, T> myMinMax(T a, T b) {
    if (a < b) {
        return {a, b};
    } else {
        return {b, a};
    }
}

template <typename T>
void printMinMax(T min, T max) {
    cout << "Min: " << min << endl;
    cout << "Max: " << max << endl;
    cout << endl;
}

void minmaxTestBasic() {
    auto [min1, max1] = myMinMax(3, -2);
    printMinMax(min1, max1);

    auto [min2, max2] = myMinMax(3.5, -2.1);
    printMinMax(min2, max2);

    auto [min3, max3] = myMinMax('g', 'e');
    printMinMax(min3, max3);

    auto [min4, max4] = myMinMax("Avery", "Anna");
    printMinMax(min4, max4);
}

void minmaxTestExplicit() {
    auto [min1, max1] = myMinMax<int>(3, -2);
    printMinMax(min1, max1);

    auto [min2, max2] = myMinMax<double>(3.5, -2.1);
    printMinMax(min2, max2);

    auto [min3, max3] = myMinMax<char>('g', 'e');
    printMinMax(min3, max3);

    auto [min4, max4] = myMinMax<string>("Avery", "Anna");
    printMinMax(min4, max4);

    auto [min5, max5] = myMinMax<vector<int>>({1, 2, 3}, {4, 5, 6});
    // printMinMax(min5, max5);

    auto [min6, max6] = myMinMax<Time>({9, 30}, {10, 15});
    printMinMax(min6, max6);
}

template <typename T>
T getTypeValue() {
    while (true) {
        cout << "Enter a " << typeid(T).name() << ": ";
        string line;
        T result;
        char extra;
        if (!getline(cin, line)) {
            throw domain_error("Unable to get line from cin.");
        }
        istringstream iss(line);
        if (iss >> result && !(iss >> extra)) {
            return result;
        }
        cout << "Invalid format." << endl;
    }
}



void getTypeTest() {
    int val1 = getTypeValue<int>();
    double val2 = getTypeValue<double>();
    Time val3 = getTypeValue<Time>();
    cout << "int is " << val1 << endl;
    cout << "double is " << val2 << endl;
    cout << "Time is " << val3 << endl;
}

int main() {
    cout << "Start minmax test basic:" << endl;
    minmaxTestBasic();
    cout << "Start minmax test explicit:" << endl;
    minmaxTestExplicit();

    getTypeTest();
    return 0;
}
