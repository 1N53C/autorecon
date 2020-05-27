# autorecon
Automates some enumeration 

![autorecon screenshot](https://raw.githubusercontent.com/1N53C/autorecon/master/autorecon.png)

## Install and Usage

### Install

```bash
    git clone https://github.com/1N53C/autorecon.git
    cd autorecon
    chmod +x autorecon.sh
```

### Usage

```bash
    ./autorecon.sh -i <ip> -d <NameOfOutputDirectory> -w <pathToWordlist>
    
    Example:
    ./autorecon.sh -i 10.10.10.187 -d OutputDirectory -w /usr/share/wordlist/dirbuster/directory-list-2.3-small.txt
```



## TODO
1. add nikto scan
2. add help menue

