# pps23_final_project
git repo for final project of parallel programming.

# project proposal/presentation/report
1. [./group_22_proposal.pdf](./group_22_proposal.pdf)
2. [./group_22_slide.pdf](./group_22_slide.pdf)
3. [./group_22_report.pdf](./group_22_report.pdf)

To make the documents made for the course from tex source:
```
cd docs 
make
```
Please be sure to install xelatex and tex packages used by the documents.


# External projects, libs
1. [Klayout](https://www.klayout.de/): The project we would like to explore parallelism opportunity, the focus is on DRC(Design rule check).
2. [openMP](https://www.openmp.org/): Our plan A to parallel some DRC operation like "and". openMP is shipped with gcc/g++, just `#include <omp.h>` in the cpp source and `-fopenmp` when linking the binary.
3. [taskflow](https://taskflow.github.io/): Our plan B to parallelize DRC operation on task level.

# Test caravel design from skywater 130nm openPDK
1. test_case/decred_controller.gds.gz is a cell extracted from caravel.gds.gz of my forked [repo](https://github.com/owlfox/caravel_skywater130_decred_miner) originates from a real chip tape out, see [efabless link](https://platform.efabless.com/projects/27)
    
## steps to build klayout and view the gds
1. install QT5, python, ruby lib and other dependacies, see https://www.klayout.de/build.html
2.
```
cd klayout; ./build.sh -option "-j8" -without-qtbinding  -build build-release
export LD_LIBRARY_PATH="$PWD/build-release"
./build-release/klayout ../test_case/caravel.gds.gz
```

# Test with original and operation benchmark input
1. design input: `test_case/caravel.gds.gz`
2. ruby runset of "and" operation: `test.drc`
3. to execute it: `./drc.sh`, at my test machine

# TaskFlow experiment
1. `./tf.sh`

# test host
1. CPU: 12th Gen Intel(R) Core(TM) i7-12700K
2. MEM: 32 GB DDR4 MEM
3. GPU: NVIDIA GeForce RTX 3050 NVIDIA-SMI 530.41.03  Driver Version: 530.41.03 CUDA Version: 12.1
4. OS: proxmox-ve: 7.3-1 (running kernel: 5.15.35-1-pve)