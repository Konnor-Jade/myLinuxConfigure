#!/bin/bash

# 打印logo
function print_logo()
{
    color="$(tput setaf 6)"
    normal="$(tput sgr0)"
    printf "${color}"
    echo '        __                         '
    echo '__   __/_/___ ___ '
    echo '\ \ / / / __ `__ \'
    echo ' \ V / / / / / / /  '
    echo '  \_/_/_/ /_/ /_/  '
    echo '                                    '
    echo ''
    echo ''
    echo 'Just enjoy it!'
    echo 'p.s. Follow me at https://github.com/elinuxboy/vim-deprecated.'
    echo ''
    printf "${normal}"
}

# 备份旧版本文件
function backup_old_version()
{
    echo "backup old version"
    if [ -d "${HOME}/.vim" ];then
        if [ -d "${HOME}/.vim_old" ];then
            echo "directory .vim_old is exist, removing"
            rm -Rf ${HOME}/.vim_old
        fi

        mv -f ${HOME}/.vim ${HOME}/.vim_old
    fi

    if [ -f "${HOME}/.vimrc" ];then
        if [ -f "${HOME}/.vimrc_old" ];then
            echo "file .vimrc_old is exist, removing"
            rm -f ${HOME}/.vimrc_old
        fi

        mv -f ${HOME}/.vimrc ${HOME}/.vimrc_old
    fi
}

# 下载vim 和 vundle插件
function download_vim_and_plug()
{
    echo "download vim-deprecated"
    git clone https://gitclone.com/github.com/elinuxboy/vim-deprecated.git ${HOME}/.vim

    cp ${HOME}/.vim/.vimrc ${HOME}/

    echo "download vundle"
    git clone https://gitclone.com/github.com/gmarik/vundle.git ${HOME}/.vim/bundle/vundle
}

# 插件管理软件BundleInstall安装插件
function bundle_install_vim_plugin()
{
    echo " " > ${HOME}/temp
    echo "插件管理软件正在努力为您安装插件" >> ${HOME}/temp
    echo " " >> ${HOME}/temp
    echo "安装完毕将自动退出" >> ${HOME}/temp
    echo " " >> ${HOME}/temp
    echo "请耐心等待..." >> ${HOME}/temp
    echo " " >> ${HOME}/temp
    vim ${HOME}/temp -c "BundleInstall" -c "q" -c "q"
}

# 完成安装
function end_install()
{
    rm ${HOME}/temp
    echo -e
    echo "安装已完成"
    echo 'p.s. Follow me at https://github.com/elinuxboy/vim-deprecated.'
}

# 在debain发行版上安装必要软件
function install_prepare_software_on_debian()
{
    echo "install_prepare_software_on_debain"
    #sudo apt-fast install -y vim vim-gnome git ctags xclip astyle python-setuptools python-dev

    if which vim >/dev/null; then
        echo -e "vim is installed"
    else
        sudo apt-get install -y vim
    fi

    if which vim-gnome >/dev/null; then
        echo -e "vim-gnome is installed"
    else
        sudo apt-get install -y vim-gnome
    fi

    if which git >/dev/null; then
        echo -e "git is installed"
    else
        sudo apt-get install -y git
    fi

    if which ctags >/dev/null; then
        echo -e "ctags is installed"
    else
        sudo apt-get install -y ctags
        sudo ln -s /usr/bin/ctags /usr/local/bin/ctags
    fi

    if which xclip >/dev/null; then
        echo -e "xclip is installed"
    else
        sudo apt-get install -y xclip
    fi

    if which astyle >/dev/null; then
        echo -e "astyle is installed"
    else
        sudo apt-get install -y astyle
    fi

    if pacman -Qi python-setuptools >/dev/null; then
        echo -e "python-setuptools is installed"
    else
        sudo apt-get install -y python-setuptools
    fi

    if pacman -Qi python-dev >/dev/null; then
        echo -e "python-dev is installed"
    else
        sudo apt-get install -y python-dev
    fi

    if which autopep8 >/dev/null; then
        echo -e "autopep8 is installed"
    else
        sudo easy_install -ZU autopep8
    fi
}

# 在redhat发行版上安装必要软件
function install_prepare_software_on_redhat()
{
    echo "install_prepare_software_on_redhat"
    #yum install -y gcc vim git ctags xclip astyle python-setuptools python-devel

    if which gcc >/dev/null; then
        echo -e "gcc is installed"
    else
        sudo yum install -y gcc
    fi

    if which vim >/dev/null; then
        echo -e "vim is installed"
    else
        sudo yum install -y vim
    fi

    if which git >/dev/null; then
        echo -e "git is installed"
    else
        sudo yum install -y git
    fi

    if which ctags >/dev/null; then
        echo -e "ctags is installed"
    else
        sudo yum install -y ctags
        sudo ln -s /usr/bin/ctags /usr/local/bin/ctags
    fi

    if which xclip >/dev/null; then
        echo -e "xclip is installed"
    else
        sudo yum install -y xclip
    fi

    if which astyle >/dev/null; then
        echo -e "astyle is installed"
    else
        sudo yum install -y astyle
    fi

    if pacman -Qi python-setuptools >/dev/null; then
        echo -e "python-setuptools is installed"
    else
        sudo yum install -y python-setuptools
    fi

    if pacman -Qi python-devel >/dev/null; then
        echo -e "python-devel is installed"
    else
        sudo yum install -y python-devel
    fi

    if which autopep8 >/dev/null; then
        echo -e "autopep8 is installed"
    else
        sudo easy_install -ZU autopep8
    fi
}

