INPUT=latest-resume.md
OUTPUT_HTML=WilliamMoon.html
#OUTPUT_PDF=WilliamMoon.pdf

#$(OUTPUT_PDF): $(OUTPUT_HTML)
#	pandoc -f html -o $@ $^

$(OUTPUT_HTML): $(OUTPUT_PDF) $(INPUT) *.css Makefile
	pandoc --standalone --self-contained --id-prefix='wrm-' -o $@ -f markdown  --email-obfuscation=none -t html5 -H clearness2.css $(INPUT) 

.PHONY: clean
clean:
	rm -f $(OUTPUT_HTML) $(OUTPUT_PDF)
