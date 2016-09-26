NAME=resume.md

PANDOC=pandoc
TOPDF=wkhtmltopdf
RM=rm -fv

all: clean html pdf docx txt

html: $(NAME) style.css
	$(PANDOC) --standalone -c style.css --from markdown --to html -o $(NAME:.md=.html) $(NAME)

pdf: html
	$(TOPDF) -d 300 $(NAME:.md=.html) $(NAME:.md=.pdf)

docx: $(NAME)
	$(PANDOC) --from markdown --to docx -o $(NAME:.md=.docx) $(NAME)

txt: $(NAME)
	$(PANDOC) --standalone --smart --from markdown --to plain -o $(NAME:.md=.txt) $(NAME)

clean:
	-$(RM) *~ *.html *.pdf *.docx *.txt
