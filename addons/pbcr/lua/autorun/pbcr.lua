CLASS_CIS = CLASS_CIS or 101
CLASS_REPUBLIC = CLASS_REPUBLIC or 102

local PBCR_Factions = {
    ["default"] = {
        name = "Default (Player)",
        icon = "icon16_relations/default.png",
        desc = "Default (Player) — Regular players have a standard relationship, with no automatic changes.",
        friendClasses = {},
        neutralClasses = {},
        useDefaultRelations = true,
    },
    ["outcast"] = {
        name = "Outcast",
        icon = "icon16_relations/pariah.png",
        desc = "Outcast — All NPCs become hostile, and you don't belong to more than one faction.",
        friendClasses = {},
        neutralClasses = {},
        useDefaultRelations = false,
    },
    ["cis"] = {
        name = "Confederacy of Independent Systems",
        icon = "icon16_relations/pariah.png",
        desc = "CIS — Friendly to all CIS droid forces and units.",
        friendClasses = {CLASS_CIS},
        neutralClasses = {CLASS_NONE, CLASS_BULLSEYE},
        useDefaultRelations = false,
    },
    ["republic"] = {
        name = "Galactic Republic",
        icon = "icon16_relations/neutral.png",
        desc = "Republic — Friendly to Galactic Republic clone units and allies.",
        friendClasses = {},
        neutralClasses = {},
        useDefaultRelations = true,
    },
    ["neutral"] = {
        name = "Neutral",
        icon = "icon16_relations/neutral.png",
        desc = "Neutral — All NPCs become neutral, and you are no longer hostile to all NPCs.",
        friendClasses = {},
        neutralClasses = {CLASS_NONE, CLASS_BULLSEYE, CLASS_CITIZEN_PASSIVE, CLASS_FLARE, CLASS_COMBINE, CLASS_METROPOLICE, CLASS_MANHACK, CLASS_SCANNER, CLASS_COMBINE_HUNTER, CLASS_MILITARY, CLASS_STALKER, CLASS_COMBINE_GUNSHIP, CLASS_PROTOSNIPER, CLASS_PLAYER_ALLY, CLASS_PLAYER_ALLY_VITAL, CLASS_VORTIGAUNT, CLASS_HACKED_ROLLERMINE, CLASS_ZOMBIE, CLASS_HEADCRAB, CLASS_ANTLION, CLASS_MACHINE, CLASS_HUMAN_PASSIVE, CLASS_HUMAN_MILITARY, CLASS_ALIEN_MILITARY, CLASS_ALIEN_MONSTER, CLASS_ALIEN_PREY, CLASS_ALIEN_PREDATOR, CLASS_INSECT, CLASS_PLAYER_BIOWEAPON, CLASS_ALIEN_BIOWEAPON, CLASS_PORTAL_TURRET, CLASS_EARTH_FAUNA},
        useDefaultRelations = false,
    },
    ["combine"] = {
        name = "The Combine",
        icon = "icon16_relations/combine_logo.png",
        desc = "The Combine — All units of the combine are friendly but most citizens and rebels and hacked combine machines will be hostile, but some units are neutral.",
        friendClasses = {CLASS_COMBINE, CLASS_METROPOLICE, CLASS_MANHACK, CLASS_SCANNER, CLASS_COMBINE_HUNTER, CLASS_MILITARY, CLASS_STALKER, CLASS_COMBINE_GUNSHIP, CLASS_PROTOSNIPER},
        neutralClasses = {CLASS_NONE, CLASS_BULLSEYE, CLASS_PLAYER_BIOWEAPON, CLASS_CITIZEN_PASSIVE, CLASS_FLARE},
        useDefaultRelations = false,
    },
    ["rebels"] = {
        name = "Resistance",
        icon = "icon16_relations/resistance_logo.png",
        desc = "Rebels/Resistance — Friendly to citizens and the player's allies. However, zombies and the combine are aggressively set up against you.",
        friendClasses = {CLASS_PLAYER_ALLY, CLASS_PLAYER_ALLY_VITAL, CLASS_VORTIGAUNT, CLASS_HUMAN_PASSIVE, CLASS_HACKED_ROLLERMINE},
        neutralClasses = {CLASS_NONE, CLASS_BULLSEYE, CLASS_PLAYER_BIOWEAPON, CLASS_CITIZEN_PASSIVE, CLASS_FLARE},
        useDefaultRelations = false,
    },
    ["zombies"] = {
        name = "Zombies",
        icon = "icon16_relations/headcrab.png",
        desc = "Zombies and headcrabs — They are aggressive towards everyone except other undead.",
        friendClasses = {CLASS_ZOMBIE, CLASS_HEADCRAB, CLASS_ALIEN_MILITARY, CLASS_ALIEN_MONSTER, CLASS_ALIEN_PREDATOR, CLASS_ALIEN_PREY, CLASS_INSECT, CLASS_ALIEN_BIOWEAPON},
        neutralClasses = {CLASS_NONE, CLASS_BULLSEYE, CLASS_PLAYER_BIOWEAPON, CLASS_FLARE},
        useDefaultRelations = false,
    },
    ["antlions"] = {
        name = "Antlions",
        icon = "icon16_relations/antlions.png",
        desc = "Antlions — They are aggressive towards everyone except their antlions.",
        friendClasses = {CLASS_ANTLION},
        neutralClasses = {CLASS_NONE, CLASS_BULLSEYE, CLASS_PLAYER_BIOWEAPON, CLASS_FLARE},
        useDefaultRelations = false,
    },
    ["hecu"] = {
        name = "H.E.C.U",
        icon = "icon16_relations/hecu_logo.png",
        desc = "H.E.C.U — The soldiers from this subdivision and military are friendly to you, but you are enemies for everyone, for rebels, for the combine, for zombies, etc. You need have Half-Life Source or Half-Life Resurgence",
        friendClasses = {CLASS_HUMAN_MILITARY, CLASS_MACHINE},
        neutralClasses = {CLASS_NONE, CLASS_BULLSEYE, CLASS_PLAYER_BIOWEAPON, CLASS_FLARE},
        useDefaultRelations = false,
    },
    ["xen"] = {
        name = "XEN",
        icon = "icon16_relations/xen_logo.png",
        desc = "XEN — They are aggressive towards everyone except, of course, the creatures from XEN. You need have Half-Life Source or Half-Life Resurgence",
        friendClasses = {CLASS_ALIEN_MILITARY, CLASS_ALIEN_MONSTER, CLASS_ALIEN_PREY, CLASS_ALIEN_PREDATOR, CLASS_ALIEN_BIOWEAPON, CLASS_ZOMBIE, CLASS_HEADCRAB},
        neutralClasses = {CLASS_NONE, CLASS_BULLSEYE, CLASS_PLAYER_BIOWEAPON, CLASS_FLARE},
        useDefaultRelations = false,
    },
    ["race_x"] = {
        name = "Race X",
        icon = "icon16_relations/race_x.png",
        desc = "Race X — They are aggressive towards everyone except, of course, the creatures from Race X. You need have Half-Life Resurgence",
        friendClasses = {},
        neutralClasses = {CLASS_NONE, CLASS_BULLSEYE, CLASS_PLAYER_BIOWEAPON, CLASS_FLARE},
        useDefaultRelations = false,
    },
    ["blackops"] = {
        name = "Black Operations",
        icon = "icon16_relations/black_ops.png",
        desc = "Black Operations — The assassins from this subdivision are friendly to you, but you are enemies for everyone, for rebels, for the combine, for zombies, etc. You need have Half-Life Resurgence",
        friendClasses = {CLASS_HUMAN_MILITARY, CLASS_MACHINE},
        neutralClasses = {CLASS_NONE, CLASS_BULLSEYE, CLASS_PLAYER_BIOWEAPON, CLASS_FLARE},
        useDefaultRelations = false,
    },
    ["aperture"] = {
        name = "Aperture Science",
        icon = "icon16_relations/aperture_logo.png",
        desc = "Aperture Science — The turrets and some devices from this organization are friendly towards you, but you are hostile towards everyone else.",
        friendClasses = {CLASS_PORTAL_TURRET},
        neutralClasses = {CLASS_NONE, CLASS_BULLSEYE, CLASS_PLAYER_BIOWEAPON, CLASS_FLARE},
        useDefaultRelations = false,
    }
}

PBCR_PlayerFactions = PBCR_PlayerFactions or {}

local function SaveFactions()
    if SERVER then
        file.CreateDir("player_based_npc_relations_redone")
        file.Write("player_based_npc_relations_redone/pbcr_factions_npcs.txt", util.TableToJSON(PBCR_PlayerFactions or {}))
    end
end

local function LoadFactions()
    if SERVER then
        local path = "player_based_npc_relations_redone/pbcr_factions_npcs.txt"
        if file.Exists(path, "DATA") then
            local data = file.Read(path, "DATA")
            if data then
                PBCR_PlayerFactions = util.JSONToTable(data) or {}
            end
        end
    end
end

local PBCR_ZBaseFactionMap = {
    cis      = "cis",
    republic = "republic",
    combine = "combine",
    rebels  = "ally",
    ["default"] = "ally",
    outcast  = "clonecop",
    neutral  = "neutral",
    zombies = "zombie",
    antlions = "antlion",
    hecu = "hecu",
    xen = "xen",
    race_x = "racex",
    blackops = "blackops",
    aperture = "aperture",
}

