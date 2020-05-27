#!/bin/bash
echo -e "*** AutoRecon Script by Invasive Security ***"
echo -e "*** type ./autorecon.sh -h for help menue ***"
usage() { echo "Usage: $0 [-i <ip>] [-d <directoryToCreate>] [-w <pathToWordist>]" 1>&2; exit 1; }

while getopts ":i:d:w:" o; do
    case "${o}" in
        i)
            i=${OPTARG}
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

if [ -z "${i}" ] || [ -z "${d}" ] || [ -z "${w}" ]; then
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
nmap -sV -sV -o nmap ${i}

if grep '80\|443' nmap;
then
	# Do a gobuster directory bruteforce and save the output to a file called 'gobuster'"
	echo -e "[+] Found open http(s) port(s)..."
	echo -e "[+] Starting gobuster directory bruteforce..."
	gobuster dir -u http://${i} -w ${w} -o gobuster -t 50
else
	echo -e "[-] No open standard http(s) ports found."
	echo -e "[+] nmap output has been saved to "${d}
	exit
fi

# Final Output
echo -e "[+] Output files have been saved in folder "${d}
