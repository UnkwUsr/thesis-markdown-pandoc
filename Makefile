out/0.pdf: txts/*-*.md tex/* *.bib img/* pandoc.yaml
	mkdir -p out
	pandoc txts/*-*.md -o out/0.pdf -d pandoc.yaml

out/merged.pdf: out/0.pdf title/*
	mkdir -p out
	libreoffice \
		--headless \
		--convert-to pdf \
        --outdir "title/" \
		title/*.docx

	pdftk title/*.pdf out/0.pdf cat output out/merged.pdf

deps_load:
	(cd deps && wget 'https://raw.githubusercontent.com/pandoc/lua-filters/6ab95da5442396b1fd9e8ec4d342b54156a3c0d7/pandoc-quotes.lua/pandoc-quotes.lua')
	(cd deps && wget 'https://raw.githubusercontent.com/UnkwUsr/pandoc-italize-latin/master/italize-latin.lua')

build: out/0.pdf

view: build
	@echo -e "------ opening zathura ------"
	@zathura out/0.pdf

merge: out/merged.pdf

clean:
	rm -f out/0.pdf out/merged.pdf
	rmdir out/