local PBCR_VJClassMap = {
    cis      = "CLASS_CIS" or CLASS_CIS,
    republic = "CLASS_REPUBLIC",
    combine = "CLASS_COMBINE",
    rebels = "CLASS_PLAYER_ALLY",
    ["default"] = "CLASS_PLAYER_ALLY",
    outcast = "CLASS_AIDEN",
    neutral = "CLASS_PLAYER_ALLY",
    zombies = "CLASS_ZOMBIE",
    antlions = "CLASS_ANTLION",
    hecu = "CLASS_UNITED_STATES",
    xen = "CLASS_XEN",
    race_x = "CLASS_RACE_X",
    blackops = "CLASS_BLACKOPS",
    aperture = "CLASS_PORTAL_TURRET",
}

local PBCR_Lang = {
    en = {
        tab_factions = "Factions",
        menu_npc_control = "NPC Control",
        choose_faction = "Choose Faction",
        choose_desc = "NPCs will consider you their own. Choose a faction for the player.",
        missing_faction = "Error: Missing Faction.",
        unknown_faction = "Error: Unknown Faction '%s'.",
        faction_changed = "Success: Faction Changed To: %s",
        usage_setfaction = "Usage: pbcr_setfaction <faction>",
        error_unknown_faction = "Error: Unknown Faction!",
        faction_changed_console = "Success: The Faction Is Changed: %s",
        usage_server_console = "Usage (server console): pbcr_setfaction <faction>",
        faction_set_for_sid = "Success: Faction For %s Set To %s",
        admin_only_faction_change = "Error: Only Administrators Can Change Factions.",
        player_not_found = "Error: Player '%s' Not Found.",
        steamid_not_found = "Error: '%s' Not Found.",
        faction_set_for_player = "Success: Faction For %s Set To %s",
        usage_setfaction_to_player = "Usage: pbcr_setfaction_to_player <steamid or nick> <faction>",
        multiple_players_found = "Warning: Multiple Players Found With Name '%s'. Use SteamID Instead.",
    },
    ru = {
        tab_factions = "Фракции",
        menu_npc_control = "Управление NPC",
        choose_faction = "Выберите Фракцию",
        choose_desc = "NPC будут считать вас своим. Выберите фракцию для игрока.",
        missing_faction = "Ошибка: Отсутствует Фракция.",
        unknown_faction = "Ошибка: Неизвестная Фракция '%s'.",
        faction_changed = "Успешно: Фракция Изменена На: %s",
        usage_setfaction = "Использование: pbcr_setfaction <фракция>",
        error_unknown_faction = "Ошибка: Неизвестная Фракция!",
        faction_changed_console = "Успешно: Фракция Изменена: %s",
        usage_server_console = "Использование (Консоль Сервера): pbcr_setfaction <фракция>",
        faction_set_for_sid = "Успешно: Фракция Для %s Установлена: %s",
        admin_only_faction_change = "Ошибка: Только Администраторы Могут Менять Фракцию.",
        player_not_found = "Ошибка: Игрок '%s' Не Найден.",
        steamid_not_found = "Ошибка: '%s' Не Найден.",
        faction_set_for_player = "Успешно: Фракция Для %s Установлена Как %s",
        usage_setfaction_to_player = "Использование: pbcr_setfaction_to_player <steamid или ник> <фракция>",
        multiple_players_found = "Предупреждение: Найдено Несколько Игроков С Именем '%s'. Используйте SteamID.",
    },
    uk = {
        tab_factions = "Фракції",
        menu_npc_control = "Управління NPC",
        choose_faction = "Виберіть Фракцію",
        choose_desc = "NPC вважатимуть вас своїм. Виберіть фракцію для гравця.",
        missing_faction = "Помилка: Відсутня Фракція.",
        unknown_faction = "Помилка: Невідома Фракція '%s'.",
        faction_changed = "Успішно: Фракція Змінено На: %s",
        usage_setfaction = "Використання: pbcr_setfaction <фракція>",
        error_unknown_faction = "Помилка: Невідома Фракція!",
        faction_changed_console = "Успішно: Фракція Змінено: %s",
        usage_server_console = "Використання (Консоль Сервера): pbcr_setfaction <фракція>",
        faction_set_for_sid = "Успішно: Фракція Для %s Встановлено: %s",
        admin_only_faction_change = "Помилка: Тільки Адміністратори Можуть Змінювати Фракцію.",
        player_not_found = "Помилка: Гравець '%s' Не Знайдено.",
        steamid_not_found = "Помилка: '%s' Не Знайдено.",
        faction_set_for_player = "Успішно: Фракція За %s Встановлено Як %s",
        usage_setfaction_to_player = "Використання: pbcr_setfaction_to_player <steamid або нік> <фракція>",
        multiple_players_found = "Попередження: Знайдено Декількох Гравців З Таким ім'ям '%s'. Використовуйте SteamID.",
    },
    de = {
        tab_factions = "Fraktionen",
        menu_npc_control = "NPC-Steuerung",
        choose_faction = "Fraktion Auswählen",
        choose_desc = "NPCs werden dich als einen der ihren betrachten. Wähle eine Fraktion für den Spieler aus.",
        missing_faction = "Fehler: Fehlende Fraktion.",
        unknown_faction = "Fehler: Unbekannte Fraktion '%s'.",
        faction_changed = "Erfolgreich: Fraktion Geändert Zu: %s",
        usage_setfaction = "Verwendung: pbcr_setfaction <Fraktion>",
        error_unknown_faction = "Fehler: Unbekannte Fraktion!",
        faction_changed_console = "Erfolgreich: Die Fraktion Wird Geändert: %s",
        usage_server_console = "Verwendung (Serverkonsole): pbcr_setfaction <fraktion>",
        faction_set_for_sid = "Erfolgreich: Fraktion Für %s Set Zu %s",
        admin_only_faction_change = "Fehler: Nur Administratoren Können Die Fraktion Wechseln.",
        player_not_found = "Fehler: Spieler '%s' Nicht Gefunden.",
        steamid_not_found = "Fehler: '%s' Nicht Gefunden.",
        faction_set_for_player = "Erfolgreich: Fraktion Für %s Einstellen Auf %s",
        usage_setfaction_to_player = "Verwendung: pbcr_setfaction_to_player <steamid oder nick> <fraktion>",
        multiple_players_found = "Warnung: Es Wurden Mehrere Spieler Mit Diesem Namen Gefunden '%s'. Verwende Stattdessen Die SteamID.",
    },
    tr = {
        tab_factions = "Fraksiyonlar",
        menu_npc_control = "NPC Kontrolü",
        choose_faction = "Fraksiyon Seç",
        choose_desc = "NPC'ler sizi kendilerinden biri olarak görecekler. Oyuncu için bir fraksiyon seçin.",
        missing_faction = "Hata: Kayıp Fraksiyon.",
        unknown_faction = "Hata: Bilinmeyen Fraksiyon '%s'.",
        faction_changed = "Başarıyla: Fraksiyon Şu Şekilde Değiştirildi: %s",
        usage_setfaction = "Kullanım: pbcr_setfaction <fraksiyon>",
        error_unknown_faction = "Hata: Bilinmeyen Fraksiyon!",
        faction_changed_console = "Başarıyla: Fraksiyon Değişti: %s",
        usage_server_console = "Kullanım (sunucu konsolu): pbcr_setfaction <fraksiyon>",
        faction_set_for_sid = "Başarıyla: İçin Fraksiyon %s Olarak ayarla %s",
        admin_only_faction_change = "Hata: Sadece Yöneticiler Fraksiyonları Değiştirebilir.",
        player_not_found = "Hata: Oyuncu '%s' Bulunamadı.",
        steamid_not_found = "Hata: '%s' Bulunamadı.",
        faction_set_for_player = "Başarıyla: Faksiyon İçin %s Ayarla %s",
        usage_setfaction_to_player = "Kullanım: pbcr_setfaction_to_player <steamid veya nick> <fraksiyon>",
        multiple_players_found = "Uyarı: Bu Isimle Birden Fazla Oyuncu Bulundu '%s'. Bunun Yerine SteamID'yi Kullanın.",
    },
    ["es-es"] = {
        tab_factions = "Facciones",
        menu_npc_control = "Control De PNJ",
        choose_faction = "Elegir Facción",
        choose_desc = "Los PNJ te considerarán como uno de los suyos. Elige una facción para el jugador.",
        missing_faction = "Error: Facción Faltante.",
        unknown_faction = "Error: Facción Desconocida '%s'.",
        faction_changed = "Éxito: Facción Cambiada a: %s",
        usage_setfaction = "Uso: pbcr_setfaction <facción>",
        error_unknown_faction = "Error: ¡Facción Desconocida!",
        faction_changed_console = "Éxito: La Facción Ha Cambiado: %s",
        usage_server_console = "Uso (consola del servidor): pbcr_setfaction <facción>",
        faction_set_for_sid = "Éxito: Facción Para %s Establecida A %s",
        admin_only_faction_change = "Error: Solo Los Administradores Pueden Cambiar De Facción.",
        player_not_found = "Error: Jugador '%s' No Encontrado.",
        steamid_not_found = "Error: '%s' No Encontrado.",
        faction_set_for_player = "Éxito: Facción A Favor %s Configurar En %s",
        usage_setfaction_to_player = "Uso: pbcr_setfaction_to_player <steamid o nick> <facción>",
        multiple_players_found = "Advertencia: Se Han Encontrado Varios Jugadores Con Ese Nombre '%s'. Utiliza Tu SteamID En Su Lugar.",
    },
    ["pt-br"] = {
        tab_factions = "Facções",
        menu_npc_control = "Controle De NPC",
        choose_faction = "Escolher Facção",
        choose_desc = "Os NPCs vão te considerar um dos seus. Escolha uma facção para o jogador.",
        missing_faction = "Erro: Facção Ausente.",
        unknown_faction = "Erro: Facção Desconhecida '%s'.",
        faction_changed = "Sucesso: Facção Alterada Para: %s",
        usage_setfaction = "Uso: pbcr_setfaction <facção>",
        error_unknown_faction = "Erro: Facção Desconhecida!",
        faction_changed_console = "Sucesso: A facção Foi Alterada: %s",
        usage_server_console = "Uso (console do servidor): pbcr_setfaction <facção>",
        faction_set_for_sid = "Sucesso: Facção Para %s Definida Para %s",
        admin_only_faction_change = "Erro: Somente Administradores Podem Mudar De Facção.",
        player_not_found = "Erro: Jogador '%s' Não Encontrado.",
        steamid_not_found = "Erro: '%s' Não Encontrado.",
        faction_set_for_player = "Sucesso: Facção A Favor %s Definir Como %s",
        usage_setfaction_to_player = "Uso: pbcr_setfaction_to_player <steamid ou nick> <facção>",
        multiple_players_found = "Aviso: Vários Jogadores Encontrados Com Esse Nome '%s'. Use O SteamID Em Vez Disso.",
    },
    ["pt-pt"] = {
        tab_factions = "Facções",
        menu_npc_control = "Controlo De NPC",
        choose_faction = "Escolher Facção",
        choose_desc = "Os NPCs irão considerá-lo como um dos seus. Escolha uma facção para o jogador.",
        missing_faction = "Erro: Facção Em Falta.",
        unknown_faction = "Erro: Facção Desconhecida '%s'.",
        faction_changed = "Sucesso: Facção Alterada Para: %s",
        usage_setfaction = "Uso: pbcr_setfaction <facção>",
        error_unknown_faction = "Erro: Facção Desconhecida!",
        faction_changed_console = "Sucesso: A Facção Foi Alterada: %s",
        usage_server_console = "Uso (console do servidor): pbcr_setfaction <facção>",
        faction_set_for_sid = "Sucesso: Facção Para %s Definida Para %s",
        admin_only_faction_change = "Erro: Apenas Os Administradores Podem Mudar De Facção.",
        player_not_found = "Erro: Jogador '%s' Não Encontrado.",
        steamid_not_found = "Erro: '%s' Não Encontrado.",
        faction_set_for_player = "Sucesso: Facção A Favor %s Definir Para %s",
        usage_setfaction_to_player = "Uso: pbcr_setfaction_to_player <steamid ou nick> <facção>",
        multiple_players_found = "Aviso: Foram Encontrados Vários Jogadores Com Esse Nome '%s'. Use O SteamID Em Vez Disso.",
    },
    bg = {
        tab_factions = "Фракции",
        menu_npc_control = "Управление NPC",
        choose_faction = "Изберете Фракция",
        choose_desc = "NPC Ще Ви Считат За Свои. Изберете Фракция За Играча.",
        missing_faction = "Грешка: Липсва Фракция.",
        unknown_faction = "Грешка: Неизвестна Фракция '%s'.",
        faction_changed = "Успешно: Фракцията Е Променена на: %s",
        usage_setfaction = "Употреба: pbcr_setfaction <фракция>",
        error_unknown_faction = "Грешка: Неизвестна Фракция!",
        faction_changed_console = "Успешно: Фракцията Е Променена: %s",
        usage_server_console = "Употреба (конзола на сървъра): pbcr_setfaction <фракция>",
        faction_set_for_sid = "Успешно: Фракция За %s Зададена На %s",
        admin_only_faction_change = "Грешка: Само Администраторите Могат Да Сменят Фракцията Си.",
        player_not_found = "Грешка: Играч '%s' Не Е Намерен.",
        steamid_not_found = "Грешка: '%s' Не Е Намерен.",
        faction_set_for_player = "Успешно: Фракция За %s Настроено Как %s",
        usage_setfaction_to_player = "Употреба: pbcr_setfaction_to_player <steamid или ник> <фракция>",
        multiple_players_found = "Предупреждение: Намерени Са Няколко Играчи С Име '%s'. Използвайте SteamID.",
    },
    pl = {
        tab_factions = "Frakcje",
        menu_npc_control = "Kontrola NPC",
        choose_faction = "Wybierz Frakcję",
        choose_desc = "NPC Będą Uważać Cię Za Swojego. Wybierz Frakcję Dla Gracza.",
        missing_faction = "Błąd: Brak Frakcji.",
        unknown_faction = "Błąd: Nieznana Frakcja '%s'.",
        faction_changed = "Sukces: Frakcja Zmieniona Na: %s",
        usage_setfaction = "Użycie: pbcr_setfaction <frakcja>",
        error_unknown_faction = "Błąd: Nieznana Frakcja!",
        faction_changed_console = "Sukces: Frakcja Zmieniona: %s",
        usage_server_console = "Użycie (konsola serwera): pbcr_setfaction <frakcja>",
        faction_set_for_sid = "Sukces: Frakcja Dla %s Ustawiona Na %s",
        admin_only_faction_change = "Błąd: Tylko Administratorzy Mogą Zmieniać Frakcje.",
        player_not_found = "Błąd: Gracz '%s' Nie Znaleziono.",
        steamid_not_found = "Błąd: '%s' Nie Znaleziono.",
        faction_set_for_player = "Sukces: Frakcja Za %s Ustaw Na %s",
        usage_setfaction_to_player = "Użycie: pbcr_setfaction_to_player <steamid lub nick> <frakcja>",
        multiple_players_found = "Ostrzeżenie: Znaleziono Wielu Graczy O Tej Samej Nazwie '%s'. Zamiast tego użyj SteamID.",
    }
}

