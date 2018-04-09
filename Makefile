DIRS=src src2
.PHONY: clean $(DIRS)

$(DIRS):
	+$(MAKE) -C $@

clean:
	+$(MAKE) -C $(DIRS) clean
