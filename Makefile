DIRS=src
.PHONY: clean $(DIRS)

$(DIRS):
	+$(MAKE) -C $@

clean:
	+$(MAKE) -C $(DIRS) clean