local PBCR_FactionLocales = {
    ["default"] = {
        en = { name = "Default (Player)", desc = "Default (Player) — Regular players have a standard relationship, with no automatic changes." },
        ru = { name = "По умолчанию (Игрок)", desc = "По умолчанию — Обычные игроки имеют стандартные отношения без автоматических изменений." },
        uk = { name = "За замовчуванням (Гравець)", desc = "За замовчуванням — Звичайні гравці мають стандартні відносини без автоматичних змін." },
        de = { name = "Standard (Spieler)", desc = "Standard (Spieler) — Regelmäßige Spieler haben eine Standardbeziehung, ohne automatische Änderungen." },
        tr = { name = "Varsayılan (Oynatıcı)", desc = "Varsayılan (Oynatıcı) — Normal oyuncuların standart bir ilişkisi vardır, otomatik olarak değişmez." },
       ["es-es"] = { name = "Predeterminado (Jugador)", desc = "Predeterminado (Jugador): los jugadores habituales tienen una relación estándar, sin cambios automáticos." },
       ["pt-br"] = { name = "Padrão (Jogador)", desc = "Padrão (Jogador) — Os jogadores regulares têm uma relação padrão, sem alterações automáticas." },
       ["pt-pt"] = { name = "Padrão (Jogador)", desc = "Padrão (Jogador) — Os jogadores regulares têm uma relação padrão, sem alterações automáticas." },
        bg = { name = "По подразбиране (Играч)", desc = "По подразбиране — Обикновените играчи имат стандартни отношения без автоматични промени." },
        pl = { name = "Domyślnie (Gracz)", desc = "Domyślnie — zwykli gracze mają standardowe relacje bez automatycznych zmian." }
    },
        ["cis"] = {
        en = { name = "cis", desc = "Default (Player) — Regular players have a standard relationship, with no automatic changes." },
        ru = { name = "кнс", desc = "По умолчанию — Обычные игроки имеют стандартные отношения без автоматических изменений." },
    },
        ["republic"] = {
        en = { name = "republic", desc = "Default (Player) — Regular players have a standard relationship, with no automatic changes." },
        ru = { name = "республика", desc = "По умолчанию — Обычные игроки имеют стандартные отношения без автоматических изменений." },
    },
    ["outcast"] = {
        en = { name = "Outcast", desc = "Outcast — All NPCs become hostile, and you don't belong to more than one faction." },
        ru = { name = "Изгой", desc = "Изгой — Все NPC становятся враждебными; вы не можете принадлежать более чем к одной фракции." },
        uk = { name = "Ізгой", desc = "Ізгой — Всі NPC стають ворожими; ви не можете належати до більш ніж однієї фракції." },
        de = { name = "Ausgestoßener", desc = "Ausgestoßener — Alle NPCs werden feindselig, und du gehörst nicht mehr als einer Fraktion an." },
        tr = { name = "Sürgün", desc = "Sürgün — Tüm npc'ler düşman olur ve siz birden fazla fraksiyona ait değilsiniz." },
       ["es-es"] = { name = "Pariente", desc = "Pariente — Todos los NPC se vuelven hostiles y no puedes pertenecer a más de una facción." },
       ["pt-br"] = { name = "Pária", desc = "Pária — Todos os NPCs tornam-se hostis e não pertences a mais do que uma facção." },
       ["pt-pt"] = { name = "Pária", desc = "Pária — Todos os NPCs se tornam hostis, e você não pertence a mais de uma facção." },
        bg = { name = "Изгой", desc = "Изгой — Всички NPC стават враждебни; не можете да принадлежите към повече от една фракция." },
        pl = { name = "Wyrzutek", desc = "Wyrzutek — Wszyscy NPC stają się wrogo nastawieni; nie możesz należeć do więcej niż jednej frakcji." }
    },
    ["neutral"] = {
        en = { name = "Neutral", desc = "Neutral — All NPCs become neutral, and you are no longer hostile to all NPCs." },
        ru = { name = "Нейтральный", desc = "Нейтральный — все NPC становятся нейтральными, и вы больше не враждебны по отношению ко всем NPC." },
        uk = { name = "Нейтральний", desc = "Нейтральний — всі NPC стають нейтральними, і ви більше не ворожі по відношенню до всіх NPC." },
        de = { name = "Neutral", desc = "Neutral — Alle NPCs werden neutral, und du bist nicht mehr allen NPCs gegenüber feindlich gesinnt." },
        tr = { name = "Tarafsız", desc = "Tarafsız — Tüm NPC'ler tarafsız hale gelir ve artık tüm NPC'lere düşmanca davranmazsınız." },
       ["es-es"] = { name = "Neutral", desc = "Neutral — todos los PNJ se vuelven neutrales y tú ya no eres hostil hacia ellos." },
       ["pt-br"] = { name = "Neutro", desc = "Neutro — Todos os NPCs se tornam neutros, e você não é mais hostil a todos os NPCs." },
       ["pt-pt"] = { name = "Neutro", desc = "Neutro — Todos os NPCs tornam-se neutros e você deixa de ser hostil para com todos os NPCs." },
        bg = { name = "Нейтрален", desc = "Нейтрален — Всички NPC стават нейтрални; не можете да бъдете враждебни към всички NPC." },
        pl = { name = "Neutralny", desc = "Neutralny — Wszyscy NPC stają się neutralni; nie możesz być wrogi do wszystkich NPC." }
    },
    ["combine"] = {
        en = { name = "The Combine", desc = "The Combine — All units of the combine are friendly but most citizens and rebels and hacked combine machines will be hostile, but some units are neutral." },
        ru = { name = "Комбайны", desc = "Комбайны — Юниты комбайнов дружелюбны, но гражданские, повстанцы и взломанные машины комбайнов часто враждебны; некоторые юниты нейтральны." },
        uk = { name = "Комбайни", desc = "Комбайни — Юніти комбайнів дружні, але цивільні, повстанці та зламані машини комбайнів часто ворожі; деякі юніти нейтральні." },
        de = { name = "Die Combine", desc = "Die Combine – Alle Einheiten der combine sind freundlich gesinnt, aber die meisten Bürger und Rebellen sowie gehackte combine-maschinen sind feindlich, während einige Einheiten neutral sind." },
        tr = { name = "Biçerdöver", desc = "Biçerdöver — combine tüm birimleri dosttur ama çoğu vatandaş, isyancı ve hacklenmiş Combine makineleri düşmandır ama bazı birimler tarafsızdır." },
       ["es-es"] = { name = "El Combine", desc = "El Combine — Todas las unidades de la combine son amistosas, pero la mayoría de los ciudadanos, rebeldes y máquinas pirateadas de la combine serán hostiles, aunque algunas unidades son neutrales." },
       ["pt-br"] = { name = "A Combine", desc = "A Combine — Todas as unidades da сombine são amigáveis, mas a maioria dos cidadãos, rebeldes e máquinas hackeadas da сombine serão hostis, embora algumas unidades sejam neutras." },
       ["pt-pt"] = { name = "A Combine", desc = "A Combine — Todas as unidades da combine são amigáveis, mas a maioria dos cidadãos, rebeldes e máquinas hackeadas da combine serão hostis, embora algumas unidades sejam neutras." },
        bg = { name = "Комбайни", desc = "Комбайни — Юнити комбайнов дружелюбни, но граждански, повстанци и взломани машини комбайни често враждебни; някои юнити са нейтрални." },
        pl = { name = "The Combine", desc = "The Combine — Wszystkie jednostki combine są przyjazne, ale większość obywateli i rebeliantów oraz zahackowane maszyny combine będą wrogi, choć niektóre jednostki są neutralne." }
    },
    ["rebels"] = {
        en = { name = "Resistance", desc = "Rebels/Resistance — Friendly to citizens and the player's allies. However, zombies and the combine are aggressively set up against you." },
        ru = { name = "Сопротивление", desc = "Сопротивление — Дружелюбны к гражданским и союзникам игрока; зомби и Комбайны настроены враждебно." },
        uk = { name = "Повстанці", desc = "Повстанці — Доброзичливі до цивільних і союзників гравця; зомбі і Комбайни налаштовані вороже." },
        de = { name = "Widerstand", desc = "Rebellen/Widerstand — Freundlich gegenüber Bürgern und den Verbündeten des Spielers. Zombies und die Combine hingegen sind aggressiv gegen dich eingestellt." },
        tr = { name = "Direnç", desc = "İsyancılar/Direniş — Vatandaşlara ve oyuncunun müttefiklerine dosttur. Ancak, zombiler ve Combine size karşı saldırgan bir şekilde ayarlanmıştır." },
       ["es-es"] = { name = "Resistencia", desc = "Rebeldes/Resistencia: amigables con los ciudadanos y los aliados del jugador. Sin embargo, los zombis y la combine se muestran agresivos contra ti." },
       ["pt-br"] = { name = "Resistência", desc = "Rebeldes/Resistência — Amigáveis para com os cidadãos e os aliados do jogador. No entanto, os zumbis e a combine são agressivamente hostis a você." },
       ["pt-pt"] = { name = "Resistência", desc = "Rebeldes/Resistência — Amigáveis para com os cidadãos e os aliados do jogador. No entanto, os zombies e a combine são agressivamente hostis para consigo." },
        bg = { name = "Съпротива", desc = "Съпротива — Дружелюбни към цивилни и съюзници на играча; зомбита и комбайни са настроени враждебно." },
        pl = { name = "Opór", desc = "Rebelianci/Ruch oporu — Przyjazne dla obywateli i sojuszników gracza. Jednak zombi i combine są agresywnie wrogi do Ciebie." }
    },
    ["zombies"] = {
        en = { name = "Zombies", desc = "Zombies and headcrabs — They are aggressive towards everyone except other undead." },
        ru = { name = "Зомби", desc = "Зомби и хедкрабы — Агрессивны ко всем, кроме других неживых." },
        uk = { name = "Зомбі", desc = "Зомбі та хедкраби — Агресивні до всіх, крім інших неживих." },
        de = { name = "Zombies", desc = "Zombies und Headcrabs – Sie verhalten sich gegenüber allen aggressiv, außer gegenüber anderen Untoten." },
        tr = { name = "Zombiler", desc = "Zombiler ve kafa böcekleri — Diğer ölümsüzler hariç herkese karşı saldırgandırlar." },
       ["es-es"] = { name = "Zombis", desc = "Zombis y cangrejos cabezudos: son agresivos con todo el mundo excepto con otros muertos vivientes." },
       ["pt-br"] = { name = "Zumbis", desc = "Zumbis e headcrabs — Eles são agressivos com todos, exceto com outros mortos-vivos." },
       ["pt-pt"] = { name = "Zumbis", desc = "Zumbis e headcrabs — São agressivos com todos, exceto com outros mortos-vivos." },
        bg = { name = "Зомби", desc = "Зомби и хедкраби — Агресивни към всички, освен към другите неживи." },
        pl = { name = "Zombi", desc = "Zombi i headcraby — Są agresywne wobec wszystkich, z wyjątkiem innych nieumarłych." }
    },
    ["antlions"] = {
        en = { name = "Antlions", desc = "Antlions — They are aggressive towards everyone except their antlions." },
        ru = { name = "Муравьиные Львы", desc = "Муравьиные Львы — Агрессивны ко всем, кроме своих собратьев." },
        uk = { name = "Мурашині Леви", desc = "Мурашині Леви — Агресивні до всіх, крім своїх побратимів." },
        de = { name = "Ameisenlöwen", desc = "Ameisenlöwen — Sie verhalten sich gegenüber allen aggressiv, außer gegenüber ihren Ameisenlöwen." },
        tr = { name = "Karınca aslanları", desc = "Karınca aslanları — Karınca aslanları hariç herkese karşı saldırganlar." },
       ["es-es"] = { name = "Hormigas león", desc = "Hormigas león: son agresivos con todos excepto con sus antlions." },
       ["pt-br"] = { name = "Formigas-leão", desc = "Formigas-leão — São agressivas com todos, exceto com outras formigas-leão." },
       ["pt-pt"] = { name = "Formigas-leão", desc = "Formigas-leão — São agressivas com todos, exceto com outras formigas-leão." },
        bg = { name = "Муравьиные Львы", desc = "Муравьиные Львы — Агрессивни към всички, освен към другите неживи." },
        pl = { name = "Murowieczniki", desc = "Murowieczniki — Są agresywne wobec wszystkich, z wyjątkiem innych murowieczników." }
    },
    ["hecu"] = {
        en = { name = "H.E.C.U", desc = "H.E.C.U — The soldiers from this subdivision and military are friendly to you, but you are enemies for everyone, for rebels, for the combine, for zombies, etc. You need have Half-Life Source or Half-Life Resurgence." },
        ru = { name = "H.E.C.U", desc = "H.E.C.U — Cолдаты этой группы дружелюбны к вам и военные, но вы враждебны для большинства других фракций. Требуется Half-Life Source или Half-Life Resurgence." },
        uk = { name = "H.E.C.U", desc = "H.E.C.U — Солдати цієї групи доброзичливі до вас і військових, але ви ворожі до більшості інших фракцій. Потрібна Half-Life Source або Half-Life Resurgence." },
        de = { name = "H.E.C.U", desc = "H.E.C.U — Die Soldaten dieser Unterabteilung und des Militärs sind Ihnen gegenüber freundlich gesinnt, aber Sie sind Feinde für alle anderen, für Rebellen, für die Combine, für Zombies usw. Sie benötigen Half-Life Source oder Half-Life Resurgence." },
        tr = { name = "H.E.C.U", desc = "H.E.C.U — Bu alt bölüm ve ordudaki askerler size dosttur, ama siz herkes için düşmansınız, isyancılar, şirket, zombiler, vs. için. Half-Life Source veya Half-Life Resurgence'a ihtiyacınız var." },
       ["es-es"] = { name = "H.E.C.U", desc = "H.E.C.U — Los soldados de esta subdivisión y del ejército son amigables contigo, pero tú eres enemigo de todos: de los rebeldes, de la combine, de los zombis, etc. Necesitas tener Half-Life Source o Half-Life Resurgence." },
       ["pt-br"] = { name = "H.E.C.U", desc = "H.E.C.U — Os soldados desta subdivisão e militares são amigáveis com você, mas você é inimigo de todos, dos rebeldes, da combine, dos zumbis, etc. Você precisa ter o Half-Life Source ou o Half-Life Resurgence." },
       ["pt-pt"] = { name = "H.E.C.U", desc = "H.E.C.U — Os soldados desta subdivisão e militares são amigáveis para consigo, mas são inimigos de todos, dos rebeldes, da combine, dos zombies, etc. É necessário ter o Half-Life Source ou o Half-Life Resurgence." },
        bg = { name = "H.E.C.U", desc = "H.E.C.U — Войниците от тази група са приятелски настроени към вас и военните, но вие сте враждебни към повечето други фракции. Необходими са Half-Life Source или Half-Life Resurgence." },
        pl = { name = "H.E.C.U", desc = "H.E.C.U — Żołnierze tej grupy są przyjaźnie nastawieni do ciebie i wojska, ale wrogo nastawieni do większości innych frakcji. Wymagana jest gra Half-Life Source lub Half-Life Resurgence." }
    },
    ["xen"] = {
        en = { name = "XEN", desc = "XEN — They are aggressive towards everyone except, of course, the creatures from XEN. You need have Half-Life Source or Half-Life Resurgence." },
        ru = { name = "ЗЕН", desc = "ЗЕН — Агрессивны ко всем, кроме существ из ЗЕН. Требуется Half-Life Source или Half-Life Resurgence." },
        uk = { name = "ЗЕН", desc = "ЗЕН — Агресивні до всіх, крім істот з ЗЕН. Потрібна Half-Life Source або Half-Life Resurgence." },
        de = { name = "XEN", desc = "XEN — Sie verhalten sich gegenüber allen aggressiv, außer natürlich gegenüber den Kreaturen aus XEN. Sie benötigen Half-Life Source oder Half-Life Resurgence." },
        tr = { name = "XEN", desc = "XEN — XEN'den gelen yaratıklar hariç herkese karşı saldırganlar. Half-Life Source veya Half-Life Resurgence'a ihtiyacınız var." },
       ["es-es"] = { name = "XEN", desc = "XEN — Son agresivos con todo el mundo, excepto, por supuesto, con las criaturas de XEN. Necesitas tener Half-Life Source o Half-Life Resurgence." },
       ["pt-br"] = { name = "XEN", desc = "XEN — Eles são agressivos com todos, exceto, é claro, com as criaturas de XEN. Você precisa ter o Half-Life Source ou o Half-Life Resurgence." },
       ["pt-pt"] = { name = "XEN", desc = "XEN — Eles são agressivos com todos, exceto, é claro, com as criaturas de XEN. É necessário ter o Half-Life Source ou o Half-Life Resurgence." },
        bg = { name = "ЗЕН", desc = "ЗЕН — Агресивни към всички, освен към съществата от ЗЕН. Необходими са Half-Life Source или Half-Life Resurgence." },
        pl = { name = "XEN", desc = "XEN — Żołnierze tej grupy są przyjaźnie nastawieni do ciebie i wojska, ale wrogo nastawieni do większości innych frakcji. Wymagana jest gra Half-Life Source lub Half-Life Resurgence." }
    },
    ["race_x"] = {
        en = { name = "Race X", desc = "Race X — They are aggressive towards everyone except, of course, the creatures from Race X. You need have Half-Life Resurgence." },
        ru = { name = "Раса X", desc = "Раса X — Агрессивны ко всем, кроме существ из Раса X. Требуется Half-Life Resurgence." },
        uk = { name = "Раса X", desc = "Раса X — Агресивні до всіх, крім істот з Раси X. Потрібен Half-Life Resurgence." },
        de = { name = "Race X", desc = "Race X — Sie sind aggressiv gegenüber allen außer natürlich den Kreaturen der Race X. Sie benötigen Half-Life Resurgence." },
        tr = { name = "Race X", desc = "Race X — Race X ırkından yaratıklar hariç herkese karşı saldırganlar. Half-Life Resurgence'a ihtiyacınız var." },
       ["es-es"] = { name = "Race X", desc = "Race X: son agresivos con todo el mundo, excepto, por supuesto, con las criaturas de la Race X. Necesitas tener Half-Life Resurgence." },
       ["pt-br"] = { name = "Race X", desc = "Race X — Eles são agressivos com todos, exceto, é claro, com as criaturas da Race X. Você precisa ter Half-Life Resurgence." },
       ["pt-pt"] = { name = "Race X", desc = "Race X — Eles são agressivos com todos, exceto, é claro, com as criaturas da Raça X. É necessário ter o Half-Life Resurgence." },
        bg = { name = "Раса X", desc = "Раса X — Агресивни към всички, освен към съществата от Раса X. Необходими са Half-Life Resurgence." },
        pl = { name = "Race X", desc = "Race X — Żołnierze tej grupy są przyjaźnie nastawieni do ciebie i wojska, ale wrogo nastawieni do większości innych frakcji. Wymagana jest gra Half-Life Resurgence." }
    },
    ["blackops"] = {
        en = { name = "Black Operations", desc = "Black Operations — The assassins from this subdivision are friendly to you, but you are enemies for everyone, for rebels, for the combine, for zombies, etc. You need have Half-Life Resurgence." },
        ru = { name = "Черные Оперативники", desc = "Черные Оперативники — Ассассины этой группы дружелюбны к вам, но вы враждебны для многих других фракций. Требуется Half-Life Resurgence." },
        uk = { name = "Чорні Оперативники", desc = "Чорні Оперативники — Асасини цієї групи доброзичливі до вас, але ви ворожі для багатьох інших фракцій. Потрібен Half-Life Resurgence." },
        de = { name = "Geheime Operationen", desc = "Geheime Operationen — Die Attentäter aus diesem Unterbezirk sind Ihnen gegenüber freundlich gesinnt, aber Sie sind Feinde für alle anderen, für Rebellen, für die Combine, für Zombies usw. Sie benötigen Half-Life Resurgence." },
        tr = { name = "Siyah Operasyonlar", desc = "Siyah Operasyonlar — Bu altbölümden suikastçılar size dosttur, ama siz herkes için düşmansınız, isyancılar için, şirket için, zombiler için, vs. Half-Life Resurgence'a ihtiyacınız var." },
       ["es-es"] = { name = "Operaciones Encubiertas", desc = "Operaciones Encubiertas: los asesinos de esta subdivisión son amigos tuyos, pero tú eres enemigo de todos: rebeldes, la Alianza, zombis, etc. Necesitas tener Half-Life Resurgence." },
       ["pt-br"] = { name = "Operações Secretas", desc = "Operações Secretas — Os assassinos desta subdivisão são seus aliados, mas você é inimigo de todos: rebeldes, da Combine, dos zumbis, etc. Você precisa ter o Half-Life Resurgence." },
       ["pt-pt"] = { name = "Operações Secretas", desc = "Operações Secretas — Os assassinos desta subdivisão são seus aliados, mas você é inimigo de todos: rebeldes, da aliança, dos zombies, etc. É necessário ter o Half-Life Resurgence." },
        bg = { name = "Черни Оперативници", desc = "Черни Оперативници — Ассасини на тази група са дружелюбни към вас, но вие сте враждебни към всички останали. Необходимо е Half-Life Resurgence." },
        pl = { name = "Czarne Operacje", desc = "Czarne Operacje — Żołnierze tej grupy są przyjaźnie nastawieni do ciebie i wojska, ale wrogo nastawieni do większości innych frakcji. Wymagana jest gra Half-Life Resurgence." }
    },
    ["aperture"] = {
        en = { name = "Aperture Science", desc = "Aperture Science — The turrets and some devices from this organization are friendly towards you, but you are hostile towards everyone else. You need have Portal." },
        ru = { name = "Aperture Science", desc = "Aperture Science — Туррели и некоторые устройства из этой организации относятся к вам дружелюбно, но вы враждебны ко всем остальным. Требуется Portal." },
        uk = { name = "Aperture Science", desc = "Aperture Science — Туррелі та деякі пристрої з цієї організації ставляться до вас дружньо, але ви вороже налаштовані до всіх інших. Потрібен Portal" },
        de = { name = "Aperture Science", desc = "Aperture Science – Die Geschütztürme und einige Geräte dieser Organisation sind Ihnen gegenüber freundlich gesinnt, aber Sie stehen allen anderen feindselig gegenüber. Sie benötigen Portal." },
        tr = { name = "Aperture Science", desc = "Aperture Science — Bu organizasyondan taretler ve bazı cihazlar size dosttur, ama siz herkese düşmansınız.  Portal’a ihtiyacınız var." },
       ["es-es"] = { name = "Aperture Science", desc = "Aperture Science: las torretas y algunos dispositivos de esta organización son amistosos contigo, pero tú eres hostil con todos los demás. Necesitas tener Portal." },
       ["pt-br"] = { name = "Aperture Science", desc = "Aperture Science — As torres e alguns dispositivos desta organização são amigáveis para você, mas você é hostil para com todos os outros. Você precisa ter o Portal." },
       ["pt-pt"] = { name = "Aperture Science", desc = "Aperture Science — As torres e alguns dispositivos desta organização são amigáveis para consigo, mas você é hostil para com todos os outros. É necessário ter o Portal." },
        bg = { name = "Aperture Science", desc = "Aperture Science — Туррели и някои устройства от тази организация са приятелски настроени към вас, но вие сте враждебни към всички останали. Необходим е Портал." },
        pl = { name = "Aperture Science", desc = "Aperture Science — Turrelowie i niektóre urządzenia z tej organizacji są wobec ciebie przyjaźnie nastawione, ale ty jesteś wrogo nastawiony do wszystkich pozostałych. Wymagany jest Portal." }
    }
}

