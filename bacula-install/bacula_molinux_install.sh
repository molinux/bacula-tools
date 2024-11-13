#!/usr/bin/env bash
# Script to install Bacula with packages
#
# Author:  Wanderlei Huttel
# Email:   wanderlei@bacula.com.br
# Reviewer: Marcus "Molinux" Molinero
# Email:    marcus.molinero@bacula.com.br
# version="1.0.7 - 19 May 2020"
# version="1.0.8 - 04 Jul 2022"
# version="1.0.9 - 28 Mar 2023"
# version="1.1.0 - 12 Apr 2023"
# version="1.2.0 - 07 Dec 2023"
version="1.2.1 - 18 Feb 2024"

# Release 1.0.8 - by Molinux
# Oracle support in this release !

# Release 1.0.9 - by Molinux
# Bacula 13.0.1 and above version has been changed debian based repository had changed its structure
# Thanks Ueslei Souza for your help !

# Release 1.1.0 - by Molinux
# Now it's possible to install only bacula client

# Release 1.2.0 - by Molinux
# Now it's possible to install only bacula storage

# Release 1.2.1 - by Molinux
# Hi Folks ! I've been working at my new lab and now I'll try to check and approve as many distros and versions as I can
# You can find approved Linux distributions and versions at: https://abre.ai/bacula-molinux-approved"

# Release 2.0.0 - by Molinux
# New Relase ! This time I spend a lot of time refactoring this code and now we have
# Bacula and Bacularis installation consolidated


#===============================================================================
function tools()
{
   apt install figlet
}
#===============================================================================
function banner()
{
   figlet -cf slant Bacula Community Molinux Install
   echo
   echo
   echo -e "         Developed by Marcus Molinero aka ${RED}Molinux${EC}"
   echo "         Caso encontre algum bug, reporte pelo Telegram (@Molinux)"
   echo
   echo -e "-------------------------------------------------------------"
   echo -e "      Que tal me apoiar ? ${GREEN}PIX: molinerobr@yahoo.com.br${EC}"
   echo -e "-------------------------------------------------------------"
   echo
   echo
   echo

}


#===============================================================================
# Load environments
function envs()
{
RED="\e[31m"
GREEN="\e[32m"
ORACLE="\033[38;5;89m"
ORANGE="\033[38;5;208m"
EC="\e[0m"
}

#===============================================================================
# Install Python tools
function python_deps()
{
   apt install python3-pip -y
   pip install maskpass
}

#===============================================================================
# Read bacula key
function read_bacula_key()
{
    clear
    echo " --------------------------------------------------"
    echo " Inform your Bacula Key"
    echo " This key is obtained with a registration in Bacula.org."
    echo " https://www.bacula.org/bacula-binary-package-download/"
    read -p " Please, fill with your Bacula Key: " bacula_key
}


#===============================================================================
# Download Bacula Key
function download_bacula_key()
{
    wget -c https://www.bacula.org/downloads/Bacula-4096-Distribution-Verification-key.asc -O /tmp/Bacula-4096-Distribution-Verification-key.asc
    if [ "$OS" == "debian" ] || [ "$OS" == "ubuntu" ]; then
        # apt-key add /tmp/Bacula-4096-Distribution-Verification-key.asc
         wget -qO- https://www.bacula.org/downloads/Bacula-4096-Distribution-Verification-key.asc > /etc/apt/trusted.gpg.d/Bacula-4096-Distribution-Verification-key.asc
        # wget -qO- https://www.bacula.org/downloads/Bacula-4096-Distribution-Verification-key.asc | gpg --dearmor > /usr/share/keyrings/Bacula-4096-Distribution-Verification-key.gpg
    elif [ "$OS" == "centos" ] || [ "$OS" == "oracle" ]; then
        rpm --import /tmp/Bacula-4096-Distribution-Verification-key.asc
    else
        echo "Is not possible to install the Bacula Key"
    fi
    rm -f /tmp/Bacula-4096-Distribution-Verification-key.asc
}



