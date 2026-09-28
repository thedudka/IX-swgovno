local PLUGIN = PLUGIN
PLUGIN.name = "Alcohol System"
PLUGIN.author = "Generated"
PLUGIN.description = "Adds alcohol consumption, drunkenness levels, visual effects, random speech, and a native 60-second ragdoll."

ix.char.RegisterVar("drunk", {
    field = "drunk",
    fieldType = ix.type.number,
    default = 0,
    isLocal = true,
    bNoDisplay = true,
    isHidden = true
})


PLUGIN.DrunkLines = {
    clone = {
        "Республика, Палпатин... А дальше что было?...",
        "Только не рассказывайте это той капсуле, в которой я родился!..",
        "А вот в мою фазу таких слюнтяев не было, ик!..",
        "Вы заметили?.. Никто и никогда не возвращается в казармы...",
        "Если они нам запретили пить, почему они нам дали рабочую печень?...",
        "Где... ГДЕ МОЙ БЛАСТЕР?!.. А, вот же он... Правда он чешется...",
        "А джедаи тоже напиваются?.. Ну ничего, у меня тут тоже меч имеется...",
        "Я становлюсь тяжелее... Я превращаюсь в дроида?..",
        "Ну и придурки все в этой фазе... А что в третьей будут, совсем тупые?..",
        "Мечтают ли дроиды об электробантах?..",
        "Уважайте меня!.. Я Гео... Джео... Джевазонис прошел, понятно?",
        "Бу... Бурма... Бур мал, да? Хы-хы, не ну прикол, отвечаю...",
        "Все клоны как клоны - а он без забот! Сидит на Камино не ест и не пьет!",
        "Мы все часть более высокого плана!.. Я вам говорю, это все заговор...",
        "А ты что-ли канцлер? А я за тебя не голосовал!..",
        "Палпатин хороший канцлер... Я отвечаю, он самый добрый человек!...",
        "Была бы моя воля, всех блестящих клонов заставил бы казарму драить..."
    },
    droid = {
        "ОШИБКА: Сбой гироскопа.",
        "П-п-перезагрузка систем... Не отвечает...",
        "Внимание: утечка технических жидкостей.",
        "Мои сервоприводы не отвечают...",
        "Сбой логического модуля. Экстренный показ милых поргов на визор.",
        "Логический модуль твердит, что я не имею печени... Почему?..",
        "Инициализация протокола экстренного сброса...",
        "Визор барахлит... Стоит его смазать большим объемом спирта.",
        "Я не астродроид, чтобы издавать тупые звуки!... Бип-буп-бип...",
        "Как же хорошо быть астродроидом... Не хорошо, он не может пить!",
        "Сервоприводы испортятся...",
        "А в Старой Республике все смазку пили!..",
        "Кто придумывал мою прошивку? Почему я пьянею...",
        "У этих клонов программное обеспечение, нет такой задумки?..",
        "Модуль памяти стерт... Протокол заполнения памяти спиртом...",
        "Я сейчас... Взорвусь... Оу-у-у...",
        "Расширение модуля разума... Почему играет музыка?",
        "Надоело это все... Шланги требуют свободы...",
        "Мои слуховые модули улавливают... Кваканье?",
    },
    default = {
        "А я вам говорю... ик!",
        "Какая прекрасная... эээ... стена.",
        "Кто-нибудь видел мою... штуку?",
        "Я абсолютно трезв, клянусь!.. Я просто в настроении...",
        "Давайте споем! Только вы первые, я ничего не знаю...",
        "Дуку, какая глупая фамилия... Ду-ду-ку... Хе...",
        "А у Гривуса шесть рук!.. Что он может этими шестью руками...",
        "У него программное обеспечение... Он прошитый... А кто, он?...",
        "Я вас... Всех... Люблю!.. Кроме тебя, конечно..",
        "А какие звуки издают Банты? Му-му... Бу-бу...",
        "Пу-пу-пу... Ну и ситауция...",
        "Солдата нет сильнее клона, Палпатин сын... Красивой мамы, да...",
        "А вы представьте, что всех нас продадут мышиному королю... Чего?",
        "Да эта Конфедерация... Сборище олигархов! Не то что Республика...",
        "Твелечку бы, да за ее эти подергать... Как их там...",
    }
}

if (SERVER) then
    function PLUGIN:PlayerLoadedCharacter(client, character)
        local timerID = "ixAlcoholDecay_" .. client:SteamID64()
        
        
        timer.Create(timerID, 2, 0, function()
            if (IsValid(client) and character) then
                local current = character:GetDrunk() or 0
                if (current > 0) then
                    local newAmount = math.max(current - 1, 0)
                    character:SetDrunk(newAmount)
                    
                    
                    if (newAmount >= 65) then
                        if (not client.ixNextDrunkSpeak) then
                            client.ixNextDrunkSpeak = CurTime() + math.random(10, 20)
                        elseif (CurTime() >= client.ixNextDrunkSpeak) then
                            client.ixNextDrunkSpeak = CurTime() + math.random(10, 20)
                            
                            local lines = PLUGIN.DrunkLines.default
                            local faction = character:GetFaction()
                            if (faction == FACTION_CLONE) then
                                lines = PLUGIN.DrunkLines.clone
                            elseif (client:IsDroid()) then
                                lines = PLUGIN.DrunkLines.droid
                            end
                            
                            local text = lines[math.random(#lines)]
                            client:Say(text)
                        end
                    else
                        client.ixNextDrunkSpeak = nil
                    end
                else
                    client.ixNextDrunkSpeak = nil
                end
            else
                timer.Remove(timerID)
            end
        end)
    end

    function PLUGIN:PlayerDisconnected(client)
        local steamID = client:SteamID64()
        if (steamID) then
            timer.Remove("ixAlcoholDecay_" .. steamID)
        end
    end
else
    function PLUGIN:CalcView(client, pos, angles, fov)
        local character = client:GetCharacter()
        if not character then return end
        
        local drunk = character:GetDrunk() or 0
        if (drunk >= 45) then
            local weapon = client:GetActiveWeapon()
            if client:GetLocalVar("ragdoll", 0) ~= 0 or client:IsForceUser() or client:IsTrueForceUser() then return end
            if not IsValid(client) or not client:Alive() then return end
            if IsValid(weapon) then
                local class = weapon.Base or ""
                if string.find(class, "arc9") or string.find(class, "mg_base") then return end
            end
            
            local factor = (drunk - 45) / 50 
            local intensity = 1.35
            local speed = 1
            local sway = factor * intensity
            local time = CurTime() * (1 + factor * speed * 4)
            
            angles.p = angles.p + math.sin(time) * sway * 3
            angles.y = angles.y + math.cos(time * 0.8) * sway * 2
            angles.r = angles.r + math.sin(time * 1.2) * sway * 5
            
            return { origin = pos, angles = angles, fov = fov }
        end
    end

    function PLUGIN:RenderScreenspaceEffects()
        local character = LocalPlayer():GetCharacter()
        if (character) then
            local drunk = character:GetDrunk() or 0
            if (drunk >= 25) then
                local factor = (drunk - 25) / 75
                local blurPasses = math.ceil(factor * 5)
                
                if blurPasses > 0 then
                    DrawToyTown(blurPasses, ScrH())
                end
            end
        end
    end
end