local function PBCR_GetLangForPlayer(ply)
    local code = "en"

    local raw = ""
    if SERVER then
        if IsValid(ply) then raw = ply:GetInfo("gmod_language") or "" else raw = "" end
    else
        raw = GetConVarString("gmod_language") or ""
    end

    raw = string.lower(raw or "")
    if #raw >= 2 then
        local prefix = raw:sub(1,2)
        if PBCR_Lang[prefix] then
            code = prefix
        else
            for k,_ in pairs(PBCR_Lang) do
                if raw:find(k, 1, true) then
                    code = k
                    break
                end
            end
        end
    end

    return code
end

local function PBCR_Text(key, ply, ...)
    local lang = "en"
    if ply then
        lang = PBCR_GetLangForPlayer(ply)
    else
        if CLIENT then
            lang = PBCR_GetLangForPlayer(nil)
        else
            lang = "en"
        end
    end

    local t = (PBCR_Lang[lang] and PBCR_Lang[lang][key]) or (PBCR_Lang["en"] and PBCR_Lang["en"][key]) or ""
    if ... and select("#", ...) > 0 then
        return string.format(t, ...)
    end
    return t
end

local function PBCR_GetFactionText(factionID, key, ply)
    local lang = PBCR_GetLangForPlayer(ply)
    local f = PBCR_FactionLocales[factionID]
    if f and f[lang] and f[lang][key] then return f[lang][key] end
    if f and f["en"] and f["en"][key] then return f["en"][key] end
    if PBCR_Factions[factionID] and PBCR_Factions[factionID][key] then return PBCR_Factions[factionID][key] end
    return ""