#===============================================================================
# Read bacularis key
function read_bacularis_key()
{
    #python_deps
    clear
    echo " --------------------------------------------------"
    echo " Inform your Bacularis Key"
    echo " This key is obtained with a registration in Bacularis.app"
    echo " https://users.bacularis.com/"
    read -p " Please, fill with your Bacularis User: " bacularis_user
    # read -s -p " Please, fill with your Bacularis Password: " bacularis_pass
    read -p " Please, fill with your Bacularis Password: " bacularis_pass
    echo
   # echo -e User: $bacularis_user
   # echo -e Password: $bacularis_pass
    wget -qO- https://packages.bacularis.app/bacularis.pub | gpg --dearmor > /usr/share/keyrings/bacularis-archive-keyring.gpg
    echo "machine https://packages.bacularis.app login $bacularis_user password $bacularis_pass" > /etc/apt/auth.conf.d/bacularis.conf
    echo "# Bacularis - Debian 11 Bullseye package repository" > /etc/apt/sources.list.d/bacularis-app.list
    echo "deb [signed-by=/usr/share/keyrings/bacularis-archive-keyring.gpg] https://packages.bacularis.app/stable/debian bullseye main" >> /etc/apt/sources.list.d/bacularis-app.list
    apt update
    # apt install bacularis bacularis-lighttpd
    # systemctl restart bacularis-lighttpd
    
    ###read -s -p " Please, fill with your Bacularis Key: " bacularis_key
    ##python3 -c 'import maskpass; import os; pwd = maskpass.askpass(prompt="Password: ", mask="*"); os.system(f"export VAR1={pwd}")'
    ###python3 -c "import os; os.system(f'export bacularis_key="{pwd}"')"
    ##echo $VAR1
    ##echo $bacularis_key
}


#===============================================================================
# Download Bacularis Key
function download_bacularis_key()
{
    if [ "$OS" == "debian" ] || [ "$OS" == "ubuntu" ]; then
        wget -qO- https://packages.bacularis.app/bacularis.pub | gpg --dearmor > /usr/share/keyrings/bacularis-archive-keyring.gpg
        echo "machine https://packages.bacularis.app login $bacularis_user password $bacularis_pass" > /etc/apt/auth.conf.d/bacularis.conf
    elif [ "$OS" == "centos" ] || [ "$OS" == "oracle" ]; then
        rpm --import /tmp/Bacula-4096-Distribution-Verification-key.asc
    else
        echo "Is not possible to install the Bacula Key"
    fi
    rm -f /tmp/Bacula-4096-Distribution-Verification-key.asc
}



#===============================================================================
# Create Bacula Repository
function create_bacula_repository()
{
    while :
    do
    clear
    echo " --------------------------------------------------"
    echo " Inform the Bacula version"
    url="https://www.bacula.org/packages/${bacula_key}/debs/"
    IFS=$'\n'
    versions=$(curl --silent --fail -r 0-0 "${url}" | grep -o '<a.*>.*/</a>' | sed 's/\(<a.*">\|\/<\/a>\)//g')
    for i in ${versions}; do
        echo "   - $i";
    done
    read -p " Type your the Bacula Version: " bacula_version

    if [ "$OS" == "debian" ] || [ "$OS" == "ubuntu" ]; then
        if [[ "$bacula_version" > "13.0.0" ]]; then
            url="http://www.bacula.org/packages/${bacula_key}/debs/${bacula_version}/"
        else
            url="http://www.bacula.org/packages/${bacula_key}/debs/${bacula_version}/${codename}/amd64"
        fi
        echo "# Bacula Community
        deb ${url} ${codename} main" > /etc/apt/sources.list.d/bacula-community.list

    elif [ "$OS" == "centos" ] || [ "$OS" == "oracle" ]; then
        if [ "$bacula_version" == "11.0.6" ]; then
          url="https://www.bacula.org/packages/${bacula_key}/rpms/${bacula_version}/rhel${codename}-64/"
        else
          url="https://www.bacula.org/packages/${bacula_key}/rpms/${bacula_version}/el${codename}/x86_64/"
        fi
        echo "[Bacula-Community]
name=CentOS - Bacula - Community
baseurl=${url}
enabled=1
protect=0
gpgcheck=0" > /etc/yum.repos.d/bacula-community.repo
    else
        echo "Is not possible to install the Bacula Key"
    fi

    if wget --spider "${url}" 2>/dev/null; then
        break
    else
        echo " Unfortunately this version (${bacula_version}) still not available for this OS."
        echo " Please, choose another one!"
        read -p " Press [enter] key to continue..." readenterkey
    fi

    done
}



