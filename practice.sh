echo "Enter village name:"
read village_name

echo "Enter street name:"
read street

if [ "$village_name" == "myvillage" ]; then
    echo "correct village"
else
    echo " village"
fi


echo "Enter village name:"
read village_name

case "$village_name" in
    village1)
        echo "Village 1 selected"
        ;;
    village2)
        echo "Village 2 selected"
        ;;
    village3)
        echo "Village 3 selected"
        ;;
    *)
        echo "Invalid village"
        ;;
esac