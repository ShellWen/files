#!/data/data/com.termux/files/usr/bin/bash

RED='\e[1;31m'  # 红
GREEN='\e[1;32m'  # 绿
YELLOW='\033[1;33m'  # 黄
BLUE='\E[1;34m'  # 蓝
PINK='\E[1;35m'  # 粉红
RES='\033[0m'  # 清除颜色

install_env()
{
    echo -e "${GREEN} 正在更新本地apt仓库 ${RES}"
    apt update
    echo -e "${GREEN} 正在安装wget,unzip ${RES}"
    apt -y install wget unzip
    echo -e "${BLUE} 安装环境完成，5秒后开始下载工具包 ${RES}"
    sleep 5s
}

download_adb()
{
    
}
echo -e "${GREEN} 正在下载adb工具包 ${RES}"
clear
echo -e "${GREEN} 正在解压adb工具包 ${RES}"
clear