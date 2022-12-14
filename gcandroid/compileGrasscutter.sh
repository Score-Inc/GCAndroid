# Score-Inc/GCAndroid is licensed under the
# GNU General Public License v3.0

Compile_Grasscutter() {
    Grasscutter_Folder=$HOME/Grasscutter
    if [ ! -d "$Grasscutter_Folder" ]; then
        echo "${RC}Error${WC} : $Grasscutter_Folder not found"
        echo
        read -p "Press enter for back to Menu Grasscutter"
        Grasscutter_Menu
        return
    fi
    if [ ! -f "$Grasscutter_Folder/gradlew" ]; then
        echo "${RC}Error${WC} : gradlew not found!"
        echo
        read -p "Press enter for back to Menu Grasscutter"
        Grasscutter_Menu
        return
    fi
    clear
    credit_hah
    Center_Text "Compile .jar [PLEASE WAIT]"
    cd $HOME/Grasscutter || exit 1
    if [ -f "grasscutter.jar" ]; then
        rm grasscutter.jar
    fi
    Run "./gradlew jar" "Compiling grasscutter.jar" "0" "Menu" "main_menu"
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
