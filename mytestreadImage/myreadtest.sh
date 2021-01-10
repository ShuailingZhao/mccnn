#!/bin/bash
j=0;
for i in `ls L*.png`
do
	echo $Lfname
	Lh[j]=`python mygetImageH.py ${i}`
	Lw[j]=`python mygetImageW.py ${i}`
	# printf $s
	Lf[j]=$i
	echo $i
	echo ${Lh[j]}
	echo ${Lw[j]}
	let "j++"
done

j=0;
for i in `ls R*.png`
do
	Rh[j]=`python mygetImageH.py ${i}`
	Rw[j]=`python mygetImageW.py ${i}`
	# printf $s
	Rf[j]=$i
	echo $i
	echo ${Rh[j]}
	echo ${Rw[j]}
	let "j++"
done

j=0;
for i in ${Lf[*]}
do
echo "+++++++++++++++++++++++++++++++++ $j"
echo ${Lf[j]} ${Rf[j]} ${Lh[j]} ${Lw[j]}
./main.lua kitti fast -a predict -net_fname net/net_kitti_fast_-a_train_all.t7 -left samples/input/${Lf[j]} -right samples/input/${Rf[j]} -disp_max 70
luajit samples/bin2png.lua 70  ${Lh[j]} ${Lw[j]}
echo "--------------------------------- $j"
dispName=${Lf[j]#*L}
dispName="D""$dispName"
mv disp.png $dispName
let "j++"
done
