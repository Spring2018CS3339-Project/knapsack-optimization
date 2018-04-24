exe=test
input=input
ffile=flags_levels.txt

.PHONY: clean optimization_test run

run: optimization_test clean

optimization_test:
	./execute_test.sh $(exe) $(input) $(ffile)

clean:
	rm *.dat

cleandata:
	rm *.csv *.out
