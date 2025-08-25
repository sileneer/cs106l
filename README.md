# CS106L - Standard C++ Programming

A complete development environment for Stanford's CS106L course, optimized for learning modern C++ with VS Code and Dev Containers.

## 🚀 Quick Start

### Prerequisites
- Docker Desktop
- VS Code with Dev Containers extension

### Setup
1. Clone this repository:
   ```bash
   git clone https://github.com/sileneer/cs106l.git
   cd cs106l
   ```

2. Open in VS Code:
   ```bash
   code .
   ```

3. When prompted, click "Reopen in Container" or use the Command Palette (`Ctrl+Shift+P`) and select "Dev Containers: Reopen in Container"

## 📁 Project Structure

```
cs106l/
├── assignments/         # Your CS106L assignments
│   ├── main.cpp        # Example starter file
│   ├── template.cpp    # Template for new assignments
│   └── test_assignment.cpp # Example assignment
├── examples/           # Code examples and experiments
│   └── vector_example.cpp
├── notes/              # Course notes and documentation
│   └── README.md
├── bin/                # Compiled executables (Makefile)
├── build/              # CMake build directory
├── .vscode/            # VS Code configuration
│   ├── settings.json   # Editor settings
│   ├── tasks.json      # Build and run tasks
│   ├── launch.json     # Debug configurations
│   ├── cmake-kits.json # CMake toolchain
│   └── extensions.json # Recommended extensions
├── .devcontainer/      # Development container config
├── CMakeLists.txt      # Advanced CMake build system
├── Makefile           # Simple make build system
├── cs106l.sh          # Helper script for common tasks
├── check-env.sh       # Environment verification script
└── README.md          # This file
```

## 🛠 Configuration

### Dev Container Features
- **C++ Tools**: GCC 10.2.1, CMake 3.22.2, Make 4.3
- **Debugging**: GDB, Valgrind
- **Code Quality**: clang-format, clang-tidy, cppcheck
- **Extensions**: C/C++ IntelliSense, CMake Tools, Makefile Tools

### VS Code Settings
- **Format on Save**: Enabled with Google C++ style
- **Tab Size**: 4 spaces
- **Rulers**: 80 and 120 character guides
- **File Associations**: `.tpp`, `.h`, `.hpp` files treated as C++

## 🔨 Building Your Code

### Option 1: Using Helper Script (Recommended)

**Quick commands:**
```bash
./cs106l.sh build       # Build with Makefile
./cs106l.sh run         # Build and run
./cs106l.sh clean       # Clean build artifacts
./cs106l.sh new mycode  # Create new assignment from template
./cs106l.sh env         # Check environment setup
```

### Option 2: Using Makefile

**Build:**
```bash
make
```

**Clean:**
```bash
make clean
```

**Run:**
```bash
./bin/main
```

### Option 3: Using CMake (Advanced)

**Configure and build:**
```bash
mkdir -p build
cd build
cmake ..
make
```

**Run:**
```bash
./bin/main
```

**Note:** CMake automatically discovers and builds all `.cpp` files in `assignments/` and `examples/` directories.

### Option 4: Using VS Code Tasks

1. Open Command Palette (`Ctrl+Shift+P`)
2. Select "Tasks: Run Task"
3. Choose from:
   - **"Build with Makefile"** - Builds your code
   - **"CMake Build"** - Builds with CMake
   - **"Clean"** - Cleans build artifacts
   - **"Run main.cpp"** - Builds and runs your program
   - **"Compile Current File"** - Compiles the currently open file

**Keyboard shortcuts:**
- `Ctrl+Shift+P` → "Tasks: Run Build Task" → `Ctrl+Shift+B`

## 🐛 Debugging

### Method 1: VS Code Debugger (Recommended)

1. Set breakpoints by clicking in the gutter next to line numbers
2. Press `F5` or go to Run → Start Debugging
3. Choose from available configurations:
   - **"Debug C++ Program"** - Debug with Makefile
   - **"Debug with CMake"** - Debug with CMake build
   - **"Debug Current File"** - Debug the currently open file

