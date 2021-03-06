.PHONY: rel deps test

all: deps compile

compile: deps
	@./rebar compile

app:
	@./rebar compile skip_deps=true

deps:
	@./rebar get-deps

clean:
	@./rebar clean

distclean: clean
	@./rebar delete-deps

DIALYZER_APPS = kernel stdlib sasl erts compiler syntax_tools

include tools.mk

typer:
	typer --annotate -I ../ --plt $(PLT) -r src
