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


build/docker-logo.pdf:
	curl -fsSL -o build/docker-logos.zip https://www.docker.com/static/Docker-Logos.zip
	unzip -fd build build/docker-logos.zip docker-logos/SVG/docker-logo-blue.svg
	inkscape build/docker-logos/SVG/docker-logo-blue.svg -o $@


build:
	mkdir -p $@

FORCE:

clean:
	rm -rf build

.PHONY: all clean FORCE