#===============================================================================
# Install MySQL
function install_with_mysql()
{
    wget -c https://repo.mysql.com/RPM-GPG-KEY-mysql -O /tmp/RPM-GPG-KEY-mysql --no-check-certificate
    if [ "$OS" == "debian" ] || [ "$OS" == "ubuntu" ]; then
        apt-key add /tmp/RPM-GPG-KEY-mysql
        echo "deb http://repo.mysql.com/apt/debian/ ${codename} mysql-apt-config
deb http://repo.mysql.com/apt/debian/ ${codename} mysql-5.7
deb http://repo.mysql.com/apt/debian/ ${codename} mysql-tools
deb http://repo.mysql.com/apt/debian/ ${codename} mysql-tools-preview
deb-src http://repo.mysql.com/apt/debian/ ${codename} mysql-5.7" > /etc/apt/sources.list.d/mysql.list
        apt-get update
        apt-get install -y mysql-community-server
        apt-get install -y bacula-mysql
        systemctl enable mysql
        systemctl start mysql

    elif [ "$OS" == "centos" ] || [ "$OS" == "oracle" ]; then
        rpm --import /tmp/RPM-GPG-KEY-mysql
        wget -c http://dev.mysql.com/get/mysql57-community-release-el7-9.noarch.rpm -O /tmp/mysql57-community-release-el7-9.noarch.rpm
        rpm -ivh /tmp/mysql57-community-release-el7-9.noarch.rpm
        yum install -y mysql-community-server
        mysqld --initialize-insecure --user=mysql
        systemctl enable mysqld
        systemctl start mysqld
        yum install -y bacula-mysql
    fi

    /opt/bacula/scripts/create_mysql_database
    /opt/bacula/scripts/make_mysql_tables
    /opt/bacula/scripts/grant_mysql_privileges

    systemctl enable bacula-fd.service
    systemctl enable bacula-sd.service
    systemctl enable bacula-dir.service

    systemctl start bacula-fd.service
    systemctl start bacula-sd.service
    systemctl start bacula-dir.service

    for i in $(/opt/bacula/bin); do
        ln -s /opt/bacula/bin/"$i" /usr/sbin/"$i";
    done
    sed '/[Aa]ddress/s/=\s.*/= localhost/g' -i  /opt/bacula/etc/bconsole.conf
    echo
    echo "Bacula with MySQL installed with success!"
    echo
}

#===============================================================================
# Install PostgreSQL
function install_with_postgresql()
{
    if [ "$OS" == "debian" ] || [ "$OS" == "ubuntu" ]; then
        apt-get update
        apt-get install -y postgresql postgresql-client
        apt-get install -y bacula-postgresql

    elif [ "$OS" == "centos" ]; then
        yum install -y postgresql-server
        yum install -y bacula-postgresql --exclude=bacula-mysql
        postgresql-setup initdb
    fi

    systemctl enable postgresql
    systemctl start postgresql
    su - postgres -c "/opt/bacula/scripts/create_postgresql_database"
    su - postgres -c "/opt/bacula/scripts/make_postgresql_tables"
    su - postgres -c "/opt/bacula/scripts/grant_postgresql_privileges"

    systemctl enable bacula-fd.service
    systemctl enable bacula-sd.service
    systemctl enable bacula-dir.service

    systemctl start bacula-fd.service
    systemctl start bacula-sd.service
    systemctl start bacula-dir.service

    for i in $(/opt/bacula/bin); do
        ln -s /opt/bacula/bin/"$i" /usr/sbin/"$i";
    done
    sed '/[Aa]ddress/s/=\s.*/= localhost/g' -i  /opt/bacula/etc/bconsole.conf
    echo
    echo "Bacula with PostgreSQL installed with success!"
    echo
}

