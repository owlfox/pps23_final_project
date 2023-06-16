#!/bin/bash
build=1
omp_thread=1
while [[ "$#" -gt 0 ]]; do
    case $1 in
        -nb|--no_build) build=0 ;;
        -mt|--omp) omp_thread="$2" ; shift;;
        *) echo "Unknown parameter passed: $1"; exit 1 ;;
    esac
    shift
done

echo "build: $build"
echo "omp_thread: $omp_thread"
if [[ ${build} -eq 1 ]]; then
    ./build.sh -option "-j8" -without-qtbinding  -build build-release>& build.log
fi
parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
cd "$parent_path"
pw=$(pwd)
export LD_LIBRARY_PATH="$PWD/klayout/build-release"
echo $LD_LIBRARY_PATH

$PWD/klayout/build-release/klayout -b -rd input=test_case/caravel.gds.gz -rd report=test_drc.txt -r test.drc
exit 

#for t in  1 2 4 8; do
# echo running..omp_thread:$t
# ./klayout/build-release/klayout -omp $t -d 50 -b -rd input=test_case/caravel.gds.gz -rd report=test_drc.txt -r test.drc >& drc.log.$t


# perf + flamegraph
#sudo sh -c 'echo -1 > /proc/sys/kernel/perf_event_paranoid'
# rm perf.data $t.*svg $t.*folded
# echo "perf record -F 99 -g -a -- ./klayout -omp $t -d 20 -b -rd input=caravel.gds.gz -rd report=test_drc.txt -r test.drc >& $t.drc.log"
# perf record -F 99 -g -a  -- ./klayout -d 20 -b -rd input=caravel.gds.gz -rd report=test_drc.txt -r test.drc >& $t.drc.log;
# echo "perf script | /home/zeren/ws/FlameGraph/stackcollapse-perf.pl > $t.klayout.folded;"
# perf script | /home/zeren/ws/FlameGraph/stackcollapse-perf.pl > $t.klayout.folded;
#  /home/zeren/ws/FlameGraph/flamegraph.pl klayout.folded > $t.klayout.svg;
# echo "/home/zeren/ws/FlameGraph/flamegraph.pl klayout.folded > $t.klayout.svg;"
# done

#gdb -x gdb.script ./bin-release/klayout
# perf record -g -- ./bin-release/klayout  -d 20 -b -rd input=test.gds.gz -rd report=test_drc.txt -r test.drc
# perf script | /home/zeren/ws/FlameGraph/stackcollapse-perf.pl > klayout.folded;
# /home/zeren/ws/FlameGraph/flamegraph.pl klayout.folded > klayout.svg;

