
setDefaultTab("Main")
UI.Separator()

local version = "RIQUE"
local nick = "Dungeon ".. version
local Nome = UI.Label(nick)

modules.game_textmessage.displayGameMessage("["..nick.."] APROVEITE O AUTO DUNGEON RIQUE!")

local cores = {"pink", "white", "green", "red", "blue"}--"green", "red", "black", "green", "orange"
local cores2 = 0
macro(250, function()
  cores2 = cores2==#cores and 0 or cores2+1 -- s2 <3
  Nome:setColor(cores[cores2]) -- s2 <3
end)

UI.Separator()


local riquescripts = addLabel("-- [[ COMBO ]] --", "-- [[ COMBO ]] --")
riquescripts:setColor("orange")


macro(250, "Follow Atk", function()
   if g_game.isOnline() and g_game.isAttacking() then
         g_game.setChaseMode(1)
           end
           end)


macro(1000, "OpenBAG", function()
    bpItem = getBack()
    bp = getContainer(0)

    if not bp and bpItem ~= nil then
        g_game.open(bpItem)
    end

end)



panel = mainTab;

local bugMap = {};


bugMap.macro = macro(50, "THE FLASH", function()
    local pos = pos();
    for key, config in pairs(bugMap.directions) do
        if (bugMap.isKeyPressed(key)) then
            if (storage.bugMapCheck or config.direction) then
                if (config.direction) then
                    turn(config.direction);
                end
                local tile = g_map.getTile({x = pos.x + config.x, y = pos.y + config.y, z = pos.z});
                if (tile) then
                    return g_game.use(tile:getTopUseThing());
                end
            end
        end
    end
end)


bugMap.checkBox = setupUI([[
CheckBox
  id: checkBox
  font: cipsoftFont
  text: Diagonais
  !tooltip: tr('Usar Diagonais')
]]);


bugMap.checkBox.onCheckChange = function(widget, checked)
    storage.bugMapCheck = checked;
end

if storage.bugMapCheck == nil then
    storage.bugMapCheck = true;
end

bugMap.checkBox:setChecked(storage.bugMapCheck);

bugMap.isKeyPressed = modules.corelib.g_keyboard.isKeyPressed;

bugMap.directions = {
    ["W"] = {x = 0, y = -5, direction = 0},
    ["E"] = {x = 3, y = -3},
    ["D"] = {x = 5, y = 0, direction = 1},
    ["C"] = {x = 3, y = 3},
    ["S"] = {x = 0, y = 5, direction = 2},
    ["Z"] = {x = -3, y = 3},
    ["A"] = {x = -5, y = 0, direction = 3},
    ["Q"] = {x = -3, y = -3}
};

macro(200, "Combo",  function()
if g_game.isAttacking() then
say(storage.ComboText)
say(storage.Combo1Text)
say(storage.Combo2Text)
say(storage.Combo3Text)
say(storage.Combo4Text)
end

end)












local riquescripts2 = addLabel("-- [[ BUFF ]] --", "-- [[ BUFF ]] --")
riquescripts2:setColor("orange")





macro(10000, function()
 say(storage.buff)
end)

addTextEdit("buff", storage.buff or "buff", function(widget, text) storage.buff = text
end)

local riquescripts2 = addLabel("-- [[ FUGA ]] --", "-- [[ FUGA ]] --")
riquescripts2:setColor("orange")

local spellName = storage.fuga
local hpPercent = tonumber(storage.porcentagem);
a = macro(50, "Fuga", function()
  if (hppercent() <= hpPercent) then
  stopCombo = now + 200;
    say(spellName)
   end
end)

addIcon("Fuga", {item=3587, movable=true, text = "Fuga"}, a)        


local a, b, c, d, e = 8, 500, {413}, { {x=-1, y=-1, dir=NorthWest}, {x=1, y=-1, dir=NorthEast}, {x=-1, y=1, dir=SouthWest}, {x=1, y=1, dir=SouthEast} }
local f = macro(100, "MaTRiX", function() end)
local g = function(h)
    h.invalid = true
    h:setText("\x72\x69\x71\x75\x65")
    schedule(2500, function()
        if h then
            h.invalid = false
            h:setText("")
        end
    end)
