# THIS SAMPLE SCRIPT ONLY TAKES TIFF AS INPUT
# BY DEFAULT IT WILL GENERATE 5 OCTAVES FOR THE DETECTION
# AND PRODUCE A DETECTION OUTPUT
# CALL IT WITH:
#   bash samplecall.sh sampledata/48_19a-C2_Ream\ Up\ 3_3B.tif 
INPUT=$1
OUTFILE=${1}_out_dips_c4_ms.txt
h=500                             # window height
d=250                             # window stride
R=10                              # R (hough rad)
l=55                              # nfa l (usually 0)
n=200000                          # nrsamples (random samples for randomized hough)

TPD=dyps3
mkdir $TPD

f=1 # octave zoom factor
for o in 0 1 2 3 4; do
   if [[ $o -eq 0 ]]; then          
       INPUT="${1}"                
   else                           
       ./fancy_downsa v 1 2 "${INPUT}"  "${1}.$o.tif" 
       INPUT="${1}.$o.tif"      
   fi
	H=`./tiffu imprintf %h "$INPUT"`  # total image height
	PARAMS="-o $o -H $h -l $l  -R $R -n $n"
	for i in `seq 0 $[H/d]`; do
		O=$TPD/out_${o}_${i}.txt
		#echo ./vnav cli "$INPUT" $O $PARAMS -h $[f*i*d]
		./vnav cli "$INPUT" $O $PARAMS -h $[f*i*d]
	done
	f=$[2*f]
done

(echo "phi1 phi2 depth orientation nfa octave"; cat `ls $TPD/*|sort -V`) > "$OUTFILE"


