#!/bin/bash
echo -e "*** AutoRecon Script by Invasive Security ***"

usage() { echo "Usage: $0 [-h <ip>] [-d <directoryToCreate>] [-w <pathToWordist>]" 1>&2; exit 1; }

while getopts ":h:d:w:" o; do
    case "${o}" in
        h)
            h=${OPTARG}
            ;;
        d)
            d=${OPTARG}
            ;;
	w)
	    w=${OPTARG}
	    ;;
        *)
            usage
            ;;
    esac
done
shift $((OPTIND-1))

if [ -z "${h}" ] || [ -z "${d}" ] || [ -z "${w}" ]; then
    usage
fi

# Creating Directory
echo -e  "[+] Creating Directory"
mkdir ${d}
sleep 1

# Change into newly created directory
cd ${d}

# Do a -sV -sC nmap scan and save the output to a file called 'nmap'"
echo -e "[+] Starting nmap scan..."
nmap -sV -sV -o nmap ${h}

# Do a gobuster directory bruteforce and save the output to a file called 'gobuster'"
echo -e "[+] Staring gobuster directory bruteforce..."
gobuster dir -u http://${h} -w ${w} -o gobuster -t 50

# Final Output
echo -e "[+] Output files have been saved in folder ${d}"