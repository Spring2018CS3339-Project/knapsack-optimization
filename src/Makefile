exe=test1
objects=knapsack.o
cc=g++
input=input
flags=-Wall -g -O3

.PHONY: clean

exc: $(exe)
	./$(exe) $(input) > log.dat

$(exe): $(objects)
	$(cc) -o $(exe) $(objects)

$(objects): %.o: %.cpp
	$(cc) -c $(flags) $< -o $@

clean: 
	rm *.dat $(objects) $(exe)
