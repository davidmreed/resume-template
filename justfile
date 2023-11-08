filename := "resume.yaml"

build:
	zola build

pdf: build
	weasyprint public/resume/index.html \
		Resume-$(cat resume.yaml | yq -r '.basics.name | split(" ") | join("-")').pdf

render: build pdf
	xdg-open Resume-$(cat resume.yaml | yq -r '.basics.name | split(" ") | join("-")').pdf &disown

watch:
	#!/usr/bin/env sh
	inotifywait -m -r . \
		--exclude "(.*\\.pdf$)|public|justfile|\\.git" \
		-e close_write,move,create,delete \
	| while read -r directory events filename; do
		just render
	done