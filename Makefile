.PHONY: all clean test

all: terraform-provider-nsone .git/hooks/pre-commit

terraform-provider-nsone:
	go build .

test: .git/hooks/pre-commit
	cd nsone ; go test -v .

clean:
	rm -f terraform-provider-nsone

.git/hooks/pre-commit:
	    if [ ! -f .git/hooks/pre-commit ]; then ln -s ../../git-hooks/pre-commit .git/hooks/pre-commit; fi
