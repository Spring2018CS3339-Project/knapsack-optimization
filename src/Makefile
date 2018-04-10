exe=test
input=input
ffile=flags.txt

.PHONY: clean cleanall optimization_test run

run: optimization_test clean

optimization_test:
	./execute_test.sh $(exe) $(input) $(ffile)

clean:
	rm results.dat *.o $(exe)

cleanall:
	rm *.dat
