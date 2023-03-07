#FINAL VERSION:

# OS Architecture and Kernel version:
ARCHITECTURE=$(uname -a)

# Number of physical CPUs:
PHYSICAL_CPUS=$(grep 'physical id' /proc/cpuinfo | wc -l)

# Number of virtual CPUs:
VIRTUAL_CPUS=$(grep processor /proc/cpuinfo | wc -l)

# Available RAM:
RAM_USED=$(free -h | grep Mem | awk '{print $3}' | sed 's/Mi//')
RAM_TOTAL=$(free -h | grep Mem | awk '{print $2}' | sed 's/Mi//')
RAM_USED_PERCENTAGE=$(free | grep Mem | awk '{printf "%.2f%%\n", $3/$2 * 100}')

# Available space on disk:
SPACE_USED=$(df -h --total | grep total | awk '{print $3}' | sed 's/G//')
SPACE_TOTAL=$(df -h --total | grep total | awk '{print $2}' | sed 's/G//')
SPACE_USED_PERCENTAGE=$(df -k --total | grep total |  awk '{print $5}')

# Current CPU usage:
CPU_USAGE_PERCENTAGE=$(top -bn1 | grep %Cpu | awk '{printf "%.1f%%\n", $2 + $4}')

# Date and time of last reboot:
BOOT_DATE=$(who -b | awk '{print $3 " " $4}')

# Check if LVM is enabled:
LVM_ISON=$(if [ $(lsblk | grep lvm | wc -l) -eq 0 ]; then echo no; else echo yes; fi)

# Number of current active connections:
ACTIVE_CONNECTIONS=$(grep TCP /proc/net/sockstat | awk '{print $3}')

# Number of users in the server:
USERS_NUM=$(who | wc -l)

# IPv4 and MAC addresses:
IP_ADDR=$(hostname -I)
MAC_ADDR=$(ip link show | awk '/ether/ {print $2}')

# Number of sudo commands:
SUDOS_NUM=$(grep -a COMMAND /var/log/sudo/sudo.log | wc -l)


# Print to screen:

echo " #Architecture: "$ARCHITECTURE
echo " #CPU physical: "$PHYSICAL_CPUS
echo " #vCPU: "$VIRTUAL_CPUS
echo " #Memory Usage:  "$RAM_USED"/"$RAM_TOTAL"MB ("$RAM_USED_PERCENTAGE")"
echo " #Disk Usage: "$SPACE_USED"/"$SPACE_TOTAL"Gb ("$SPACE_USED_PERCENTAGE")"
echo " #CPU load: "$CPU_USAGE_PERCENTAGE
echo " #Last boot: "$BOOT_DATE
echo " #LVM use: "$LVM_ISON
echo " #Connections TCP: "$ACTIVE_CONNECTIONS" ESTABLISHED"
echo " #User log: "$USERS_NUM
echo " #Network: IP "$IP_ADDR" ("$MAC_ADDR")"
echo " #Sudo: "$SUDOS_NUM" cmd"


# # Faltan cosas, copiar versión final de la máquina virtual

# # OS Architecture and Kernel version:
# ARCHITECTURE=$(uname -srvmo)

# # Number of physical CPUs:
# PHYSICAL_CPUS=$(grep 'physical id' /proc/cpuinfo | wc -l)

# # Number of virtual CPUs:
# VIRTUAL_CPUS=$(grep processor /proc/cpuinfo | wc -l)

# # Available RAM:
# RAM_USED=$(free -h | grep Mem | awk '{print $3}')
# RAM_TOTAL=$(free -h | grep Mem | awk '{print $2}')
# RAM_USED_PERCENTAGE=$(free | grep Mem | awk '{printf "%.2f%%\n", $3/$2 * 100}')

# # Available space on disk:
# SPACE_USED=$(df -h --total | grep total | awk '{print $3}')
# SPACE_TOTAL=$(df -h --total | grep total | awk '{print $2}')
# SPACE_USED_PERCENTAGE=$(df -k --total | grep total | awk '{print $5}')

# # Current CPU usage:
# CPU_USAGE_PERCENTAGE=$(top -bn1 | grep "Cpu(s)" | awk '{printf "%.2f%%\n", $2 + $4}')

# # Date and time of last reboot:
# BOOT_DATE=$(who -b | awk '{print $3 " " $4}')

# # Check if LVM is enabled:
# LVM_ISON=$(if [ $(lsblk | grep lvm | wc -l) -eq 0 ]; then echo no; else echo yes; fi)

# # Number of current active connections:
# ACTIVE_CONNECTIONS=$(grep TCP /proc/net/sockstat | awk '{print $3}')

# # Number of users in the server:
# USERS_NUM=$(who | wc -l)

# # IPv4 and MAC addresses:
# IP_ADDR=$(hostname -I)
# MAC_ADDR=$(ip link show | awk '/ether/ {print $2}')

# # Number of sudo commands:
# SUDOS_NUM=$(sudo grep -a COMMAND /var/log/sudo/sudo.log | wc -l)


# # Print to screen:

# echo " #Architecture: "$ARCHITECTURE
# echo " #CPU physical: "$PHYSICALCPUS
# echo " #vCPU: "$VIRTUALCPUS
# echo " #Memory Usage: "$RAM_USED"/"$RAM_TOTAL" ("$RAM_USED_PERCENTAGE")"
# echo " #Disk Usage: "$SPACE_USED"/"$SPACE_TOTAL" ("$SPACE_USED_PERCENTAGE")"
# echo " #CPU load: "$CPU_USAGE_PERCENTAGE
# echo " #Last boot: "$BOOT_DATE
# echo " #LVM use: "$LVM_ISON
# echo " #Connections TCP: "$ACTIVE_CONNECTIONS" ESTABLISHED"
# echo " #User log: "$USERS_NUM
# echo " #Network:  IP "$IP_ADDR" ("$MAC_ADDR")"
# echo " #Sudo: "$SUDOS_NUM" cmd"
