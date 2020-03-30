set -x
set -e

_COUNT=1
_NB_SEEDS=5

#using UL schedule 1 and changing DL SCHEDULES and delay
until [ $_COUNT -gt $_NB_SEEDS ]; do

    for sched in 1; do
        for ue in 1000 2000 3000 4000; do #number of users
            for cbrS in 64 128 256; do    #packet size
                for delay in 0.04 0.1; do #max delay
                    ../../5G-air-simulator nbCell 1 150 1000 $ue 5 1 15 1 60 $cbrS 4 1 $sched $delay 1 3 1 12 48 320 8 256 -1 >TRACE/SCHED_${sched}_UE_${ue}_CBRS_${cbrS}_DEL_${delay}_$_COUNT
                    cd TRACE
                    gzip SCHED_${sched}_UE_${ue}_CBRS_${cbrS}_DEL_${delay}_$_COUNT
                    cd ..
                done
            done
        done
    done
    _COUNT=$(($_COUNT + 1))
done