end

local function PBCR_ApplyNoTarget(ply, faction)
    if not IsValid(ply) or not SERVER then return end
    if ply.SetNoTarget and type(ply.SetNoTarget) == "function" then
        ply:SetNoTarget(faction == "neutral")
    end
end

local function PBCR_ApplyZBaseFaction(ply, faction)
    if not IsValid(ply) or not SERVER then return end
    local zf = PBCR_ZBaseFactionMap[faction]

    if zf and ZBaseSetFaction and isfunction(ZBaseSetFaction) then
        pcall(function() ZBaseSetFaction(ply, zf) end)
    end
end

local function PBCR_ApplyVJBaseFaction(ply, faction)
    if not IsValid(ply) or not SERVER then return end
    local vjclass = PBCR_VJClassMap[faction] or "CLASS_PLAYER_ALLY"
    ply.VJ_NPC_Class = { vjclass }
end

local function PBCR_RestoreVJBaseFaction(ply)
    if not IsValid(ply) then return end
    if not SERVER then return end

    if ply.OwnerOldVJClass ~= nil then
        local ok, err = pcall(function()
            ply.VJ_NPC_Class = table.Copy(ply.OwnerOldVJClass)
            ply.OwnerOldVJClass = nil
        end)
        if not ok then
            ErrorNoHalt("RestoreVJBaseFaction: failed: "..tostring(err).."\n")
        end
    end
