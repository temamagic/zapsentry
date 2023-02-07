nextTag:= $(shell autotag --scheme=conventional -n)
currentTag:=$(shell git describe --tags)

changelog:
	git-chglog -o CHANGELOG.md --next-tag $(nextTag)

release:
	git-chglog -o CHANGELOG.md --next-tag $(nextTag)
	git add CHANGELOG.md
	git commit -m "CHANGELOG.md update $(nextTag)"
	git tag v$(nextTag)