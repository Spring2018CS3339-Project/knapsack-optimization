.PHONY: clean

makeall:
	+$(MAKE) -C src

clean:
	+$(MAKE) -C src clean
