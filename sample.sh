
echo "please enter principle valve"
read p
echo "please enter rate valve"
read r
echo  "pleae enter the time valve"
read t
echo "calculating the valve "
total_valve=$(p * r * t \100)
echo "simple intrest rate: $total_valve"