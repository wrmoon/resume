# requires pandoc and wkhtmltopdf

all: Moon_Resume_Manager.pdf Moon_Resume_Eng.pdf

md_to_pdf:
	pandoc --standalone --self-contained --id-prefix='wrm-' -o $(pdf_file) -f markdown \
    --email-obfuscation=none -t html -H clearness2.css --metadata title="William R. Moon" \
    -V title='' -V "papersize=Letter" -V  "margin-left=.5in" \
    -V "margin-right=.5in" -V "margin-top=.5in" -V "margin-bottom=.5in" \
    $(md_file)

Moon_Resume_Manager.pdf: resume_manager.md *.css Makefile
	@$(MAKE) md_to_pdf pdf_file=$@ md_file=$<
	cp $@ $(basename $@)_$(shell date +"%Y_%m_%d").pdf
	sed '/Leadership Skills/,/Skills /{/Skills /!d;}' $< > resume_eng.md
	sed -i 's/Experience/Work Experience/' resume_eng.md
	sed -i 's/, level-headed leader and//' resume_eng.md

Moon_Resume_Eng.pdf: resume_eng.md *.css Makefile
	@$(MAKE) md_to_pdf pdf_file=$@ md_file=$<
	cp $@ $(basename $@)_$(shell date +"%Y_%m_%d").pdf