end

function PBCR_UpdateNPCRelationships(ply, faction)
    if not IsValid(ply) or not SERVER then return end
    faction = faction or "default"
    local factionData = PBCR_Factions[faction]

    for _, npc in ipairs(ents.GetAll()) do
        if not IsValid(npc) or not npc:IsNPC() then goto cont end

        if not npc.IsVJBaseSNPC and not npc.IsZBaseNPC then
            if not npc.AddEntityRelationship or not isfunction(npc.AddEntityRelationship) then goto cont end

            local npcClass = npc.Classify and npc:Classify()

            if factionData and factionData.friendClasses then
                for _, class in ipairs(factionData.friendClasses) do
                    if npcClass == class then
                        npc:AddEntityRelationship(ply, D_LI, 99)
                        goto cont
                    end
                end
            end

            if factionData and factionData.neutralClasses then
                for _, class in ipairs(factionData.neutralClasses) do
                    if npcClass == class then
                        npc:AddEntityRelationship(ply, D_NU, 99)
                        goto cont
                    end
                end
            end

            if factionData and not factionData.useDefaultRelations then
                npc:AddEntityRelationship(ply, D_HT, 99)
            end
        end

        ::cont::
    end
end

function PBCR_SyncHelixCharacterFaction(ply)
    if not SERVER or not IsValid(ply) or not ply:IsPlayer() then return end
    
    local char = ply.GetCharacter and ply:GetCharacter()
    if not char then return end

    local charName = char:GetName()
    local targetFaction = "default"

    if char.IsCIS and char:IsCIS() then
        targetFaction = "cis"
    else
        targetFaction = PBCR_PlayerFactions[ply:SteamID()] or PBCR_PlayerFactions[charName] or "default"
    end

    ply:SetNWString("PBCR_Faction", targetFaction)

    local vjclass = PBCR_VJClassMap[targetFaction] or CLASS_PLAYER_ALLY
    ply.VJ_NPC_Class = { vjclass }

    PBCR_ApplyZBaseFaction(ply, targetFaction)
    PBCR_UpdateNPCRelationships(ply, targetFaction)
    PBCR_ApplyNoTarget(ply, targetFaction)
end

if SERVER then
    hook.Add("Initialize", "PBCR_LoadFactionsOnStart", function()
        LoadFactions()

timer.Create("PBCR_RelationshipSyncLoop", 0.5, 0, function()
        local players = player.GetAll()
        for i = 1, #players do
            local ply = players[i]
            if IsValid(ply) and ply:Alive() then
                pcall(PBCR_SyncHelixCharacterFaction, ply)
            end
        end
    end)
    end)

    hook.Add("PlayerLoadedCharacter", "PBCR_HelixSyncOnLoad", function(ply, character, currentChar)
        PBCR_SyncHelixCharacterFaction(ply)
    end)

    hook.Add("VJ_PlayerServerInit", "PBCR_InstantVJOverride", function(ply)
        PBCR_SyncHelixCharacterFaction(ply)
    end)

    hook.Add("PlayerSpawn", "PBCR_InstantSpawnOverride", function(ply)
        PBCR_SyncHelixCharacterFaction(ply)
    end)

    hook.Add("PlayerInitialSpawn", "PBCR_InstantInitialSpawnOverride", function(ply)
        PBCR_SyncHelixCharacterFaction(ply)
    end)

    net.Receive("pbcr_request_setfaction", function(len, ply)
        if not IsValid(ply) or not ply:IsSuperAdmin() then return end

        local faction = (net.ReadString() or ""):lower()
        local char = ply:GetCharacter()
        if not char then return end

        if (char.IsCIS and char:IsCIS()) then return end
        if faction == "" or not PBCR_Factions[faction] then return end

        local charName = char:GetName()
        PBCR_PlayerFactions[charName] = faction
        SaveFactions()

        PBCR_SyncHelixCharacterFaction(ply)
    end)
end

if CLIENT then
    local origAddCreationTab = spawnmenu.AddCreationTab
    function spawnmenu.AddCreationTab(name, pnl, icon, material, tooltip)
        if name and (name:lower() == "factions" or name:find("PBCR") or name:lower() == "pbcr_menu") then
            return 
        end
        return origAddCreationTab(name, pnl, icon, material, tooltip)
    end

    local origAddOption = spawnmenu.AddToolMenuOption
    function spawnmenu.AddToolMenuOption(tab, category, option, name, ...)
        if category and (category:lower() == "factions" or category:find("PBCR")) then
            return 
        end
        if option and (option:lower() == "factions" or option:find("pbcr")) then
            return
        end
        return origAddOption(tab, category, option, name, ...)
    end

    hook.Add("PopulateToolMenu", "PBCR_KillFactionsUI", function()
        timer.Simple(0, function()
            local creationTabs = spawnmenu.GetCreationTabs()
            if creationTabs then
                for tabName, _ in pairs(creationTabs) do
                    if tabName:lower() == "factions" or tabName:find("PBCR") or tabName == "PBCR_Menu" then
                        creationTabs[tabName] = nil
                    end
                end
            end

            local toolMenu = spawnmenu.GetToolMenu()
            if toolMenu then
                for _, categories in pairs(toolMenu) do
                    if categories["Factions"] then categories["Factions"] = nil end
                    if categories["factions"] then categories["factions"] = nil end
                    if categories["PBCR_Category"] then categories["PBCR_Category"] = nil end
                end
            end
        end)
    end)