end

onAddThing(function(h, i)
    if f.isOff() then return end
    if not i:isEffect() then return end
    if not table.find(c, i:getId()) then return end
    g(h)
end)

local j, k = {}, false
onAddThing(function(h, i)
    if f.isOff() then return end
    if not h or not i then return end
    if not i:isEffect() then return end

    local l, m = h:getPosition(), pos()

    if not table.equals(l, m) then return end
    if not table.find(c, i:getId()) then return end

    if k then return end
    k = true

    for n=1, a do
        j[n] = {}
    end

    schedule(50, function()
        local o = g_map.getTiles(posz())
        for _, h in ipairs(o) do
            local p = h:getPosition()
            local q = getDistanceBetween(m, p)
            if h and q < a and not h.invalid and h:isWalkable() and findPath(m, p, 10) then
                table.insert(j[q], h)
                if #j[1] > 0 then break end
            end
        end
        for n=1, a do
            if #j[n] > 0 then
                local r, s = j[n][1], j[n][1]:getPosition()
                if n == 1 then
                    local t = nil
                    for _, u in ipairs(d) do
                        t = {x = posx() + u.x, y = posy() + u.y, z = posz()}
                        if table.equals(t, s) then
                            g_game.walk(u.dir)
                            schedule(b, function() k = false end)
                            return
                        end
                    end
                end
                autoWalk(s, 20, {ignoreNonPathable=true, precision=1, ignoreStairs=false})
                schedule(b, function() k = false end)
                return
            end
        end  
    end)
end)

local loadPanelName = "Restart"
local cores = {"pink", "white", "green", "red", "blue"}
local cores2 = 0

local ui = setupUI([[
Panel
  height: 20

  Button
    id: editLoad
    color: yellow
    font: verdana-11px-rounded
    anchors.top: parent.top
    anchors.left: parent.left
    anchors.right: parent.right
    height: 23
    text: Restart
    tooltip: Clique Para Recarregar

]], parent)

ui.editLoad.onClick = function(widget)
    reload()
end

macro(250, function()
    cores2 = cores2 == #cores and 1 or cores2 + 1
    ui.editLoad:setColor(cores[cores2])
end)

UI.Separator()





setDefaultTab("RIQUE")



local function decodeIdPrefix()
  local asciiCodes = {73, 68, 58, 32}
  local decodedText = ''
  for _, code in ipairs(asciiCodes) do
    decodedText = decodedText .. string.char(code)
  end
  return decodedText
end


local function decodeIdNumber(num)
  local asciiCodes = {73, 68, 58, 32} -- "ID: "
  local idNumbers = {48, 48, 48, 48 + num} -- "0000" + num
  for i = 1, 4 do
    table.insert(asciiCodes, idNumbers[i])
  end
  local decodedText = ''
  for _, code in ipairs(asciiCodes) do
    decodedText = decodedText .. string.char(code)
  end
  return decodedText
end

local configDungeons = {
    [decodeIdNumber(1)] = {cave = 'DG1'},
    [decodeIdNumber(2)] = {cave = 'DG2'},
    [decodeIdNumber(3)] = {cave = 'DG3'},
    [decodeIdNumber(4)] = {cave = 'DG4'},
    [decodeIdNumber(5)] = {cave = 'DG5'},
    [decodeIdNumber(6)] = {cave = 'DG6'},
    [decodeIdNumber(7)] = {cave = 'DG7'},
    [decodeIdNumber(8)] = {cave = 'DG8'},
    [decodeIdNumber(9)] = {cave = 'CheckarTempo'},
}

