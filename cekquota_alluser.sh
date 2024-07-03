#!/bin/bash

# File output
output_file="quota_report.txt"

# Inisialisasi file output
echo "Quota Usage Report" > $output_file
echo "==================" >> $output_file
echo "Account,Used Quota" >> $output_file

# Mendapatkan semua akun
accounts=$(zmprov -l gaa)

# Loop melalui setiap akun
for account in $accounts; do
    # Mendapatkan kuota yang sudah terpakai (bytes)
    used_quota_bytes=$(zmmailbox -z -m $account gms)

    # Jika zmmailbox mengembalikan error atau nilai kosong, set ke 0
    if [ -z "$used_quota_bytes" ]; then
        used_quota_bytes=0
    fi

#    # Mendapatkan kuota yang dialokasikan (bytes)
#    allocated_quota_bytes=$(zmprov ga $account zimbraMailQuota | grep zimbraMailQuota | awk '{print $2}')

    # Jika allocated_quota_bytes kosong, set ke 0
#    if [ -z "$allocated_quota_bytes" ]; then
#        allocated_quota_bytes=0
#    fi

#    # Mengonversi bytes ke megabytes (MB)
#    used_quota_mb=$(awk "BEGIN {printf \"%.2f\", $used_quota_bytes / 1024 / 1024}")
#    allocated_quota_mb=$(awk "BEGIN {printf \"%.2f\", $allocated_quota_bytes / 1024 / 1024}")

    # Menuliskan hasil ke file
    echo "$account,$used_quota_bytes" >> $output_file
done

echo "Report generated in $output_file"
