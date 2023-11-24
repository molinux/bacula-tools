rpm --import http://bacula.org/downloads/baculum/baculum.pub

echo "
[baculumrepo]
name=Baculum CentOS repository
baseurl=https://www.bacula.org/downloads/baculum/stable-11/centos
gpgcheck=1
enabled=1" > /etc/yum.repos.d/baculum.repo

yum install -y baculum-common baculum-api baculum-api-httpd baculum-web baculum-web-httpd

echo "Defaults:apache "'!'"requiretty
apache  ALL=NOPASSWD:  /usr/sbin/bconsole
apache  ALL=NOPASSWD:  /usr/sbin/bdirjson
apache  ALL=NOPASSWD:  /usr/sbin/bsdjson
apache  ALL=NOPASSWD:  /usr/sbin/bfdjson
apache  ALL=NOPASSWD:  /usr/sbin/bbconsjson
apache ALL=(root) NOPASSWD: /usr/bin/systemctl start bacula-dir
apache ALL=(root) NOPASSWD: /usr/bin/systemctl stop bacula-dir
apache ALL=(root) NOPASSWD: /usr/bin/systemctl restart bacula-dir
apache ALL=(root) NOPASSWD: /usr/bin/systemctl start bacula-sd
apache ALL=(root) NOPASSWD: /usr/bin/systemctl stop bacula-sd
apache ALL=(root) NOPASSWD: /usr/bin/systemctl restart bacula-sd
apache ALL=(root) NOPASSWD: /usr/bin/systemctl start bacula-fd
apache ALL=(root) NOPASSWD: /usr/bin/systemctl stop bacula-fd
apache ALL=(root) NOPASSWD: /usr/bin/systemctl restart bacula-fd
apache ALL=(root) NOPASSWD: /opt/bacula/bin/mtx-changer
" > /etc/sudoers.d/baculum

usermod -aG bacula apache
chown -R apache:bacula /opt/bacula/working /opt/bacula/etc
chmod -R g+rwx /opt/bacula/working /opt/bacula/etc

firewall-cmd --permanent --zone=public --add-port=9095-9096/tcp
firewall-cmd --reload

service httpd restart
systemctl enable httpd
sed -i 's/ident/trust/g; s/peer/trust/g' /var/lib/pgsql/data/pg_hba.conf
service postgresql restart

server_ip=$(ip route get 8.8.8.8 | awk 'NR==1 {print $NF}') 

echo "Acesse e configure pelo navegador de Internet a API http://$server_ip:9096/ e depois o Baculum http://$server_ip:9095/"