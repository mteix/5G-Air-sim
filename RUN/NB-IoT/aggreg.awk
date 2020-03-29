#!/usr/bin/awk -f
#--------------------------------------
#   Post processing of 5G-air-sim files 
#   (NB-IoT)
#   By MJT, on 2020-03-26 @Lima 
#--------------------------------------

 
BEGIN	{
      
}

{


#avg RX
    tot1 += $1
    tot2 += $2
    tot3 += $3
    
}

    


END	 {

 {print tot1/NR , tot2/NR, tot3/NR}

}
    
    #{print cong/j > "cong.tmp" }
    # printf "Tot =  %f\n", tot  
    # printf "i = %i\n", i
    # printf "AVG Delay = %f\n", tot/i
 #end AWK