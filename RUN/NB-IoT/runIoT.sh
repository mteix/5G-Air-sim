# Exemple command
# ./5G-air-simulator  nbCell  sched_NB-IoT  time  r  nUe bw nC spa  tones  cbrT cbrS aMax nCl 
# [p0]  [pAtt]  [pRep]  [rWind]  [nP]  [period]  [o]  [boW]  (seed)
#		 --> ./5G-air-simulator nbCell 0 150 1000 1200 5 1 15 1 60 256 4 1 1 3 1 12 48 320 8 256 1

# legend:
		#  r is the cell radius (m)
		#  time is the duration in seconds of each simulation run (s)
		#  nTx is the number of beams used at the base station for the first-stage precoding (or number of tx antennas)
		#  nMu is the number of users that can be scheduled simultaneously for each resource block and TTI
		#  nRx is the number of receiving antennas at the mobile terminals
		# ----> cbrT is the time interval between two successive transmission by the same user (s)
# 
		#  ---> bw is the total bandwidth used by the base station (MHz)
		#  ---> nC is the number of NB-IoT carriers
		#  ---> spa is the subcarrier spacing (kHz)
		#  --->tones is the number of tones
		#  --->cbrS is the size of the data sent by the users at each transmission (byte)
		#  --->aMax is the maximum number of retry attempts for the random access procedure
		#  --->nCl is the number of the coverage classes
		#  --->[p] is the probability that users belong to the coverage classes
		#  --->[pA] is the number of preamble transmission attempts
		#  --->[pRep] is the number of preamble repetition
		#  --->[rWind] is the duration of the RAR window (ms)
		#  --->[nP] is the number of different RACH preambles
		#  --->[period] is the periodicity of RACH resources (ms)
		#  --->[o] is the starting time of RACH resources (ms)
		#  --->[boW] is the duration of the RACH backoff window (ms)
		#  --->(seed) is an optional seed to initialize random quantities to different and reproducible values for each simulation run 
# 
	
		# --> sched_NB-IoT: 0-> FIFO, 1-> RR
		#  random_access_type: 1-> Baseline, 2-> Enhanced
		#  traf: 1-> CBR, 2-> FTP

        # ./5G-air-simulator  nbCell  sched_NB-IoT  time  r  nUe bw nC spa  tones  cbrT cbrS aMax nCl 
# [p0]  [pAtt]  [pRep]  [rWind]  [nP]  [period]  [o]  [boW]  (seed)



set -x
set -e

_COUNT=1
_NB_SEEDS=10

until [ $_COUNT -gt $_NB_SEEDS ]; do

for sched in 0 1
do 
for ue in 1000 2000 3000 4000	#number of users
do
for cbrS in 64 128 256  	#packet size
do	
# for v in 3 120			#users speed
# do
	../../5G-air-simulator nbCell $sched 150 1000 $ue 5 1 15 1 60 $cbrS 4 1 1 3 1 12 48 320 8 256 1 > TRACE/SCHED_${sched}_UE_${ue}_CBRS_${cbrS}_$_COUNT
	cd TRACE
	gzip SCHED_${sched}_UE_${ue}_CBRS_${cbrS}_$_COUNT
	cd ..
# done
done
done
done
_COUNT=$(($_COUNT + 1))
done
