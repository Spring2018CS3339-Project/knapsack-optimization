exe=test
input=input
ffile=flags_5_5.txt

.PHONY: clean optimization_test parallel_test run run_parallel

run: optimization_test clean

run_parallel: parallel_test clean

optimization_test: 
	./execute_test.sh $(exe) $(input) $(ffile)
parallel_test:
	./execute_optimization_test.sh $(exe) $(input) flags5_9.txt
clean:
	rm -f $(exe) *.dat
cleandata:
	rm -f *.csv *.out
