# You want latexmk to *always* run, because make does not have all the info.
.PHONY: 

# First rule should always be the default "all" rule, so both "make all" and
# "make" will invoke it.
all: trainee_example.pdf trainer_example.pdf

# CUSTOM BUILD RULES

# In case you didn't know, '$@' is a variable holding the name of the target,
# '$<' is a variable holding the (first) dependency, and '$*' is a variable
# holding the string matching '%' of a rule.

%.tex: %.raw
	./raw2tex $< > $@

%.tex: %.dat
	./dat2tex $< > $@

# MAIN LATEXMK RULE

# -pdf tells latexmk to generate PDF directly (instead of DVI).
# -pdflatex="" tells latexmk to call a specific backend with specific options.
# -use-make tells latexmk to call make for generating missing files.

# -interactive=nonstopmode keeps the pdflatex backend from stopping at a
# missing file reference and interactively asking you for an alternative.

trainee_%.pdf: %.tex
	/bin/sed -i -e 's@^\\usepackage\[trainermanual\]{btp}@\\usepackage{btp}@' $<
	latexmk -pdf -jobname=$(basename $@) -pdflatex='pdflatex -halt-on-error %O %S -synctex=1 -interaction=nonstopmode --src-specials' -quiet -f -use-make $<

trainer_%.pdf: %.tex
	/bin/sed -i -e 's@^\\usepackage{btp}@\\usepackage[trainermanual]{btp}@' $<
	latexmk -pdf -jobname=$(basename $@) -pdflatex='pdflatex -halt-on-error %O %S -synctex=1 -interaction=nonstopmode --src-specials' -quiet -f -use-make $<
	/bin/sed -i -e 's@^\\usepackage\[trainermanual\]{btp}@\\usepackage{btp}@' $<
clean:
	latexmk -CA -jobname=trainee_example example.tex
	latexmk -CA -jobname=trainer_example example.tex
	/bin/sed -i -e 's@^\\usepackage\[trainermanual\]{btp}@\\usepackage{btp}@' example.tex
