chown -R $USER:$USER /home/$USER/
useradd -m $USER ; echo "$USER:$USER" | chpasswd
mkdir -p /home/$USER/.ssh
echo $KEY > /home/$USER/.ssh/authorized_keys
chown -R $USER:$USER /home/$USER/

echo "rm -f /entrypoint.sh" >> run.sh
echo "sh -c /usr/sbin/sshd && tail -f /dev/null" >> run.sh
chmod +x run.sh
sh run.sh
