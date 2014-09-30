# You want latexmk to *always* run, because make does not have all the info.
.PHONY: 

#made this change to make a handout containing QC and rna-seq moduels only
handout_latex_files  = handout.tex
#handout_latex_files  = qc_rnaseq_only.tex

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

trainee_%.pdf: %.tex
	/bin/sed -i -e 's@^\\usepackage\[trainermanual\]{btp}@\\usepackage{btp}@' $<
	latexmk -pdf -jobname=$(basename $@) -pdflatex='pdflatex -halt-on-error %O %S -synctex=1 -interaction=nonstopmode --src-specials' -f -use-make $<

trainer_%.pdf: %.tex
	/bin/sed -i -e 's@^\\usepackage{btp}@\\usepackage[trainermanual]{btp}@' $<
	latexmk -pdf -jobname=$(basename $@) -pdflatex='pdflatex -halt-on-error %O %S -synctex=1 -interaction=nonstopmode --src-specials' -f -use-make $<
	/bin/sed -i -e 's@^\\usepackage\[trainermanual\]{btp}@\\usepackage{btp}@' $<

clean: 
	latexmk -C -jobname=trainee_$(basename $(handout_latex_files)) $(handout_latex_files)
	latexmk -C -jobname=trainer_$(basename $(handout_latex_files)) $(handout_latex_files)
	/bin/sed -i -e 's@^\\usepackage\[trainermanual\]{btp}@\\usepackage{btp}@' $(handout_latex_files)
