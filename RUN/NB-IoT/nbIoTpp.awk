#!/usr/bin/awk -f
#--------------------------------------
#   Post processing of 5G-air-sim files 
#   (NB-IoT)
#   By MJT, on 2020-03-26 @Lima 
#--------------------------------------

 
BEGIN	{
    cong = 0
    tot = 0
    i=0
    j=0
    # print "POST PROCESSING - Nb-IoT Files" 
    
}
# ##----------------------------------
# ## Getting info on sensors position
# ##----------------------------------

# /^Created UE/{
#     {print $5,$7,$8 > "positions.dat"}
# }

/^RACH/ {
    #AVG CONG

    if ($12!=0) {

        cong += $10/$12 
        j++
    }
}
/^RX/ {
    #avg RX
    rx += $8
    del += $14
    i++;
}

/^TX/ {
    tx += $8
    k++
}

END	{ 
    plr = (tx-rx) / tx * 100
    {print del/i, cong/j, plr > "out.tmp" }
    #{print cong/j > "cong.tmp" }
    # printf "Tot =  %f\n", tot  
    # printf "i = %i\n", i
    # printf "AVG Delay = %f\n", tot/i
}
 #end AWK