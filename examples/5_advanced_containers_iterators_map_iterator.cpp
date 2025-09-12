#include <iostream>
#include <string>
#include <sstream>
#include <map>

using std::string;
using std::cin;
using std::cout;
using std::endl;
using std::map;
using std::stringstream;

map<string, int> readUserWords();
string _getLine();

int main() {
    map<string, int> freqMap;
    freqMap = readUserWords();

    map<string, int>::iterator it = freqMap.begin();
    while (it != freqMap.end()) {
        cout << (*it).first << ": " << (*it).second << endl;
        ++it;
    }
}

string _getLine() {
    string line;
    std::getline(cin, line);
    return line;
}

map<string, int> readUserWords() {
    cout << "Enter words: " << endl;
    map<string, int> m;
    while(true) {
        cout << "> ";
        string response = _getLine();

        if(response.empty()) {
            return m;
        }

        stringstream stream(response);
        string word;

        while(stream >> word) {
            ++m[word];
        }
    }
}
