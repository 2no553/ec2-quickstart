#!/bin/bash

# パッケージ 更新
sudo yum update -y

# 自動更新 設定
sudo yum install yum-cron -y
sudo chkconfig yum-cron on
sudo sed -i "s/^apply_updates.*$/apply_updates = yes/g" /etc/yum/yum-cron.conf
sudo service yum-cron start

# ローカルタイム・ハードウェアクロック 設定
sudo ln -sf /usr/share/zoneinfo/Japan /etc/localtime
sudo sed -i "s/\"UTC\"/\"Japan\"/g" /etc/sysconfig/clock

# 文字コード 設定
sudo sed -i "s/en_US\.UTF-8/ja_JP\.UTF-8/g" /etc/sysconfig/i18n

# docker インストール
sudo yum install -y docker
sudo chkconfig docker on
sudo service docker start
sudo usermod -a -G docker ec2-user
sudo curl -L https://github.com/docker/compose/releases/download/1.18.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# git インストール
sudo yum install -y git

# システム 再起動
sudo reboot
