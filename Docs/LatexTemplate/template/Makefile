
all:	paper.pdf slides.pdf handouts.pdf

clean:
	rm -f *log *nav *pdf *out *aux

paper.pdf: paper.tex *tex
	xelatex paper.tex
	bibtex paper
	xelatex paper.tex
	touch paper.tex
	xelatex paper.tex

slides.pdf: slides.tex slideskernel.tex *tex
	xelatex slides.tex

handouts.pdf: slides.tex slideskernel.tex *tex
	xelatex handouts.tex


