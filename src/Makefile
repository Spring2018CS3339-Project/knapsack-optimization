exe=test
input=input
ffile=flags.txt

.PHONY: clean optimization_test run

run: optimization_test

optimization_test:
	./execute_test.sh $(exe) $(input) $(ffile)

clean:
	rm $(exe) *.dat

cleancsv:
	rm *.csv
