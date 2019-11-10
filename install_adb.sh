#!/data/data/com.termux/files/usr/bin/bash

# 定义颜色
RED='\e[1;31m'  # 红
GREEN='\e[1;32m'  # 绿
YELLOW='\033[1;33m'  # 黄
BLUE='\E[1;34m'  # 蓝
PINK='\E[1;35m'  # 粉红
RES='\033[0m'  # 清除颜色

# 系统架构
ARCH=$(uname -m)

# 工作目录
# TODO: source运行.sh可能无法正确获取
WORK_DIR=$(dirname `readlink -f $0`)/adb
# 下载目录
DOWNLOAD_DIR=${WORK_DIR}/download
# 解压目录
UNZIP_DIR=${WORK_DIR}/unzip
# 安装目录
INSTALL_DIR='/data/data/com.termux/files/usr/bin'
# 下载地址
DOWNLOAD_URL=''
# 文件名
FILE_NAME=""

splash()
{
    echo -e "${GREEN}5秒后将安装adb环境，如果不需要请按Ctrl + C退出${RES}"
    sleep 5
    clear
}

# 初始化
init()
{
    case "$ARCH" in
    aarch64)
        # 架构arm64
        DOWNLOAD_URL="https://gofly233.github.io/files/adb/adb_aarch64.zip"
        FILE_NAME="adb_aarch64.zip"
        ;;
    x86)
        # 架构x86
        DOWNLOAD_URL="https://gofly233.github.io/files/adb/adb_x86.zip"
        FILE_NAME="adb_x86.zip"
        ;;
    *)
        # 不支持的架构
        echo -e "${RED}抱歉，本工具暂不支持你的CPU架构：${ARCH}${RES}"
        exit 1
        ;;
    esac
    # 自动清理目录
    if [ -d ${WORK_DIR} ];then
        rm -rf ${WORK_DIR}
        echo -e "${GREEN}已删除之前运行的临时文件夹${RES}"
    fi
    # 建立目录并进入工作目录
    mkdir ${WORK_DIR}
    mkdir ${DOWNLOAD_DIR}
    mkdir ${UNZIP_DIR}
    
    cd ${WORK_DIR}
    
    echo -e "${GREEN}工作目录：${WORK_DIR}${RES}"
    sleep 3s
}
# 安装环境
install_env()
{
    echo -e "${GREEN}正在更新本地apt仓库${RES}"
    apt update
    echo -e "${GREEN}正在安装wget,unzip${RES}"
    apt -y install wget unzip
    clear
    echo -e "${BLUE}安装环境完成，2秒后开始下载工具包${RES}"
    sleep 2s
}

download_adb()
{
    cd $DOWNLOAD_DIR
    wget "$DOWNLOAD_URL"
    echo -e "${GREEN}下载完成！${RES}"
    cd ..
    sleep 1s
    # echo ”” > /dev/null
}

unzip_adb()
{
    cd $UNZIP_DIR
    unzip "${DOWNLOAD_DIR}/${FILE_NAME}"
    echo -e "${GREEN}解压完成！${RES}"
    sleep 1s
    # echo ”” > /dev/null
}

install_adb()
{
    cd $UNZIP_DIR
    cp ./* $INSTALL_DIR
    chmod 777 ${INSTALL_DIR}/adb
    chmod 777 ${INSTALL_DIR}/fastboot
    echo -e "${GREEN}安装完成！${RES}"
    sleep 1s
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
unzip_adb
clear
echo -e "${GREEN}正在安装...${RES}"
install_adb
clear
echo -e "${YELLOW}安装完成，祝您使用愉快，再见~${RES}"
echo -e "${YELLOW}使用方法：直接输入adb或fastboot即可${RES}"