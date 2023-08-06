wget -qO - https://www.bacula.org/downloads/baculum/baculum.pub | apt-key add -

echo "
deb [ arch=amd64 ] https://www.bacula.org/downloads/baculum/stable-11/debian bullseye main
deb-src https://www.bacula.org/downloads/baculum/stable-11/debian bullseye main
" > /etc/apt/sources.list.d/baculum.list

apt-get update && apt-get install php-bcmath php*-mbstring baculum-api baculum-api-apache2 baculum-common bacula-console baculum-web baculum-web-apache2

echo "Defaults:apache "'!'"requiretty
www-data ALL=NOPASSWD: /usr/sbin/bconsole
www-data ALL=NOPASSWD: /usr/sbin/bdirjson
www-data ALL=NOPASSWD: /usr/sbin/bsdjson
www-data ALL=NOPASSWD: /usr/sbin/bfdjson
www-data ALL=NOPASSWD: /usr/sbin/bbconsjson
www-data ALL=(root) NOPASSWD: /usr/bin/systemctl start bacula-dir
www-data ALL=(root) NOPASSWD: /usr/bin/systemctl stop bacula-dir
www-data ALL=(root) NOPASSWD: /usr/bin/systemctl restart bacula-dir
www-data ALL=(root) NOPASSWD: /usr/bin/systemctl start bacula-sd
www-data ALL=(root) NOPASSWD: /usr/bin/systemctl stop bacula-sd
www-data ALL=(root) NOPASSWD: /usr/bin/systemctl restart bacula-sd
www-data ALL=(root) NOPASSWD: /usr/bin/systemctl start bacula-fd
www-data ALL=(root) NOPASSWD: /usr/bin/systemctl stop bacula-fd
www-data ALL=(root) NOPASSWD: /usr/bin/systemctl restart bacula-fd
www-data ALL=(root) NOPASSWD: /opt/bacula/bin/mtx-changer
" > /etc/sudoers.d/baculum

usermod -aG bacula www-data 
chown -R www-data:bacula /opt/bacula/working /opt/bacula/etc
chmod -R g+rwx /opt/bacula/working /opt/bacula/etc
a2enmod rewrite
a2ensite baculum-web baculum-api
service apache2 restart

sed -i 's/ident/trust/g; s/peer/trust/g; s/md5/trust/g' /var/lib/pgsql/data/pg_hba.conf
sed -i 's/ident/trust/g; s/peer/trust/g; s/md5/trust/g' /etc/postgresql/*/main/pg_hba.conf
service postgresql restart

server_ip=$(ip route get 8.8.8.8 | awk 'NR==1 {print $NF}')

echo "Acesse e configure pelo navegador de Internet a API http://$server_ip:9096/ e depois o Baculum http://$server_ip:9095/"