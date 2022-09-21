
clean-code-workshop.pdf: clean-code-workshop.md
	pandoc --pdf-engine lualatex --to beamer -o $@ $<
