help:
	@cat doc/help.txt

publish: clean
	@./scripts/publish.sh

sign:
	@./scripts/sign.sh

clean:
	@-rm -f dist/*.tar.*
