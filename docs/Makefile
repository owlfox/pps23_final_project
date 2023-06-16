.ONESHELL: # Applies to every targets in the file!
.phony=docs clean



docs: group_22_slide.pdf
	 

group_22_slide.pdf: slide/$@
	cd slide
	xelatex slide.tex
	cd -
	ln -sf slide/slide.pdf $@


clean: *.aux *.log *.out
	rm $^