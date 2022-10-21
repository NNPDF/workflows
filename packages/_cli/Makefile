PACKAGES := $(shell find .. -maxdepth 1 -type d -regex '../[a-z].*' -exec basename {} \;)

.PHONY: build clean cleanall generate

build: generate
	go build -o build/n3pkg n3pkg/main.go

.SECONDEXPANSION:

# depends on
# - files in the corresponding folder ('../%' expanded first)
# - toplevel
# - non-hidden
# - with one of the following extensions: .sh, .patch, .grid
n3pkg/packages/%.go: $$(shell find ../% -maxdepth 1 -not -path '*/.*' \( -name *.sh -o -name *.patch -o -name *.grid \))
	@echo "Generate embedding for '$*'"
	@sh generate/embed.sh $@ $^
	@echo

generate: $(patsubst %, n3pkg/packages/%.go, ${PACKAGES})
	@sh generate/collect.sh n3pkg/packages/packages
	@echo "Embeddings generated\n"

clean:
	rm -rf build

cleanall: clean
	git clean -fdx n3pkg/packages/
