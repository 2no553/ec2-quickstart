#!/bin/bash

#パッケージ更新
sudo yum update -y

#パッケージ自動更新
sudo yum install yum-cron -y
sudo sed -i "s/^apply_updates.*$/apply_updates = yes/g" /etc/yum/yum-cron.conf
sudo systemctl status yum-cron
sudo systemctl start yum-cron
sudo systemctl enable yum-cron

#タイムゾーン変更
timedatectl status
sudo timedatectl set-timezone Asia/Tokyo

#日本語ロケール追加
localectl status
sudo localectl set-locale LANG=ja_JP.UTF-8
sudo localectl set-keymap jp106

#gitインストール
sudo yum install git -y

#dockerインストール
sudo yum install docker -y
sudo systemctl status docker
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -a -G docker ec2-user
sudo curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
