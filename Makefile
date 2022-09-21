
clean-code-workshop.pdf: clean-code-workshop.md
	pandoc --filter pandoc-latex-fontsize --pdf-engine lualatex --to beamer -o $@ $<