# 在archlinux发行版上安装必要软件
function install_prepare_software_on_archlinux()
{
    echo "install_prepare_software_on_archlinux"
    #sudo pacman -S --noconfirm gcc vim git ctags xclip astyle python-setuptools python-evdev

    if which gcc >/dev/null; then
        echo -e "gcc is installed"
    else
        sudo pacman -S --noconfirm gcc
    fi

    if which vim >/dev/null; then
        echo -e "vim is installed"
    else
        sudo pacman -S --noconfirm vim
    fi

    if which git >/dev/null; then
        echo -e "git is installed"
    else
        sudo pacman -S --noconfirm git
    fi

    if which ctags >/dev/null; then
        echo -e "ctags is installed"
    else
        sudo pacman -S --noconfirm ctags
        sudo ln -s /usr/bin/ctags /usr/local/bin/ctags
    fi

    if which astyle >/dev/null; then
        echo -e "astyle is installed"
    else
        sudo pacman -S --noconfirm astyle
    fi

    if pacman -Qi python-setuptools >/dev/null; then
        echo -e "python-setuptools is installed"
    else
        sudo pacman -S --noconfirm python-setuptools
    fi

    if pacman -Qi python-evdev >/dev/null; then
        echo -e "python-evdev is installed"
    else
        sudo pacman -S --noconfirm python-evdev
    fi

    if which autopep8 >/dev/null; then
        echo -e "autopep8 is installed"
    else
        sudo easy_install -ZU autopep8
    fi
}

# 在mac发行版上安装必要软件
function install_prepare_software_on_mac()
{
    echo "install_prepare_software_on_mac"
    #brew install vim ctags git astyle

    if which vim >/dev/null; then
        echo -e "vim is installed"
    else
        brew install vim
    fi

    if which git >/dev/null; then
        echo -e "git is installed"
    else
        brew install git
    fi

    if which ctags >/dev/null; then
        echo -e "ctags is installed"
    else
        brew install ctags
        sudo ln -s /usr/bin/ctags /usr/local/bin/ctags
    fi

    if which astyle >/dev/null; then
        echo -e "astyle is installed"
    else
        brew install astyle
    fi

    if which autopep8 >/dev/null; then
        echo -e "autopep8 is installed"
    else
        sudo easy_install -ZU autopep8
    fi
}

# 在debian系列发行版上安装vim
function install_vim_on_debian()
{
    echo "install_vim_on_debian"
    install_prepare_software_on_debian
    backup_old_version
    download_vim_and_plug
    bundle_install_vim_plugin
    end_install
    print_logo
}

# 在redhat系列发行版上安装vim
function install_vim_on_redhat()
{
    echo "install_vim_on_redhat"
    install_prepare_software_on_redhat
    backup_old_version
    download_vim_and_plug
    bundle_install_vim_plugin
    end_install
    print_logo
}

# 在archlinux系列发行版上安装vim
function install_vim_on_archlinux()
{
    echo "install_vim_on_archlinux"
    install_prepare_software_on_archlinux
    backup_old_version
    download_vim_and_plug
    bundle_install_vim_plugin
    end_install
    print_logo
}

# 在mac上安装vim
function install_vim_on_mac()
{
    echo "install_vim_on_mac"
    install_prepare_software_on_mac
    backup_old_version
    download_vim_and_plug
    bundle_install_vim_plugin
    end_install
    print_logo
}

# 获取linux包管理器类型
function get_pkg_manage_type()
{
    if which apt-get > /dev/null ; then
        echo "apt-get" # debian ubuntu系列
    elif which yum > /dev/null ; then
        echo "yum" # redhat centos系列
    elif which pacman > /dev/null; then
        echo "pacman" # archlinux系列
    else
        echo "invaild"
    fi
}

# 在linux平台安装vim
function install_vim_on_linux()
{
    type=`get_pkg_manage_type`
    echo "linux pkg manage type: "${type}

    echo "install_vim_on_linux"

    if [ ${type} == "apt-get" ]; then
        install_vim_on_debian
    elif [ ${type} == "yum" ]; then
        install_vim_on_redhat
    elif [ ${type} == "pacman" ]; then
        install_vim_on_archlinux
    else
        echo "not support this pkg manage type: "${type}
    fi
}

# 获取平台类型，mac还是linux平台
function get_platform_type()
{
    echo $(uname)
}

# main函数
function main()
{
    type=`get_platform_type`
    echo "platform type: "${type}

    if [ ${type} == "Darwin" ]; then
        install_vim_on_mac
    elif [ ${type} == "Linux" ]; then
        install_vim_on_linux
    else
        echo "not support platform type: "${type}
    fi
}

# 调用main函数
main
