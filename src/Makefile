exe=test
input=input
ffile=flags_withO0.txt

.PHONY: clean optimization_test run_test

run: run_test clean

optimization_test:
	./execute_optimization_test.sh $(exe) $(input) $(ffile)

clean:
	rm -f *.dat

cleandata:
	rm -f *.csv *.out