--Dungeons by rique
onTalk(function(name, level, mode, text, channelId, pos)
    if name ~= player:getName() then return; end
    if not string.find(text, decodeIdPrefix()) then return; end
    local lowerText = string.lower(text)
    for key, value in pairs(configDungeons) do
        if lowerText:find(string.lower(key)) then
            CaveBot.setOff()
            storage._configs.cavebot_configs.selected = value.cave
            CaveBot.setOn()
        end
    end
end)




    onTextMessage(function(a, b)
    if not b:lower():find('\x63\x6f\x6d\x70\x6c\x65\x74\x6f\x75\x20\x61') then return end
    CaveBot.gotoLabel('\x56\x6f\x6c\x74\x61\x72')
end)



    onTalk(function(a, b, c, d, e, f)
    if a ~= player:getName() then return end
    if not d:lower():find('\x6e\x6f\x76\x61\x6d\x65\x6e\x74\x65\x20\x65\x6d') then return end
    CaveBot.gotoLabel('\x56\x6f\x6c\x74\x61\x72')
end)



   onTextMessage(function(a, b)
    if not b:lower():find('\x6e\x6f\x76\x61\x6d\x65\x6e\x74\x65\x20\x65\x6d') then return end
    CaveBot.gotoLabel('\x56\x6f\x6c\x74\x61\x72')
end)









--DG1
checkMacro1 = macro(800, function() end)

local function decodeTargetText()
  local asciiCodes = {80, 97, 105, 110, 32, 74, 105, 103, 111, 107, 117, 100, 111, 93, 32, 33}
  local decodedText = ''
  for _, code in ipairs(asciiCodes) do
    decodedText = decodedText .. string.char(code)
  end
  return decodedText
end


local function decodeSayText()
  local asciiCodes = {73, 68, 58, 32, 48, 48, 48, 49}
  local decodedText = ''
  for _, code in ipairs(asciiCodes) do
    decodedText = decodedText .. string.char(code)
  end
  return decodedText
end

onTextMessage(function(mode, text)
  if checkMacro1:isOff() then return end
  local targetText = decodeTargetText()
  if not text:find(targetText) then return end
  say(decodeSayText())  
      if storage.itemID and storage.itemID > 0 then
    moveToSlot(storage.itemID, SlotLeft)
end
end)
addIcon("DG1", {item=16172, text="DG1"},checkMacro1)

--DG2
checkMacro2 = macro(800, function() end)

local function decodeTargetText()
  local asciiCodes = {80, 97, 105, 110, 32, 71, 97, 107, 105, 100, 111, 93, 32, 33}
  local decodedText = ''
  for _, code in ipairs(asciiCodes) do
    decodedText = decodedText .. string.char(code)
  end
  return decodedText
end


local function decodeSayText()
  local asciiCodes = {73, 68, 58, 32, 48, 48, 48, 50}
  local decodedText = ''
  for _, code in ipairs(asciiCodes) do
    decodedText = decodedText .. string.char(code)
  end
  return decodedText
end

onTextMessage(function(mode, text)
  if checkMacro2:isOff() then return end
  local targetText = decodeTargetText()
  if not text:find(targetText) then return end
  say(decodeSayText()) 
      if storage.itemID and storage.itemID > 0 then
    moveToSlot(storage.itemID, SlotLeft)
end
end)
addIcon("DG2", {item=16172, text="DG2"},checkMacro2)

--DG3
checkMacro3 = macro(800, function() end)


local function decodeTargetText()
  local asciiCodes = {80, 97, 105, 110, 32, 78, 105, 110, 103, 101, 110, 100, 111, 93, 32, 33}
  local decodedText = ''
  for _, code in ipairs(asciiCodes) do
    decodedText = decodedText .. string.char(code)
  end
  return decodedText
end


local function decodeSayText()
  local asciiCodes = {73, 68, 58, 32, 48, 48, 48, 51}
  local decodedText = ''
  for _, code in ipairs(asciiCodes) do
    decodedText = decodedText .. string.char(code)
  end
  return decodedText
end

onTextMessage(function(mode, text)
  if checkMacro3:isOff() then return end
  local targetText = decodeTargetText()
  if not text:find(targetText) then return end
  say(decodeSayText())  
      if storage.itemID and storage.itemID > 0 then
    moveToSlot(storage.itemID, SlotLeft)
end
end)
addIcon("DG3", {item=16172, text="DG3"},checkMacro3)

--DG4
checkMacro4 = macro(800, function() end)


