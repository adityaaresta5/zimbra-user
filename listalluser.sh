#!/bin/bash

# Nama file untuk menyimpan daftar user
file="user_list.txt"

# Mendapatkan daftar semua user Zimbra
users=$(zmprov -l gaa)

# Menuliskan daftar user ke file
for user in $users; do
  echo $user >> $file
done

# Menampilkan pesan bahwa script telah selesai
echo "Daftar user Zimbra telah disimpan ke file $file"
