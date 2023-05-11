# requires pandoc and wkhtmltopdf
INPUT=latest-resume.md
OUTPUT_PDF=Moon_Resume_$(shell date +"%Y_%m_%d").pdf

$(OUTPUT_PDF): $(INPUT) *.css Makefile
	pandoc --standalone --self-contained --id-prefix='wrm-' -o $@ -f markdown \
    --email-obfuscation=none -t html -H clearness2.css --metadata title="William R. Moon" \
    -V title='' -V "papersize=Letter" -V  "margin-left=.5in" \
    -V "margin-right=.5in" -V "margin-top=.5in" -V "margin-bottom=.5in" \
    $(INPUT)

.PHONY: clean
clean:
	rm -f $(OUTPUT_PDF)
