# Score-Inc/GCAndroid is licensed under the
# GNU General Public License v3.0

# Permissions of this strong copyleft license are conditioned
# on making available complete source code of licensed works
# and modifications, which include larger works using a licensed work,
# under the same license.
# Copyright and license notices must be preserved.
# Contributors provide an express grant of patent rights.

Compile_Grasscutter() {
    Grasscutter_Folder=$HOME/Grasscutter
    if [ ! -d "$Grasscutter_Folder" ]; then
        echo "${RC}Error${WC} : $Grasscutter_Folder not found"
        echo
        read -p "Press enter for back to Menu Grasscutter"
        menu_Grasscutter
        return
    fi
    clear
    credit_hah
    echo "${GC}${space}Compile .jar [PLEASE WAIT]${WC}"
    echo "${line}"
    cd $HOME/Grasscutter || exit 1
    if [ -f "grasscutter.jar" ]; then
        rm grasscutter.jar
    fi
    run_Program() {
        ./gradlew jar &>$HOME/zerr.log
        errCode=$?
        log "$errCode"
    }
    run_Program &
    pid=$!
    spin "${GC}Compiling grasscutter.jar${WC}" "0" "Menu" "main_menu"
    GrasscutterJar=$(ls grasscutter*.jar)
    if [ ! $GrasscutterJar ]; then
        echo "${RC}Error${WC} : Failed compile jar${WC}"
        echo
        read -p "Press enter for back to Menu Grasscutter!"
        Grasscutter_Menu
    else
        mv grasscutter*.jar grasscutter.jar
        echo "${GC}Success compile jar and output to $HOME/Grasscutter folder"
        echo "With name grasscutter.jar${WC}"
        echo
        read -p "Press enter for back to Menu Graascutter!"
        Grasscutter_Menu
    fi
}
