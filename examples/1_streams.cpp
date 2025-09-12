#include <iostream>
#include <sstream>
#include <string>

using namespace std;

int stringToInteger(const string& s);
void stringToIntegerTest();
void printStateBits(const istream& iss);

int main(){
    stringToIntegerTest();
    return 0;
}

int stringToInteger(const string& s){
    istringstream iss(s);
    // printStateBits(iss);

    int result;
    iss >> result;
    if (iss.fail()){
        throw std::domain_error("no value int at beginning!");
    }

    char remain;
    iss >> remain;
    if (!iss.fail()) {
        throw std::domain_error("stuff after a valid int!");
    }

    // int result;
    // if (!(iss >> result)) {
    //     throw std::domain_error("no value int at beginning!");
    // }

    // char remain;
    // if (iss >> remain) {
    //     throw std::domain_error("stuff after a valid int!");
    // }

    // printStateBits(iss);
    return result;
}

void stringToIntegerTest(){
    while (true) {
        cout << "Type in an integer: ";
        string s;
        if (!getline(cin, s)) {
            throw std::domain_error("getline failed");
        }

        cout << "You typed in: " << s << "\n";
        int result = stringToInteger(s);
        cout << "As an integer, this is: " << result << "\n";
        cout << "Half of that is: " << result / 2 << "\n";
    }
}

void printStateBits(const istream& iss) {
    cout << "State bits: ";

    cout << (iss.good() ? "G" : "-");
    cout << (iss.fail() ? "F" : "-");
    cout << (iss.eof() ? "E" : "-");
    cout << (iss.bad() ? "B" : "-");
    cout << "\n";
}