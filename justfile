up:
	zola serve

down:
	killall zola

build:
	zola build

pdf: build
	weasyprint public/resume/index.html Resume-David-Reed.pdf \
	  -s public/resume.css