CXXFLAGS = -std=c++11 -Wall -Wextra -Idake/include `sdl2-config --cflags` -O3
CXX = g++
LDFLAGS = -Ldake -ldake `sdl2-config --libs` -lGL -lpng
LD = g++
RM = rm -f

.PHONY: all clean

all: test

test: test.o
	$(LD) $^ -o $@ $(LDFLAGS)

test.o: test.cpp
	$(CXX) $(CXXFLAGS) -c $^ -o $@

clean:
	$(RM) test test.o
