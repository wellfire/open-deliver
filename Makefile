.PHONY: clean help


clean:  ## Clear out old build directory

i386: clean  ## Build a VirtualBox image for 32-bit, i386 architecture
	packer build -only=i386 packer.json

amd64: clean   ## Build a VirtualBox image for 64-bit architecture
	packer build -only=amd64 packer.json

help:
	@perl -nle'print $& if m{^[a-zA-Z_-]+:.*?## .*$$}' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
	rm -rf build/
