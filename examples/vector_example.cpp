// Example: C++ Standard Library usage
#include <iostream>
#include <vector>

int main() {
  std::vector<int> v = {1, 2, 3, 4, 5};
  for (int n : v) {
    std::cout << n << ' ';
  }
  std::cout << std::endl;
  return 0;
}
