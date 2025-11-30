# compiler
CXX = clang++
CXXFLAGS = -std=c++17 -Ilib/SDL2.framework/Headers -Ilib/SDL2_ttf.framework/Headers
FRAMEWORK_PATH = -Flib -framework SDL2 -framework SDL2_ttf

# src and target
SRC = src/hello.cpp
OUT = hello

all: 
	$(CXX) $(CXXFLAGS) $(SRC) $(FRAMEWORK_PATH) -Wl,-rpath,@loader_path/lib -o $(OUT)

run:
	./$(OUT)

clean: 
	rm -f $(OUT)
