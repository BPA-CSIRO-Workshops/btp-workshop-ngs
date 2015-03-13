# Make parameters
SHELL = bash

# You want latexmk to *always* run, because make does not have all the info.
.PHONY: 

handout_latex_files  = handout.tex

MODULE_TEX_FILES = $(shell find ./*/handout/ -maxdepth 1 -type f -path '\./[0-9]*.tex' | sort -n)

MODULE_SED_EXPRESSIONS = $(addprefix -e '/^\\chapterstyle{module}/a \\\input{, $(addsuffix }', $(MODULE_TEX_FILES)))

trainer_output_files = $(addprefix trainer_, $(addsuffix .pdf, $(basename $(handout_latex_files))))
trainee_output_files = $(addprefix trainee_, $(addsuffix .pdf, $(basename $(handout_latex_files))))

# First rule should always be the default "all" rule, so both "make all" and
# "make" will invoke it.
all: $(trainer_output_files) $(trainee_output_files)

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

handout.tex: template.tex $(MODULE_TEX_FILES)
	sed $(MODULE_SED_EXPRESSIONS) < template.tex > $@

trainee_%.pdf: %.tex
	/bin/sed -i -e 's@^\\usepackage\[trainermanual\]{btp}@\\usepackage{btp}@' $<
	TEXINPUTS=.:.//:$$TEXINPUTS latexmk -pdf -jobname=$(basename $@) -pdflatex='pdflatex -halt-on-error %O %S -synctex=1 -interaction=nonstopmode --src-specials' -quiet -f -use-make $<

trainer_%.pdf: %.tex
	/bin/sed -i -e 's@^\\usepackage{btp}@\\usepackage[trainermanual]{btp}@' $<
	TEXINPUTS=.:.//:$$TEXINPUTS latexmk -pdf -jobname=$(basename $@) -pdflatex='pdflatex -halt-on-error %O %S -synctex=1 -interaction=nonstopmode --src-specials' -quiet -f -use-make $<
	/bin/sed -i -e 's@^\\usepackage\[trainermanual\]{btp}@\\usepackage{btp}@' $<

clean: 
	if [[ -e $(handout_latex_files) ]]; then latexmk -C -jobname=trainee_$(basename $(handout_latex_files)) $(handout_latex_files); latexmk -C -jobname=trainer_$(basename $(handout_latex_files)) $(handout_latex_files); fi
	rm -f *.cut licences/*.xmpi
	rm -f $(handout_latex_files)
