help:
	@cat doc/help.txt

package:
	@./scripts/package.sh

publish: clean
	@./scripts/publish.sh

sign:
	@./scripts/sign.sh

clean:
	@-rm -f dist/*.tar.*
