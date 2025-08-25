#!/bin/bash

# CS106L Helper Script
# Usage: ./cs106l.sh [command] [file]

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Create bin directory if it doesn't exist
mkdir -p bin

case "$1" in
    "build"|"b")
        echo -e "${BLUE}Building project with Makefile...${NC}"
        make
        echo -e "${GREEN}Build complete!${NC}"
        ;;
    "run"|"r")
        echo -e "${BLUE}Building and running...${NC}"
        make && ./bin/main
        ;;
    "clean"|"c")
        echo -e "${YELLOW}Cleaning build artifacts...${NC}"
        make clean
        echo -e "${GREEN}Clean complete!${NC}"
        ;;
    "debug"|"d")
        echo -e "${BLUE}Building with debug symbols...${NC}"
        make
        echo -e "${BLUE}Starting GDB debugger...${NC}"
        gdb ./bin/main
        ;;
    "compile"|"comp")
        if [ -z "$2" ]; then
            echo -e "${RED}Error: Please specify a file to compile${NC}"
            echo "Usage: $0 compile <filename.cpp>"
            exit 1
        fi
        filename=$(basename "$2" .cpp)
        echo -e "${BLUE}Compiling $2...${NC}"
        g++ -std=c++17 -Wall -Wextra -g "$2" -o "bin/$filename"
        echo -e "${GREEN}Compiled to bin/$filename${NC}"
        ;;
    "valgrind"|"val")
        echo -e "${BLUE}Building and running with Valgrind...${NC}"
        make
        valgrind --leak-check=full --show-leak-kinds=all ./bin/main
        ;;
    "format"|"fmt")
        echo -e "${BLUE}Formatting C++ files...${NC}"
        find . -name "*.cpp" -o -name "*.h" -o -name "*.hpp" | xargs clang-format -i
        echo -e "${GREEN}Formatting complete!${NC}"
        ;;
    "check")
        echo -e "${BLUE}Running static analysis...${NC}"
        cppcheck --enable=all --std=c++17 assignments/ examples/ 2>&1 | grep -v "Checking"
        echo -e "${GREEN}Analysis complete!${NC}"
        ;;
    "env")
        echo -e "${BLUE}Running environment check...${NC}"
        ./check-env.sh
        ;;
    "new")
        if [ -z "$2" ]; then
            echo -e "${RED}Error: Please specify a filename${NC}"
            echo "Usage: $0 new <assignment_name>"
            exit 1
        fi
        filename="$2"
        if [[ ! "$filename" == *.cpp ]]; then
            filename="${filename}.cpp"
        fi
        filepath="assignments/$filename"
        if [ -f "$filepath" ]; then
            echo -e "${YELLOW}Warning: File $filepath already exists${NC}"
            read -p "Overwrite? (y/N): " -n 1 -r
            echo
            if [[ ! $REPLY =~ ^[Yy]$ ]]; then
                echo "Cancelled."
                exit 1
            fi
        fi
        cp assignments/template.cpp "$filepath"
        echo -e "${GREEN}Created new assignment: $filepath${NC}"
        echo "You can now edit it with: code $filepath"
        ;;
    "help"|"h"|*)
        echo -e "${BLUE}CS106L Helper Script${NC}"
        echo ""
        echo "Usage: $0 [command] [options]"
        echo ""
        echo "Commands:"
        echo "  build, b        Build the project using Makefile"
        echo "  run, r          Build and run the main program"
        echo "  clean, c        Clean build artifacts"
        echo "  debug, d        Build and start GDB debugger"
        echo "  compile <file>  Compile a single C++ file"
        echo "  valgrind, val   Run with Valgrind memory checker"
        echo "  format, fmt     Format all C++ files with clang-format"
        echo "  check           Run static analysis with cppcheck"
        echo "  env             Run comprehensive environment check"
        echo "  new <name>      Create new assignment from template"
        echo "  help, h         Show this help message"
        echo ""
        echo "Examples:"
        echo "  $0 build                     # Build the project"
        echo "  $0 compile examples/test.cpp # Compile single file"
        echo "  $0 run                       # Build and run"
        echo "  $0 debug                     # Start debugging session"
        echo "  $0 new assignment1           # Create new assignment"
        echo "  $0 env                       # Check environment"
        ;;
esac
