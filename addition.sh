a=10
b=200
sum=$(($a + $b))
echo "addition of two valves $sum"
product=$(($a * $b))
echo "multiplie two valves $product"


h=$1
m=$2
s=$3

TS=$=$((h * 3600 + m * 60 + s))

echo "enter the valve: $TS"