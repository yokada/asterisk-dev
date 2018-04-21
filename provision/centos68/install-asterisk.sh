#!/usr/bin/env sh

# see below document:
# [ Asterisk 13 - VoIP-Info.jp ]( http://www.voip-info.jp/index.php/Asterisk_13 )13.20.0=13

# GCC、G++(GNU-C++)、OpenSSL、Ncurses、bison、カーネルソース(zaptel)、
# libxml2、SQLite3、libuuid-devel uuid-devel、json-c、json-c-devel
# CentOS 6.3 Basic Serverの場合、以下の手順でコンパイル環境を整えます。
# 開発環境系パッケージを一括インストールしておく。
sudo yum groupinstall -y "Development Libraries" "Additional Development"
sudo yum install -y gcc gcc-c++
sudo yum install -y libxml2 libxml2-devel openssl-devel ncurses-devel sqlite-devel newt-devel libuuid-devel uuid-devel
sudo yum install -y json-c json-c-devel

# format_mp3など、一部のソースはAsteriskに含まれないため別途入手しますが、
# この際にSubversionが必要となりますので、Subversionも入れておきます。
sudo yum install -y subversion

# Asteriskは10以降でMySQLサポートが"非常に"制限されています。
# このためCDRをMySQLで管理するような場合にはODBCが必要となるため、
# AsteriskのODBCサポート(res_odbc)を有効にする場合には以下も必要です。
sudo yum install -y unixODBC unixODBC-devel mysql-connector-odbc
sudo yum install -y libtool-ltdl libtool-ltdl-devel 

# 最新化
sudo yum update

# janssonのインストール
wget http://www.digip.org/jansson/releases/jansson-2.11.tar.gz
tar zxvf jansson-2.11.tar.gz
cd jansson-2.11
sudo ./configure
sudo make
sudo make install
cd -

# TODO modifiy ldconfig


# Installing Asterisk
wget http://downloads.asterisk.org/pub/telephony/asterisk/asterisk-13.20.0-current.tar.gz
tar -zxvf asterisk-13.20.0-current.tar.gz
rm asterisk-13.20.0-current.tar.gz
cd asterisk-13.20.0/
sudo ./contrib/scripts/install_prereq install
sudo ./configure
sudo make
sudo make install
sudo make samples