### Method 2: Command Line with GDB

**Using helper script:**
```bash
./cs106l.sh debug  # Builds and starts GDB automatically
```

**Manual debugging:**
```bash
make  # Build with debug symbols
gdb ./bin/main
(gdb) break main          # Set breakpoint at main function
(gdb) run                 # Start program
(gdb) step                # Step through code
(gdb) print variable_name # Print variable values
(gdb) continue            # Continue execution
(gdb) quit                # Exit debugger
```

### Memory Debugging with Valgrind

**Using helper script:**
```bash
./cs106l.sh valgrind  # Builds and runs with Valgrind automatically
```

**Manual memory checking:**
```bash
valgrind --leak-check=full ./bin/main
```

## 📝 Development Workflow

### For Each Assignment

#### Method 1: Using Helper Script (Recommended)
```bash
./cs106l.sh new assignment_1     # Create from template
# Edit the file in VS Code
./cs106l.sh run                  # Build and run
./cs106l.sh debug                # Debug if needed
```

#### Method 2: Manual Setup
1. **Create a new file** from template:
   ```bash
   cp assignments/template.cpp assignments/assignment_1.cpp
   ```

2. **Edit the file** using VS Code with full IntelliSense support

3. **Build and test**:
   ```bash
   make                    # or ./cs106l.sh build
   ./bin/main             # or ./cs106l.sh run
   ```

4. **Debug if needed**:
   - Set breakpoints and press `F5`
   - Or use `./cs106l.sh debug`

5. **Check code quality**:
   ```bash
   ./cs106l.sh check      # Run static analysis
   ./cs106l.sh format     # Format code
   ```

### For Experiments and Learning

1. **Create files** in the `examples/` folder for trying out concepts
2. **Take notes** in Markdown files in the `notes/` folder
3. **Compile individual files**:
   ```bash
   ./cs106l.sh compile examples/vector_example.cpp  # Using helper script
   # OR manually:
   g++ -std=c++17 -Wall -Wextra -g examples/vector_example.cpp -o bin/vector_example
   ./bin/vector_example
   ```

## 🎯 Helper Script Commands

The `cs106l.sh` script provides convenient shortcuts for common tasks:

```bash
./cs106l.sh build          # Build with Makefile
./cs106l.sh run            # Build and run main program
./cs106l.sh clean          # Clean build artifacts
./cs106l.sh debug          # Build and start GDB debugger
./cs106l.sh compile <file> # Compile a single C++ file
./cs106l.sh valgrind       # Run with Valgrind memory checker
./cs106l.sh format         # Format all C++ files with clang-format
./cs106l.sh check          # Run static analysis with cppcheck
./cs106l.sh env            # Run comprehensive environment check
./cs106l.sh new <name>     # Create new assignment from template
./cs106l.sh help           # Show all available commands
```

## 🔍 Environment Verification

Run the environment check script to verify your setup:

```bash
./check-env.sh
```

This will check:
- ✅ All development tools (GCC, CMake, GDB, etc.)
- ✅ Project structure
- ✅ Configuration files
- ✅ Build system functionality
- ✅ Code quality tools

## 🎯 Tips for CS106L Success

### Code Style
- Use Google C++ style (auto-formatted on save)
- Follow the 80-character line limit guideline
- Use meaningful variable names

### Best Practices
- **Always compile with warnings**: `-Wall -Wextra`
- **Use version control**: Commit your work frequently
- **Test incrementally**: Build and run after small changes
- **Use the debugger**: Don't just add `cout` statements

### Quick Workflow
```bash
# Start new assignment
./cs106l.sh new assignment2

# Develop iteratively
./cs106l.sh run      # Build and test
./cs106l.sh debug    # Debug if needed
./cs106l.sh format   # Format code
./cs106l.sh check    # Check code quality
```

## 🆘 Troubleshooting

### Container Issues
- **"Cannot connect to Docker"**: Make sure Docker Desktop is running
- **"Extensions not installing"**: Rebuild container with `Ctrl+Shift+P` → "Dev Containers: Rebuild Container"
- **"Tools not found"**: Run `./check-env.sh` to verify installation

