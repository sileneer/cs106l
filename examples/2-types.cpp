#include <iostream>
#include <string>
#include <sstream>

using namespace std;

void badWelcomeProgramme();
int getInteger(const string& prompt, const string& reprompt);

int main(){
    badWelcomeProgramme();
    return 0;
}

void badWelcomeProgramme(){
    string name, response;
    int age;

    cout << "What is your name? ";
    getline(cin, name);
    cout << "What is your age? ";
    age = getInteger("Enter your age: ", "Invalid input. Please enter a valid age.");

    cout << "Hello " << name << " (age " << age << ")" << "\n";

    cout << "Do you want to try again? ";
    getline(cin, response);

    cout << "You said: " << response << endl;
}

int getInteger(const string& prompt, const string& reprompt) {
    while (true) {
        cout << prompt;
        string line;
        if (!getline(cin, line)) {
            throw domain_error("Error reading input");
        }

        istringstream iss(line);

        int result; char trash;
        if (iss >> result && !(iss >> trash)) {
            return result;
        }
        cout << reprompt << endl;
    }
}