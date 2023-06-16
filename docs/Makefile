.ONESHELL: # Applies to every targets in the file!
.phony=docs clean



docs: group_22_slide.pdf group_22_proposal.pdf group_22_report.pdf
	 

group_22_slide.pdf: slide/slide.tex
	cd slide
	xelatex slide.tex
	cd -
	ln -sf slide/slide.pdf $@

group_22_proposal.pdf: proposal/proposal.tex
	cd proposal
	xelatex proposal.tex
	cd -
	ln -sf proposal/proposal.pdf $@

group_22_report.pdf: report/report.tex
	cd report
	xelatex report.tex
	cd -
	ln -sf report/report.pdf $@


clean: *.aux *.log *.out
	rm $^