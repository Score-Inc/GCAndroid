edit_configjson_Server_game_gameOptions() {
    credit_hah
    line3 "Edit config.json [gameOptions]"
    getConfigJson "server.game.gameOptions"
    echo "1. [${GC}$server_game_gameOptions_sceneEntityLimit${WC}] sceneEntityLimit"
    echo "2. [$server_game_gameOptions_watchGachaConfigOut] watchGachaConfig"
    echo "3. [$server_game_gameOptions_enableShopItemsOut] enableShopItems"
    echo "4. [$server_game_gameOptions_staminaUsageOut] staminaUsage"
    echo "5. [$server_game_gameOptions_energyUsageOut] energyUsage"
    echo "6. [$server_game_gameOptions_fishhookTeleportOut] fishhookTeleport"
    echo "7. ${CCB}inventoryLimits${WC}"
    echo "0, ${RC}Back${WC}"
    echo
    echo -n "Enter input : "
    read -r edit_configjson_Server_game_gameOptions_input
    case $edit_configjson_Server_game_gameOptions_input in
    "1") edit_configjson_Server_game_gameOptions_sceneEntityLimit ;;
    "2") edit_configjson_Server_game_gameOptions_watchGachaConfig ;;
    "3") edit_configjson_Server_game_gameOptions_enableShopItems ;;
    "4") edit_configjson_Server_game_gameOptions_staminaUsage ;;
    "5") edit_configjson_Server_game_gameOptions_energyUsage ;;
    "6") edit_configjson_Server_game_gameOptions_fishhookTeleport ;;
    "7") edit_configjson_Server_game_gameOptions_inventoryLimits ;;
    "0") edit_configjson_Server_game ;;
    *)
        echo "${RC}Wrong Input!${WC}"
        sleep 0.5
        edit_configjson_Server_game_gameOptions
        ;;
    esac
}