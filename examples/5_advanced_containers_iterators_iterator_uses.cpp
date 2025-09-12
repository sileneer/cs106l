#include <vector>
#include <iostream>
#include <algorithm>
#include <set>

using std::vector;
using std::cout;
using std::endl;
using std::set;

const int ELEM_TO_FIND = 5;

void printVec(const vector<int>& vec){
    for (auto elem: vec) {
        cout << elem << ' ';
    }
    cout << endl;
}

int main() {
    vector<int> vec{3,1,4,1,5,9,2,6};
    printVec(vec);
    std::sort(vec.begin(), vec.end());
    printVec(vec);

    set<int> elems{3,1,4,1,5,9,2,6};
    cout << elems.size() << endl;

    auto testit = std::find(elems.begin(), elems.end(), ELEM_TO_FIND);
    if (testit == elems.end()) {
        cout << "Not found!" << endl;
    } else {
        cout << "Found: " << *testit << endl;
    }

    set<int>::iterator iter = elems.lower_bound(4); // find the smallest element >= key
    set<int>::iterator end = elems.upper_bound(6); // find the smallest element > key
    cout << "start: " << *iter << ", end: " << *end << endl;

    for (; iter != end; ++iter) {
        cout << *iter << ' ';
    }
    cout << endl;

    return 0;
}