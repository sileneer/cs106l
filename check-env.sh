#!/bin/bash

# CS106L Environment Check Script
# This script verifies that your development environment is properly configured

echo "🔍 CS106L Environment Check"
echo "=========================="
echo

# Color codes
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Check function
check_command() {
    if command -v "$1" &> /dev/null; then
        echo -e "✅ ${GREEN}$1${NC} is available: $(which $1)"
        if [ "$2" ]; then
            echo "   Version: $($1 $2 2>&1 | head -n1)"
        fi
    else
        echo -e "❌ ${RED}$1${NC} is NOT available"
        return 1
    fi
}

# Check file/directory
check_path() {
    if [ -e "$1" ]; then
        if [ -d "$1" ]; then
            echo -e "✅ ${GREEN}Directory${NC} $1 exists"
        else
            echo -e "✅ ${GREEN}File${NC} $1 exists"
        fi
    else
        echo -e "❌ ${RED}Missing${NC} $1"
        return 1
    fi
}

echo "🛠️  Development Tools"
echo "-------------------"
check_command "gcc" "--version"
check_command "g++" "--version"
check_command "make" "--version"
check_command "cmake" "--version"
check_command "gdb" "--version"
check_command "valgrind" "--version"
check_command "clang-format" "--version"
check_command "clang-tidy" "--version"
check_command "cppcheck" "--version"

echo
echo "📁 Project Structure"
echo "-------------------"
check_path "/workspaces/cs106l"
check_path "/workspaces/cs106l/assignments"
check_path "/workspaces/cs106l/examples"
check_path "/workspaces/cs106l/notes"
check_path "/workspaces/cs106l/bin"
check_path "/workspaces/cs106l/.vscode"
check_path "/workspaces/cs106l/.devcontainer"

echo
echo "⚙️  Configuration Files"
echo "----------------------"
check_path "/workspaces/cs106l/Makefile"
check_path "/workspaces/cs106l/CMakeLists.txt"
check_path "/workspaces/cs106l/.vscode/settings.json"
check_path "/workspaces/cs106l/.vscode/tasks.json"
check_path "/workspaces/cs106l/.vscode/launch.json"
check_path "/workspaces/cs106l/.vscode/extensions.json"
check_path "/workspaces/cs106l/.devcontainer/devcontainer.json"
check_path "/workspaces/cs106l/.gitignore"

echo
echo "🧪 Build System Tests"
echo "--------------------"

# Test Makefile build
echo -e "${BLUE}Testing Makefile build...${NC}"
if cd /workspaces/cs106l && make clean && make; then
    echo -e "✅ ${GREEN}Makefile build successful${NC}"
    if ./bin/main > /dev/null 2>&1; then
        echo -e "✅ ${GREEN}Makefile executable runs successfully${NC}"
    else
        echo -e "❌ ${RED}Makefile executable failed to run${NC}"
    fi
else
    echo -e "❌ ${RED}Makefile build failed${NC}"
fi

# Test CMake build
echo -e "${BLUE}Testing CMake build...${NC}"
if cd /workspaces/cs106l && rm -rf build && mkdir build && cd build && cmake .. > /dev/null 2>&1 && make > /dev/null 2>&1; then
    echo -e "✅ ${GREEN}CMake build successful${NC}"
    if ./bin/main > /dev/null 2>&1; then
        echo -e "✅ ${GREEN}CMake executable runs successfully${NC}"
    else
        echo -e "❌ ${RED}CMake executable failed to run${NC}"
    fi
else
    echo -e "❌ ${RED}CMake build failed${NC}"
fi

echo
echo "📊 Code Quality Tools"
echo "--------------------"

# Test clang-format
echo -e "${BLUE}Testing clang-format...${NC}"
if cd /workspaces/cs106l && clang-format --version > /dev/null 2>&1; then
    echo -e "✅ ${GREEN}clang-format is working${NC}"
else
    echo -e "❌ ${RED}clang-format test failed${NC}"
fi

# Test cppcheck
echo -e "${BLUE}Testing cppcheck...${NC}"
if cd /workspaces/cs106l && cppcheck assignments/main.cpp > /dev/null 2>&1; then
    echo -e "✅ ${GREEN}cppcheck is working${NC}"
else
    echo -e "❌ ${RED}cppcheck test failed${NC}"
fi

echo
echo "🎯 Summary"
echo "----------"
echo "Your CS106L development environment check is complete!"
echo ""
echo "Next steps:"
echo "1. If any tools are missing, rebuild your dev container"
echo "2. Start coding in the assignments/ directory"
echo "3. Use 'make' or CMake to build your projects"
echo "4. Use F5 in VS Code to debug your programs"
echo ""
echo "Happy coding! 🚀"