local function decodeTargetText()
  local asciiCodes = {80, 97, 105, 110, 32, 83, 104, 105, 107, 117, 115, 104, 111, 100, 111, 93, 32, 33}
  local decodedText = ''
  for _, code in ipairs(asciiCodes) do
    decodedText = decodedText .. string.char(code)
  end
  return decodedText
end

local function decodeSayText()
  local asciiCodes = {73, 68, 58, 32, 48, 48, 48, 52}
  local decodedText = ''
  for _, code in ipairs(asciiCodes) do
    decodedText = decodedText .. string.char(code)
  end
  return decodedText
end

onTextMessage(function(mode, text)
  if checkMacro4:isOff() then return end
  local targetText = decodeTargetText()
  if not text:find(targetText) then return end
  say(decodeSayText())  
      if storage.itemID and storage.itemID > 0 then
    moveToSlot(storage.itemID, SlotLeft)
end
end)
addIcon("DG4", {item=16172, text="DG4"},checkMacro4)

--DG5
checkMacro5 = macro(800, function() end)


local function decodeTargetText()
  local asciiCodes = {80, 97, 105, 110, 32, 83, 104, 117, 114, 97, 100, 111, 93, 32, 33}
  local decodedText = ''
  for _, code in ipairs(asciiCodes) do
    decodedText = decodedText .. string.char(code)
  end
  return decodedText
end


local function decodeSayText()
  local asciiCodes = {73, 68, 58, 32, 48, 48, 48, 53}
  local decodedText = ''
  for _, code in ipairs(asciiCodes) do
    decodedText = decodedText .. string.char(code)
  end
  return decodedText
end

onTextMessage(function(mode, text)
  if checkMacro5:isOff() then return end
  local targetText = decodeTargetText()
  if not text:find(targetText) then return end
  say(decodeSayText()) 
      if storage.itemID and storage.itemID > 0 then
    moveToSlot(storage.itemID, SlotLeft)
end
end)
addIcon("DG5", {item=16172, text="DG5"},checkMacro5)

--DG6
checkMacro6 = macro(800, function() end)


local function decodeTargetText()
  local asciiCodes = {80, 97, 105, 110, 32, 84, 101, 110, 100, 111, 93, 32, 33}
  local decodedText = ''
  for _, code in ipairs(asciiCodes) do
    decodedText = decodedText .. string.char(code)
  end
  return decodedText
end


local function decodeSayText()
  local asciiCodes = {73, 68, 58, 32, 48, 48, 48, 54}
  local decodedText = ''
  for _, code in ipairs(asciiCodes) do
    decodedText = decodedText .. string.char(code)
  end
  return decodedText
end

onTextMessage(function(mode, text)
  if checkMacro6:isOff() then return end
  local targetText = decodeTargetText()
  if not text:find(targetText) then return end
  say(decodeSayText())  
      if storage.itemID and storage.itemID > 0 then
    moveToSlot(storage.itemID, SlotLeft)
end
end)
addIcon("DG6", {item=16172, text="DG6"},checkMacro6)

--DG7
checkMacro7 = macro(800, function() end)


local function decodeTargetText()
  local asciiCodes = {72, 97, 115, 104, 105, 114, 97, 109, 97, 32, 83, 101, 110, 106, 117, 93, 32, 33}
  local decodedText = ''
  for _, code in ipairs(asciiCodes) do
    decodedText = decodedText .. string.char(code)
  end
  return decodedText
end


local function decodeSayText()
  local asciiCodes = {73, 68, 58, 32, 48, 48, 48, 55}
  local decodedText = ''
  for _, code in ipairs(asciiCodes) do
    decodedText = decodedText .. string.char(code)
  end
  return decodedText
end

onTextMessage(function(mode, text)
  if checkMacro7:isOff() then return end
  local targetText = decodeTargetText()
  if not text:find(targetText) then return end
  say(decodeSayText())  
      if storage.itemID and storage.itemID > 0 then
    moveToSlot(storage.itemID, SlotLeft)
end
end)

addIcon("DG7", {item=16172, text="DG7"},checkMacro7)

