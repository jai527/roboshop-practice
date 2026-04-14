#!/bin/bash
array_name=("subramani" "shyamala" "kushika" "kunshika" "sangeetha" "jai" "rudhra")

echo "${array_name[0]}"
echo "${array_name[1]}"
echo "${array_name[2]}"
echo "${array_name[3]}"
echo "${array_name[4]}"
echo "${array_name[5]}"
echo "${array_name[6]}"
echo "${array_name[7]}"

array_name+=("jaswanth")
echo "${array_name[8]}"

echo "all are family members and joint family"

#Length of array

name_array=("jai" "kumar" "jai1")
echo "length of array: ${#name_array[@]"  #prient the number of elements in the array