end

local function PBCR_ApplyRelationshipToNPCForPlayer(npc, ply)
    if not IsValid(npc) or not npc:IsNPC() then return end
    if not IsValid(ply) or not ply:IsPlayer() then return end
    if not SERVER then return end
    if npc.IsVJBaseSNPC then return end
    if npc.IsZBaseNPC then return end

    if not npc.AddEntityRelationship or not isfunction(npc.AddEntityRelationship) then return end

    local faction = PBCR_PlayerFactions[ply:SteamID()] or "none"
    local factionData = PBCR_Factions[faction]

    local npcClass = nil
    if npc.Classify and type(npc.Classify) == "function" then
        npcClass = npc:Classify()
    end

    if factionData and factionData.friendClasses then
        for _, class in ipairs(factionData.friendClasses) do
            if npcClass == class then
                npc:AddEntityRelationship(ply, D_LI)
                return
            end
        end
    end

    if factionData and factionData.neutralClasses then
        for _, class in ipairs(factionData.neutralClasses) do
            if npcClass == class then
                npc:AddEntityRelationship(ply, D_NU)
                return
            end
        end
    end

    if factionData and not factionData.useDefaultRelations then
        npc:AddEntityRelationship(ply, D_HT)
    end
end


local function PBCR_IsNPCFriendlyToPlayer(npc, ply)
    if not IsValid(npc) or not npc:IsNPC() then return false end
    if not IsValid(ply) or not ply:IsPlayer() then return false end

    if npc.Disposition and type(npc.Disposition) == "function" then
        local ok, disp = pcall(function()
            return npc:Disposition(ply)
        end)
        if ok and disp ~= nil then
            return disp == D_LI
        end
    end

    local sid = ply:SteamID()
    local faction = PBCR_PlayerFactions[sid] or "none"
    local factionData = PBCR_Factions[faction]
    if not factionData or factionData.useDefaultRelations then return false end

    return PBCR_NPCMatchesFactionClasses(npc, factionData.friendClasses)
end

local function PBCR_SetFactionAndNotify(ply, faction, notifyKey)
    if not IsValid(ply) or not ply:IsPlayer() then return end
    if not PBCR_Factions[faction] then return end

    PBCR_PlayerFactions[ply:SteamID()] = faction
    ply:SetNWString("PBCR_Faction", faction)
    SaveFactions()

    timer.Simple(0, function()
        if not IsValid(ply) then return end
        PBCR_ApplyZBaseFaction(ply)
        PBCR_ApplyVJBaseFaction(ply)
        PBCR_UpdateNPCRelationships(ply)
        PBCR_ApplyNoTarget(ply)
    end)

    if notifyKey then
        local nameLocalized = PBCR_GetFactionText(faction, "name", ply) or PBCR_Factions[faction].name
        net.Start("pbcr_notify")
        net.WriteString(PBCR_Text(notifyKey, ply, nameLocalized))
        net.WriteString("success")
        net.WriteFloat(4)
        net.Send(ply)
    end
end

local function PBCR_SetFactionForPlayer(ply, faction)
    if not IsValid(ply) or not ply:IsPlayer() then return end
    if not PBCR_Factions[faction] then return end

    PBCR_PlayerFactions[ply:SteamID()] = faction
    ply:SetNWString("PBCR_Faction", faction)
    SaveFactions()

    timer.Simple(0, function()
        if not IsValid(ply) then return end
        PBCR_ApplyZBaseFaction(ply)
        PBCR_ApplyVJBaseFaction(ply)
        PBCR_UpdateNPCRelationships(ply)
        PBCR_ApplyNoTarget(ply)
    end)
end

if SERVER then

    local pbcr_flags = bit.bor(FCVAR_ARCHIVE, FCVAR_REPLICATED, FCVAR_NOTIFY)

    util.AddNetworkString("pbcr_request_setfaction")
    util.AddNetworkString("pbcr_notify")

    CreateConVar("pbcr_admin_only", "1", pbcr_flags)

local ReapplyCooldown = {}

local PBCR_ForcefieldClasses = {
    ["func_forcefield"] = true,
    ["forcefield_new"] = true,
    ["campaignents_forcefield_new"] = true,
    ["combine_shieldwall"] = true,
    ["combine_shieldwall_static"] = true,
}

local PBCR_NoTargetNextThink = 0
local PBCR_NoTargetThinkInterval = 0

    hook.Add("Initialize", "PBCR_LoadFactionsOnStart", function()
        LoadFactions()
    end)

    net.Receive("pbcr_request_setfaction", function(len, ply)
    local faction = (net.ReadString() or ""):lower()

    if not IsValid(ply) then return end

    local adminOnlyCV = GetConVar("pbcr_admin_only")
    if adminOnlyCV and adminOnlyCV:GetBool() then
        if not ply:IsAdmin() and not ply:IsSuperAdmin() then
            net.Start("pbcr_notify")
            net.WriteString(PBCR_Text("admin_only_faction_change", ply))
            net.WriteString("error")
            net.WriteFloat(4)
            net.Send(ply)
            return
        end
    end

    if faction == "" then
        net.Start("pbcr_notify")
        net.WriteString(PBCR_Text("missing_faction", ply))
        net.WriteString("error")
        net.WriteFloat(4)
        net.Send(ply)
        return
    end

    if not PBCR_Factions[faction] then
        net.Start("pbcr_notify")
        net.WriteString(PBCR_Text("unknown_faction", ply, faction))
        net.WriteString("error")
        net.WriteFloat(4)
        net.Send(ply)
        return
    end

    PBCR_SetFactionAndNotify(ply, faction, "faction_changed")
end)

    concommand.Add("pbcr_setfaction", function(ply, cmd, args)
    if IsValid(ply) then
        local adminOnlyCV = GetConVar("pbcr_admin_only")
        if adminOnlyCV and adminOnlyCV:GetBool() then
            if not ply:IsAdmin() and not ply:IsSuperAdmin() then
                net.Start("pbcr_notify")
                net.WriteString(PBCR_Text("admin_only_faction_change", ply))
                net.WriteString("error")
                net.WriteFloat(4)
                net.Send(ply)
                return
            end
        end

        if not args[1] then
            net.Start("pbcr_notify")
            net.WriteString(PBCR_Text("usage_setfaction", ply))
            net.WriteString("hint")
            net.WriteFloat(6)
            net.Send(ply)
            return
        end

        local faction = args[1]:lower()
        if not PBCR_Factions[faction] then
            net.Start("pbcr_notify")
            net.WriteString(PBCR_Text("error_unknown_faction", ply))
            net.WriteString("error")
            net.WriteFloat(4)
            net.Send(ply)
            return
        end

        PBCR_SetFactionAndNotify(ply, faction, "faction_changed")
    else
        if not args[1] or not args[2] then
            print(PBCR_Text("usage_server_console"))
            return
        end

        local sid = args[1]
        local faction = args[2]:lower()
        if not PBCR_Factions[faction] then
            print(PBCR_Text("error_unknown_faction"))
            return
        end

        PBCR_PlayerFactions[sid] = faction
        SaveFactions()

        for _, online in ipairs(player.GetAll()) do
            if IsValid(online) and online:SteamID() == sid then
                PBCR_ApplyZBaseFaction(online)
                PBCR_ApplyVJBaseFaction(online)
                PBCR_UpdateNPCRelationships(online)
                PBCR_ApplyNoTarget(online)
                break
            end
        end

        print(string.format(PBCR_Text("faction_set_for_sid"), sid, PBCR_Factions[faction].name))
    end
end)

concommand.Add("pbcr_reload_relations", function(ply, cmd, args)
        if IsValid(ply) and not ply:IsSuperAdmin() then
            ply:PrintMessage(HUD_PRINTCONSOLE, "[PBCR] Access denied. SuperAdmin required.")
            return
        end

        LoadFactions()

        for _, p in ipairs(player.GetAll()) do
            if IsValid(p) then
                PBCR_SyncHelixCharacterFaction(p)
            end
        end

        local msg = "[PBCR] All player and NPC faction relationships have been reloaded and reapplied."
        if IsValid(ply) then
            ply:PrintMessage(HUD_PRINTCONSOLE, msg)
        else
            print(msg)
        end
    end)

