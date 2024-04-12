all: build/docker-intro.pdf


build/docker-intro.pdf: build/docker-logo.pdf FORCE
	max_print_line=1048576 \
	latexmk \
		-norc -r latexmkrc \
		docker-intro.tex

preview: FORCE
	max_print_line=1048576 \
	latexmk \
		-norc -r latexmkrc \
		-pvc \
		docker-intro.tex


build/docker-logo.pdf: build
	curl -fsSL -o build/docker-logos.zip https://www.docker.com/static/Docker-Logos.zip
	unzip -u build/docker-logos.zip docker-logos/SVG/docker-logo-blue.svg -d build
	inkscape build/docker-logos/SVG/docker-logo-blue.svg -o $@
	ls $@


build:
	mkdir -p $@

FORCE:

clean:
	rm -rf build

.PHONY: all clean FORCE
