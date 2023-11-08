build:
	zola build

pdf: build
	weasyprint public/resume/index.html Resume-David-Reed.pdf \
	  -s public/resume.css

render: build pdf
	xdg-open Resume-David-Reed.pdf &disown

watch:
	inotifywait -m -r . \
	--exclude "(.*\\.pdf$)|public|justfile" \
	-e close_write,move,create,delete \
	| while read -r directory events filename; do echo $filename; just render; done