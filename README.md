# pps23_final_project
git repo for final project of parallel programming.

# project proposal/presentation/report
```
cd docs 
make
```
Please be sure to install xelatex and tex packages used by the documents.
Generated pdf files can be found at:
1. [group_22_proposal.pdf](./group_22_proposal.pdf)
2. [group_22_slide.pdf](./group_22_slide.pdf)
3. [group_22_report.pdf](./group_22_report.pdf)

# External projects
1. Klayout
2. taskflow

# Test caravel design from skywater 130nm openPDK
1. test_case/decred_controller.gds.gz is a cell extracted from caravel.gds.gz of my forked [repo](https://github.com/owlfox/caravel_skywater130_decred_miner) originates from a real chip tape out, see [efabless link](https://platform.efabless.com/projects/27)
    
cd klayout; ./build.sh -option "-j8" -without-qtbinding  -build build-release