### Build Issues
- **"Command not found"**: Make sure you're in the container terminal
- **"Permission denied"**: Run `chmod +x cs106l.sh check-env.sh` to make scripts executable
- **"No such file"**: Check that your source files are in the correct directory
- **"Makefile errors"**: Try `./cs106l.sh clean` and rebuild

#### CMake Build Errors
If you encounter errors like `"No such file or directory"` when building with CMake, especially with files in the `examples/` directory, try these steps:

**Problem**: CMake fails with errors like:
```
c++: error: /workspaces/cs106l/examples/streams.cpp: No such file or directory
c++: fatal error: no input files
compilation terminated.
```

**Solution**: Clean rebuild the CMake build system:
```bash
# Remove the build directory completely
rm -rf build

# Reconfigure CMake from scratch
cmake -B build -S . -DCMAKE_BUILD_TYPE=Debug

# Build everything
cmake --build build --parallel
```

**Alternative using VS Code tasks**:
1. Run "CMake Clean" task
2. Run "CMake Configure" task  
3. Run "CMake Build" task

**Why this happens**: Stale build files or configuration can cause CMake to reference old file paths. The CMake system automatically discovers all `.cpp` files in `assignments/` and `examples/` directories, but sometimes needs a fresh start to properly detect file changes or renames.

### Debugging Issues
- **"No debugging symbols"**: Make sure you compiled with `-g` flag (automatic with our Makefile)
- **"Cannot find source file"**: Use absolute paths or check working directory
- **"GDB not working"**: Try `./cs106l.sh debug` for automatic setup

### VS Code Issues
- **"IntelliSense not working"**: Reload window (`Ctrl+Shift+P` → "Developer: Reload Window")
- **"Extensions not loading"**: Check that you're in the dev container
- **"Tasks not found"**: Make sure `.vscode/tasks.json` exists

### Quick Fixes
```bash
# Reset everything
./cs106l.sh clean
./check-env.sh

# Rebuild container
# Ctrl+Shift+P → "Dev Containers: Rebuild Container"

# Check if tools are working
./cs106l.sh env
```

## 📚 Additional Resources

- [CS106L Course Website](http://cs106l.stanford.edu/)
- [C++ Reference](https://en.cppreference.com/)
- [Google C++ Style Guide](https://google.github.io/styleguide/cppguide.html)
- [GDB Tutorial](https://www.cs.cmu.edu/~gilpin/tutorial/)
- [CMake Tutorial](https://cmake.org/cmake/help/latest/guide/tutorial/)
- [Valgrind User Manual](https://valgrind.org/docs/manual/index.html)

## 🎓 CS106L Assignment Workflow

Here's the recommended workflow for completing CS106L assignments:

1. **Start Assignment**: `./cs106l.sh new assignment_name`
2. **Code**: Edit in VS Code with full IntelliSense
3. **Build & Test**: `./cs106l.sh run`
4. **Debug**: Press `F5` or `./cs106l.sh debug`
5. **Code Quality**: `./cs106l.sh format && ./cs106l.sh check`
6. **Commit**: `git add . && git commit -m "Complete assignment_name"`

## 🔧 Advanced Features

### CMake Auto-Discovery
The CMake system automatically finds and builds all `.cpp` files in:
- `assignments/` directory
- `examples/` directory

### Multiple Debug Configurations
- **Debug C++ Program**: Standard Makefile debugging
- **Debug with CMake**: CMake-based debugging
- **Debug Current File**: Debug any single file

### Code Quality Pipeline
```bash
./cs106l.sh format  # Auto-format with Google style
./cs106l.sh check   # Static analysis with cppcheck
./cs106l.sh env     # Environment verification
```

## 🤝 Contributing

Feel free to improve this setup! Submit issues and pull requests to make this environment better for CS106L students.

### To Contribute:
1. Fork the repository
2. Create a feature branch
3. Test your changes with `./check-env.sh`
4. Submit a pull request

---
**Ready to master C++? Start coding! 🚀**