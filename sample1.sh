echo "enter a valve"
read a
echo "enter b valve"
read b
hypotenuse=$(echo "scale=2; sqrt($a*$a + $b*$b)" | bc -l)
echo "hypo valve: $hypotenuse"