concommand.Add("pbcr_setfaction_to_player", function(ply, cmd, args)
     if IsValid(ply) then
        if not ply:IsAdmin() and not ply:IsSuperAdmin() then
            return
        end
    end

    if not args[1] or not args[2] then
        local usageMsg = PBCR_Text("usage_setfaction_to_player", ply)
        if IsValid(ply) then
            net.Start("pbcr_notify")
            net.WriteString(usageMsg)
            net.WriteString("hint")
            net.WriteFloat(6)
            net.Send(ply)
        else
            print(usageMsg)
        end
        return
    end

    local targetIdentifier = args[1]
    local faction = args[2]:lower()

    if not PBCR_Factions[faction] then
        local errorMsg = PBCR_Text("error_unknown_faction", ply)
        if IsValid(ply) then
            net.Start("pbcr_notify")
            net.WriteString(errorMsg)
            net.WriteString("error")
            net.WriteFloat(4)
            net.Send(ply)
        else
            print(errorMsg)
        end
        return
    end

    local nameLocalized = PBCR_GetFactionText(faction, "name", ply) or PBCR_Factions[faction].name

    local targetPly = nil
    local foundPlayers = {}

    if string.find(targetIdentifier, "STEAM_") or string.find(targetIdentifier, "^7656") then
        for _, p in ipairs(player.GetAll()) do
            if p:SteamID() == targetIdentifier or p:SteamID64() == targetIdentifier then
                targetPly = p
                break
            end
        end
        
        if not targetPly then
            if not PBCR_PlayerFactions[targetIdentifier] then
                local notFoundMsg = string.format(PBCR_Text("steamid_not_found", ply), targetIdentifier)
                if IsValid(ply) then
                    net.Start("pbcr_notify")
                    net.WriteString(notFoundMsg)
                    net.WriteString("error")
                    net.WriteFloat(4)
                    net.Send(ply)
                else
                    print(notFoundMsg)
                end
                return
            end
            
            PBCR_PlayerFactions[targetIdentifier] = faction
            SaveFactions()
            
            for _, p in ipairs(player.GetAll()) do
                if p:SteamID() == targetIdentifier or p:SteamID64() == targetIdentifier then
                    PBCR_ApplyZBaseFaction(p)
                    PBCR_ApplyVJBaseFaction(p)
                    PBCR_UpdateNPCRelationships(p)
                    PBCR_ApplyNoTarget(p)
                    targetPly = p
                    break
                end
            end
            
            local successMsg = string.format(PBCR_Text("faction_set_for_player", ply), targetIdentifier, nameLocalized)
            if IsValid(ply) then
                net.Start("pbcr_notify")
                net.WriteString(successMsg)
                net.WriteString("success")
                net.WriteFloat(4)
                net.Send(ply)
            else
                print(successMsg)
            end
            return
        end
    else
        local searchLower = targetIdentifier:lower()
        for _, p in ipairs(player.GetAll()) do
            if p:Nick():lower():find(searchLower, 1, true) then
                table.insert(foundPlayers, p)
            end
        end
        
        if #foundPlayers == 0 then
            local notFoundMsg = string.format(PBCR_Text("player_not_found", ply), targetIdentifier)
            if IsValid(ply) then
                net.Start("pbcr_notify")
                net.WriteString(notFoundMsg)
                net.WriteString("error")
                net.WriteFloat(4)
                net.Send(ply)
            else
                print(notFoundMsg)
            end
            return
        elseif #foundPlayers > 1 then
            local multipleMsg = string.format(PBCR_Text("multiple_players_found", ply), targetIdentifier)
            if IsValid(ply) then
                net.Start("pbcr_notify")
                net.WriteString(multipleMsg)
                net.WriteString("error")
                net.WriteFloat(4)
                net.Send(ply)
            else
                print(multipleMsg)
            end
            return
        else
            targetPly = foundPlayers[1]
        end
    end

    if IsValid(targetPly) then
        PBCR_SetFactionForPlayer(targetPly, faction)

        local successMsg = string.format(PBCR_Text("faction_set_for_player", ply), targetPly:Nick(), nameLocalized)
        
        if IsValid(ply) then
            net.Start("pbcr_notify")
            net.WriteString(successMsg)
            net.WriteString("success")
            net.WriteFloat(4)
            net.Send(ply)

            local targetNotify = string.format(PBCR_Text("faction_changed", targetPly), nameLocalized)
            net.Start("pbcr_notify")
            net.WriteString(targetNotify)
            net.WriteString("success")
            net.WriteFloat(4)
            net.Send(targetPly)
        else
            print(successMsg)
        end
    end
end)

    hook.Add("PlayerInitialSpawn", "PBCR_ApplySavedFactionOnJoin", function(ply)
    timer.Simple(1, function()
        if IsValid(ply) and PBCR_PlayerFactions[ply:SteamID()] then
            local faction = PBCR_PlayerFactions[ply:SteamID()]
            
            PBCR_UpdateNPCRelationships(ply)
            PBCR_ApplyNoTarget(ply)
            
            if faction != "default" then
                PBCR_ApplyVJBaseFaction(ply)
            end
            
        end
    end)

    timer.Simple(5, function()
        if IsValid(ply) and PBCR_PlayerFactions[ply:SteamID()] then
            local faction = PBCR_PlayerFactions[ply:SteamID()]
            PBCR_ApplyNoTarget(ply)
            
            if faction != "default" then
                PBCR_ApplyZBaseFaction(ply)
            end
            
        end
    end)
end)

    hook.Add("Think", "PBCR_NoTarget_Think", function()
        if CurTime() < PBCR_NoTargetNextThink then return end
        PBCR_NoTargetNextThink = CurTime() + PBCR_NoTargetThinkInterval

        for _, ply in ipairs(player.GetAll()) do
            if not IsValid(ply) then goto cont end

            local sid = ply:SteamID()
            local faction = PBCR_PlayerFactions[sid] or "none"
            local factionData = PBCR_Factions[faction]

        if faction == "neutral" then
            PBCR_ApplyNoTarget(ply)
        end

            ::cont::
        end
    end)

    hook.Add("ShouldCollide", "PBCR_ForcefieldPass_PBCR", function(ent1, ent2)
    local ply, other = nil, nil

    if IsValid(ent1) and ent1:IsPlayer() then ply, other = ent1, ent2 end
    if not ply and IsValid(ent2) and ent2:IsPlayer() then ply, other = ent2, ent1 end
    if not ply or not IsValid(other) then return end

    local otherClass = ""
    if other.GetClass and isfunction(other.GetClass) then
        otherClass = tostring(other:GetClass()):lower()
    end
    if otherClass == "" then return end

    if PBCR_ForcefieldClasses[otherClass] then
        local sid = ply:SteamID()
        local faction = PBCR_PlayerFactions[sid] or "none"

        if faction == "combine" then
            return false
        end
    end
end)

    hook.Add("OnEntityCreated", "PBCR_CheckNewNPCRelationship", function(ent)
        timer.Simple(0.0, function()
            if not IsValid(ent) or not ent:IsNPC() then return end

             for _, ply in ipairs(player.GetAll()) do
             if IsValid(ply) and PBCR_PlayerFactions[ply:SteamID()] then
                PBCR_ApplyRelationshipToNPCForPlayer(ent, ply)
              end
           end
       end)
   end)
end

if CLIENT then
local PBCR_NotifySounds = {
    success = {
        "buttons/button14.wav",
        "buttons/button3.wav",
        "buttons/button9.wav",
        "buttons/blip1.wav",
        "friends/friend_join.wav",
    },
    error = {
        "buttons/button2.wav",
        "buttons/button8.wav",
        "buttons/button10.wav",
    },
    hint = {
        "ambient/water/drip1.wav",
        "ambient/water/drip2.wav",
        "ambient/water/drip3.wav",
    }
}

CreateClientConVar("pbcr_notify", "1", true, false)

  /*

 hook.Add("PopulateToolMenu", "PBCR_AddFactionMenuTab", function()
        spawnmenu.AddToolTab("PBCR_Factions_Tab", PBCR_Text("tab_factions", LocalPlayer()), "icon16_relations/pbcr.png")
        spawnmenu.AddToolMenuOption("PBCR_Factions_Tab", PBCR_Text("menu_npc_control", LocalPlayer()), "FactionMenu", PBCR_Text("menu_npc_control", LocalPlayer()), "", "", function(panel)
            panel:ClearControls()
            panel:AddControl("Header", {Text = PBCR_Text("choose_faction", LocalPlayer()), Description = PBCR_Text("choose_desc", LocalPlayer())})

            for factionID, factionData in SortedPairs(PBCR_Factions) do
                local btn = vgui.Create("DButton")
                btn:SetText(PBCR_GetFactionText(factionID, "name", LocalPlayer()))
                btn:SetIcon(factionData.icon)
                btn:SetTall(22)
                btn.DoClick = function()
                    net.Start("pbcr_request_setfaction")
                    net.WriteString(factionID)
                    net.SendToServer()
                end
                btn:SetTooltip(PBCR_GetFactionText(factionID, "desc", LocalPlayer()) or "")
                panel:AddItem(btn)
                panel:Help(PBCR_GetFactionText(factionID, "desc", LocalPlayer()))
            end
        end)
    end)

local function PBCR_PlayRandomNotifySound(ntype)
    local tbl = PBCR_NotifySounds[ntype]
    if not tbl or #tbl == 0 then return end
    surface.PlaySound(tbl[math.random(#tbl)])
end
    net.Receive("pbcr_notify", function()
    local msg   = net.ReadString() or ""
    local ntype = net.ReadString() or "hint"
    local dur   = net.ReadFloat() or 5

    local cv = GetConVar("pbcr_notify")
    if cv and cv:GetInt() == 0 then
        return
    end

    if ntype == "error" then
        notification.AddLegacy(msg, NOTIFY_ERROR, dur)
    elseif ntype == "hint" then
        notification.AddLegacy(msg, NOTIFY_HINT, dur)
    elseif ntype == "success" then
        notification.AddLegacy(msg, NOTIFY_GENERIC, dur)
    else
        notification.AddLegacy(msg, NOTIFY_GENERIC, dur)
    end

    PBCR_PlayRandomNotifySound(ntype)
end)
end*/
end