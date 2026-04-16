echo "Enter village name:"
read village_name

echo "Enter street name:"
read street

if [ "$village_name" == "myvillage" ]; then
    echo "correct village"
else
    echo "wrong village"
fi