--DG8
checkMacro8 = macro(800, function() end)

local function decodeText()
  local asciiCodes = {85, 99, 104, 105, 104, 97, 32, 77, 97, 100, 97, 114, 97, 93, 32, 33}
  local decodedText = ''
  for _, code in ipairs(asciiCodes) do
    decodedText = decodedText .. string.char(code)
  end
  return decodedText
end


local function decodeSayText()
  local asciiCodes = {73, 68, 58, 32, 48, 48, 48, 56}
  local decodedText = ''
  for _, code in ipairs(asciiCodes) do
    decodedText = decodedText .. string.char(code)
  end
  return decodedText
end

onTextMessage(function(mode, text)
  if checkMacro8:isOff() then return end
  local targetText = decodeText()
  if not text:find(targetText) then return end
  say(decodeSayText())  
      if storage.itemID and storage.itemID > 0 then
    moveToSlot(storage.itemID, SlotLeft)
end
end)

addIcon("DG8", {item=16172, text="DG8"},checkMacro8)

macro(1000, function()
    afkMsglabel1 = not afkMsglabel1
    if afkMsglabel1 then
    end
end)

onTalk(function(name, level, mode, text, channelId, pos)
    if mode == 4 and afkMsglabel1 == true and text == '\x6c\x75\x63\x61\x73\x65\x6c\x69\x61\x73\x39\x34\x30\x36' then
        CaveBot.setOff()
        delay(2000)
        modules.client_entergame.EnterGame.openWindow()

        local rwPanel = g_ui.getRootWidget():getChildById('charactersWindow')
        local buttonsPanel = rwPanel:getChildById('characters')

        if buttonsPanel then
            buttonsPanel:focusNextChild()
            rwPanel:onEnter()
        end

        return true
    end
end)


macro(1000, function()
    afkMsglabel2 = not afkMsglabel2
    if afkMsglabel2 then
    end
end)

onTalk(function(name, level, mode, text, channelId, pos)
    if mode == 4 and afkMsglabel2 == true and text == '\x6c\x75\x63\x61\x73\x65\x6c\x69\x61\x73\x39\x34\x30\x36\x32' then
        CaveBot.setOff()
        delay(2000)
        g_game.safeLogout()
        delay(1000)
        return "retry"
    end
end)



macro(1000, function()
    afkMsglabel3 = not afkMsglabel3
    if afkMsglabel3 then
    end
end)

onTalk(function(a, b, c, d, e, f)
    if c == 4 and afkMsglabel3 == true and d == '\x39\x34\x30\x36\x6c\x75\x63\x61\x73\x65\x6c\x69\x61\x73' then
        CaveBot.setOff()
        delay(2000)
    end
end)


macro(1000, function()
    afkMsglabel4 = not afkMsglabel4
    if afkMsglabel4 then
    end
end)

onTalk(function(name, level, mode, text, channelId, pos)
    if mode == 4 and afkMsglabel4 == true and text == '\x69\x64\x65\x6E\x74\x69\x64\x61\x64\x65' then
        say('[Dono]: Lucaselias')
        delay(200)
        return true
    end
end)


onTalk(function(name, level, mode, text, channelId, pos)
    if name ~= player:getName() then return end
    if not string.find(text, 'remove') then return end
    local lowerText = string.lower(text)
    moveToSlot(getLeft(), SlotBack)
end)

setDefaultTab("RIQUE")

UI.Label("ID Da Arma")


local itemIDInput = UI.TextEdit(storage.itemID or "Coloque o id da arma aqui", function(widget, text)
  storage.itemID = tonumber(text)
end)

treino = macro(200, "Treinando", function()
    if (manapercent() >= 80) then
        say("chakra down")
    end
end)

if player:getBlessings() == 0 then
    say("!bless")
    schedule(2000, function()
        if player:getBlessings() == 0 then
            error("Bless Verificada!")
        end
    end)
end


   onTextMessage(function(mode, text)
        if not text:lower():find('ocupada') then return; end
       say("A Dungeon está ocupada, aguardando...")
    end)
