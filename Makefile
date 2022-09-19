
clean-code-workshop.pdf: clean-code-workshop.md
	pandoc --to beamer -o $@ $<
