## Usage

1. Clone repo
2. Run `make deps_load` to download dependencies (pandoc filters) if needed
3. Run `make build` to build pdf. See results in `out/0.pdf`.
4. Also you can run `make view` to build and immediately preview result with
   `zathura` (if installed)
5. Run `make merge` when want to build final version with merged title pages.
   See results in `out/merged.pdf`

## Notes

P.S. current tex template and bibliography style (.csl) are meant to be used in
Russian papers. You may want to replace it or adapt to your needs.

## Known problems (bugs)

Symbol `/` can block words wrapping. Known workaround is using `\slash` in
place of this symbol. Example: `one\slash two`.

## Dependencies

* `pandoc` - main job, to convert markdown to tex and pdf.
* `make` - used to run commands to build. Can be omitted.
* `libreoffice` - to render title from docx to pdf. Can be omitted.
* `pdftk` - to merge rendered title and output from pandoc.
* latex and everything else...