#===============================================================================
# TODO: Testar em todas as distros a instalação do Storage Only
# TODO: Testar configurando em um Director
# Install Only Storage with PostgreSQL
function install_only_storage()
{
    if [ "$OS" == "debian" ] || [ "$OS" == "ubuntu" ]; then
        apt-get update
        apt-get install -y postgresql #postgresql-client
        apt-get install -y bacula-postgresql

    elif [ "$OS" == "centos" ]; then
        yum install -y postgresql-server
        yum install -y bacula-postgresql --exclude=bacula-mysql
        postgresql-setup initdb
    fi

    systemctl disable postgresql
    systemctl stop postgresql
    #su - postgres -c "/opt/bacula/scripts/create_postgresql_database"
    #su - postgres -c "/opt/bacula/scripts/make_postgresql_tables"
    #su - postgres -c "/opt/bacula/scripts/grant_postgresql_privileges"

    systemctl disable bacula-fd.service
    systemctl enable bacula-sd.service
    systemctl disable bacula-dir.service

    systemctl stop bacula-fd.service
    systemctl start bacula-sd.service
    systemctl stop bacula-dir.service

    #for i in $(ls /opt/bacula/bin); do
    ln -s /opt/bacula/bin/bacula-sd /usr/sbin/bacula-sd;
    # Clean the house !
    CONFDIR=/opt/bacula/etc
    rm $CONFDIR/bacula-{dir,fd}.conf
    rm $CONFDIR/bconsole.conf
    apt-get remove postgresql
    #done
    # sed '/[Aa]ddress/s/=\s.*/= localhost/g' -i  /opt/bacula/etc/bconsole.conf
    echo
    echo "Bacula Storage Daemon installed with success!"
    echo
}

#===============================================================================
# Install Cliente Only
function install_only_client()
{
    if [ "$OS" == "debian" -o "$OS" == "ubuntu" ]; then
        apt-get update
        apt-get install -y bacula-client

    elif [ "$OS" == "centos" ]; then
        yum install -y bacula-client
    fi

    systemctl enable bacula-fd.service

    systemctl start bacula-fd.service

    for i in $(/opt/bacula/bin); do
        ln -s /opt/bacula/bin/$i /usr/sbin/$i;
    done
    echo
    echo "Bacula Client installed with success!"
    echo
}

#===============================================================================
# TODO
# Install Bacularis
function install_bacularis()
{
    if [ "$OS" == "debian" ] || [ "$OS" == "ubuntu" ]; then
        echo "# Bacularis - Debian 12 Bookworm package repository > /etc/apt/sources.list.d/bacularis-app.list"
        echo "deb [signed-by=/usr/share/keyrings/bacularis-archive-keyring.gpg] \
        https://packages.bacularis.app/stable/debian bookworm main" \
        >> /etc/apt/sources.list.d/bacularis-app.list
        apt-get update
        apt-get install -y bacularis bacularis-apache2
        a2enmod rewrite
        a2enmod proxy_fcgi
        a2enconf php*-fpm
        a2ensite bacularis
        systemctl restart apache2

    elif [ "$OS" == "centos" ]; then
        # yum install -y bacula-client
        echo TODO
    fi
    clear
    server_ip=$(hostname -I | awk '{print $1}')
    echo -e "-------------------------------------------------------------"
    echo
    echo -e "               Bacularis is ${GREEN}Installed !${EC}"
    echo
    echo
    echo -e "   Acesse e configure pelo navegador de Internet o Bacularis"
    echo
    echo -e "               http://$server_ip:9097/"
    echo
    echo -e "               Login: admin | Senha: admin"
    echo
    echo 
    echo 
    echo -e "         Developed by Marcus Molinero aka ${RED}Molinux${EC}"
    echo "    Caso encontre algum bug, reporte pelo Telegram (@Molinux)"
    echo
    echo -e "-------------------------------------------------------------"
    echo -e "      Que tal me apoiar ? ${GREEN}PIX: molinerobr@yahoo.com.br${EC}"
    echo -e "-------------------------------------------------------------"
    echo
    echo
    echo
    read -n 1 -s -r -p "Press any key to continue..."
    echo
    echo
}

