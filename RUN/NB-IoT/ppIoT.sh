


COUNT=1
echo "=========================================="
echo "Start assembling files "
echo "=========================================="

#until [ $COUNT -gt $NUM_SIM ]; do
for sched in 0 1 ; do
    for ue in 1000 2000 3000 4000; do
        for cbrs in 64 128 256; do
            for COUNT in $(seq 1 10); do
                FILEIN="SCHED_${sched}_UE_${ue}_CBRS_${cbrs}_$COUNT"
                FILEOUT="SCHED_${sched}_UE_${ue}_CBRS_${cbrs}.dat"    
                ./nbIoTpp.awk TRACE/${FILEIN}
                cat out.tmp >> $FILEOUT

            done
            rm out.tmp
            echo "Arquivo consolidado $FILEOUT"
        done
    done
done

echo "=========================================="
echo "Writing consolidated file  "
echo "=========================================="

for sched in 0 1; do
    for ue in 1000 2000 3000 4000; do
        for cbrs in 64 128 256; do            
            FILEIN="SCHED_${sched}_UE_${ue}_CBRS_${cbrs}.dat"
            gato=`./aggreg.awk $FILEIN` 
            echo "${sched} ${ue} ${cbrs} $gato" >> consolidated.out 
        done
    done
done
