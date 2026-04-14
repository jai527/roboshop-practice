
echo "please enter principle valve"
read p
echo "please enter rate valve"
read r
echo  "pleae enter the time valve"
read t
echo "calculating the valve "
total_valve=$((p * r * t /100))
echo "simple intrest rate: $total_valve"

#Total Seconds = (hours × 3600) + (minutes × 60) + seconds 

echo "enter hours"
read h
echo "enter minutes"
read m
echo  "enter seconds"
read s
total_seconds=$((h * 3600 + m * 60 + s))

echo "total seconds: $total_seconds"

#hypotenuse finder

echo "enter a valve"
read a
echo "enter b valve"
read b

hypotenuse=$((echo "scale=2" "sqrt{a^2 + b^2}"))

echo "hypo valve: $hypotenuse"