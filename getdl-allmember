#!/bin/bash

# File output
output_file="distribution_list_members.txt"

# Inisialisasi file output
echo "Distribution List Members Report" > $output_file
echo "===============================" >> $output_file

# Mendapatkan semua distribution list
dl_lists=$(zmprov gadl)

# Loop melalui setiap distribution list
for dl in $dl_lists; do
    echo "Distribution List: $dl" >> $output_file
    echo "-------------------" >> $output_file

    # Mendapatkan anggota dari distribution list
    dl_members=$(zmprov gdlm $dl)

    # Jika tidak ada anggota
    if [ -z "$dl_members" ]; then
        echo "No members found" >> $output_file
    else
        # Loop melalui setiap anggota dan menuliskan ke file
        for member in $dl_members; do
            echo "$member" >> $output_file
        done
    fi

    echo "" >> $output_file
done

echo "Report generated in $output_file"
