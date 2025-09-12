#include <iostream>
#include <string>
#include <map>
#include <sstream>

using std::string;
using std::cin;
using std::cout;
using std::endl;

string getLine() {
    string response;
    std::getline(cin, response);
    return response;
}

int main() {
    std::map<string, int> frequencyMap;
    cout << "Enter words." << endl;

    while (true) {
        cout << "> ";
        string response = getLine();
        if (response.empty()) {
            break;
        }
        std::istringstream stream(response);
        string word;
        while (stream >> word) {
            ++frequencyMap[word];
        }
    }

    cout << "Enter words to look up. " << endl;
    while (true) {
        cout << "> ";
        string response = getLine();
        if (response.empty()) {
            break;
        }
        if (frequencyMap.count(response)) {
            cout << frequencyMap[response] << " entries found." << endl;
        } else {
            cout << "None." << endl;
        }
    }
}