#===============================================================================
# Menu
function menu()
{
    while :
        do
        clear
        echo " =================================================="
        echo " === Bacula Community Install ==="
        echo " Based on Wanderlei Huttel version"
        echo " Author: Marcus Molinux Molinero"
        echo " Email:  marcus.molinero@bacula.com.br"
        echo -e " OS Supported: ${RED}Debian${EC} | ${ORANGE}Ubuntu${EC} | ${GREEN}CentOS${EC} | ${ORACLE}Oracle Linux${EC}"
        echo " You can find all approved versions at: https://abre.ai/bacula-molinux-approved"
        echo " What about support me ? https://www.buymeacoffee.com/molinux"
        echo " Version: ${version}"
        echo " =================================================="
        echo
        echo " What do you want to do?"
        echo "   1) Install Bacula with PostgreSQL"
        echo "   2) Install Bacula with MySQL"
        echo "   3) Install Bacula Client only"
        echo "   4) Install Bacula Storage only (Only PostgreSQL)"
        echo "   5) Install Bacularis"
        echo "   6) Exit"
        read -p " Select an option [1-6]: " option
        echo
        case $option in
            1) # Install Bacula with PostgreSQL
               install_with_postgresql
               read -p "Press [enter] key to continue..." readenterkey
               ;;
            2) # Install Bacula with MySQL
               install_with_mysql
               read -p "Press [enter] key to continue..." readenterkey
               ;;
            3) # Install only Bacula Client
               install_only_client
               read -p "Press [enter] key to continue..." readenterkey
               ;;
            4) # Install only Bacula Storage
               install_only_storage
               read -p "Press [enter] key to continue..." readenterkey
               ;;
            5) # Install Bacularis
               download_bacularis_key
               read_bacularis_key
               install_bacularis
               ;;
            6) echo
               banner
               exit
               ;;
            *)
               echo "Invalid option"
               sleep 1
               ;;
        esac
    done
}


#===============================================================================
# Detect Debian users running the script with "sh" instead of bash
OS=""
codename=""
export bacula_key="6367abb52d166"
export DEBIAN_FRONTEND=noninteractive
clear
if readlink /proc/$$/exe | grep -q "dash"; then
    echo "This script needs to be run with bash, not sh"
    exit
fi

if [[ "$EUID" -ne 0 ]]; then
    echo "Sorry, you need to run this as root"
    exit
fi

if [[ -e /etc/debian_version ]]; then
    OS=$(grep -E "^ID=" < /etc/os-release | sed 's/.*=//g')
    codename=$(grep "VERSION_CODENAME" < /etc/os-release | sed 's/.*=//g')
elif [[ -e /etc/centos-release || -e /etc/redhat-release || -e /etc/oracle-release ]]; then
    setenforce 0
    sudo sed -i "s/enforcing/disabled/g" /etc/selinux/config
    sudo sed -i "s/enforcing/disabled/g" /etc/sysconfig/selinux
    firewall-cmd --permanent --zone=public --add-port=9101-9103/tcp
    systemctl restart firewalld
    OS=centos
    codename=$(grep "VERSION_ID" < /etc/os-release | sed 's/[^0-9.]//g' | cut -d . -f1)
else
    echo "Looks like you aren't running this installer on Debian, Ubuntu or CentOS"
    exit
fi

if [ "$OS" == "debian" ] || [ "$OS" == "ubuntu" ]; then
    apt-get install -y zip wget apt-transport-https bzip2 curl figlet gpg
elif [ "$OS" == "centos" ] || [ "$OS" == "oracle" ]; then
    yum install -y zip wget apt-transport-https bzip2 curl figlet
fi

envs
download_bacula_key
read_bacula_key
create_bacula_repository
menu
banner