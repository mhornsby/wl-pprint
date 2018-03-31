.PHONY: build install

build:
	stack build

install:
	stack install

# Testing
.PHONY: test test-all test-default test-%

test-all: test-default test-7.10.3 test-7.8.4 test-8.0.2 test-8.2.2

test: test-default

test-default:
	stack clean
	stack build
	stack haddock --no-haddock-deps

test-%:
	stack --stack-yaml stack-$*.yaml clean
	stack --stack-yaml stack-$*.yaml build
	stack --stack-yaml stack-$*.yaml haddock --no-haddock-deps
