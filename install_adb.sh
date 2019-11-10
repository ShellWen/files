#!/data/data/com.termux/files/usr/bin/bash

# 定义颜色
RED='\e[1;31m'  # 红
GREEN='\e[1;32m'  # 绿
YELLOW='\033[1;33m'  # 黄
BLUE='\E[1;34m'  # 蓝
PINK='\E[1;35m'  # 粉红
RES='\033[0m'  # 清除颜色

# 工作目录
# TODO: source运行.sh可能无法正确获取
WORK_DIR='$(dirname `readlink -f $0`)'
# 下载目录
DOWNLOAD_DIR='${WORK_DIR}/download'
# 解压目录
UNZIP_DIR='${WORK_DIR}/unzip'
# 安装目录
INSTALL_DIR='/data/data/com.termux/files/usr/bin'

splash()
{
    echo -e "${GREEN}5秒后将安装adb环境，如果不需要请按Ctrl + C退出${RES}"
    sleep 5
    clear
}

# 初始化
init()
{
    # 自动清理目录
    if [ ! -d ${WORK_DIR} ];then
        rm -rf ${WORK_DIR}
        echo -e "${GREEN}已删除之前运行的临时文件夹${RES}"
    fi
    # 建立目录并进入工作目录
    mkdir ${WORK_DIR} && mkdir ${DOWNLOAD_DIR} && mkdir ${UNZIP_DIR} && cd ${WORK_DIR}
}
# 安装环境
install_env()
{
    echo -e "${GREEN}正在更新本地apt仓库${RES}"
    apt update
    echo -e "${GREEN}正在安装wget,unzip${RES}"
    apt -y install wget unzip
    clear
    echo -e "${BLUE}安装环境完成，3秒后开始下载工具包${RES}"
    sleep 3s
}

download_adb()
{
    wget 
}

unzip_adb()
{
    
}


splash
clear
echo -e "${GREEN}正在初始化${RES}"
init
clear
echo -e "${GREEN}正在下载安装依赖环境${RES}"
install_env
clear
echo -e "${GREEN}正在下载adb工具包${RES}"
download_adb
clear
echo -e "${GREEN}正在解压adb工具包${RES}"
clear
echo -e "${YELLOW}安装完成，祝您使用愉快，再见~${RES}"
echo -e "${YELLOW}使用方法：直接输入adb或fastboot即可${RES}"