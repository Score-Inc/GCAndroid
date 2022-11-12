update() {
    if [ -f "/bin/gcandroid" ]; then
        sudo rm /bin/gcandroid
    fi
    if [ -d "/usr/share/gcandroid" ]; then
        sudo rm -rf "/usr/share/gcandroid"
    fi
    folderName="GCAndroid"
    if ! command -v git &> /dev/null; then
        sudo apt install git -y
    fi
    clear
    echo "Download Script..."
    sleep 1s
    if [ -d "$folderName" ]; then
        rm -rf "$folderName"
    fi
    git clone https://github.com/ElaXan/GCAndroid.git
    if [[ $? != 0 ]]; then
        echo "Install Failed!"
        exit 1
    fi
    cd $folderName
    sudo mv Code/gcandroid.sh /bin/gcandroid
    sudo chmod +x /bin/gcandroid
    if [ -d "/usr/share/gcandroid" ]; then
        sudo rm -rf "/usr/share/gcandroid"
    fi
    sudo mv gcandroid /usr/share
    sudo chmod +x /usr/share/gcandroid/*
    rm -rf $HOME/$folderName
    if [ -f "/bin/gcandroid" ] || [ -d "/usr/share/gcandroid" ]; then
        clear
        echo "Install Success!!"
        echo "now enter command : gcandroid"
        exit
    else
        clear
        echo "Install Failed!"
        exit
    fi
}