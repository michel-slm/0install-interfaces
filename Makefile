help:
	@cat doc/help.txt

package: clean
	@./scripts/package.sh

publish:
	@./scripts/publish.sh

sign:
	@./scripts/sign.sh

clean:
	@-rm -f dist/*.tar.*
