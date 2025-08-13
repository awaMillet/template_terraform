#!/bin/bash
curl https://rclone.org/install.sh | sudo bash
sleep 10

USERNAME=ec2-user

mkdir -p /home/${USERNAME}/.config/rclone
cat > /home/${USERNAME}/.config/rclone/rclone.conf <<EOF

[s3-remote]
type = s3
provider = AWS
env_auth = true
region = ap-northeast-1

EOF
chown -R ${USERNAME}:${USERNAME} /home/${USERNAME}/.config/rclone
sleep 10
