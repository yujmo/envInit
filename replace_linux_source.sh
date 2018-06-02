#!/bin/bash

function get_platform_type()
{
    echo $(uname)
}


function get_linux_platform_type()
{
    if which apt-get > /dev/null ; then
        echo "ubuntu" # debian ubuntu系列
    elif which yum > /dev/null ; then
        echo "centos" # centos redhat系列
    else
        echo "invaild"
    fi
}

function replace_source_list_on_ubuntu()
{
    version=$(cat /etc/lsb-release | grep "DISTRIB_RELEASE")
    if [ ${version} == "DISTRIB_RELEASE=16.04" ]; then
        mv /etc/apt/source.list /etc/apt/source.list.bak
        
    
    fi


}


function replace_linux_source()
{
    type=`get_linux_platform_type`
    if [ ${type} == "ubuntu" ]; then
        replace_source_list_on_ubuntu
    elif [ ${type} == "centos" ]; then
        replace_source_list_on_centos
    else
        echo "not support this linux platform type: "${type}
    fi
}


function main()
{
    type=`get_platform_type`
    if [ ${type} == "Linux" ];then
        replace_linux_source
    else
        echo "not support platform type: "${type}
    fi    
}

main

