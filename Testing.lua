--~~~~~BOT~~~~~--
botname = "RedoKontolodon4"  --BOT NAME
botpass = "@redojelek123"  --BOT PASSWORD
botlist = {"RedoKontolodon4"} --LIST BOT
--~~~~~INFO WORLD~~~~~--
worlds = {"OGZPZ"}
worldsid = "GACORBOS"
blockid= 4584
loop = true
--~~~~~BUYING PACK~~~~~--
itemname ="world_lock"  --Name Pack For Buying
packgems = 2000  --Price Gems Pack
packitemid = {242} --Item ID Pack
--~~~~~DROP WORLD~~~~~--
droppedworld = "SAVERGACOR"
droppedworldid = "SMANTIG"
--~~~~~BAN~~~~~--
ban = false --Ban Player Who Join The World (Need Acc) 
ignore = "Name" --Ignore Player For no Got Ban
--~~~~~WEBHOOK~~~~~--
weebhook = "https://discord.com/api/webhooks/1021663532628062208/QSvIcMui_HAQt5ixyOsLtUHBTZvqvaSmwESqc2bz-XQ60uRx4qwtoFpcTy_iAniMSjjH"
YourDiscordid= "888771508468580422"
--~~~~~~~~~~--


seedid = blockid+1

function powershell(loglars)
  local script = [[
  $webhookUri = "]].. weebhook ..[["
    
  $Body = @{
    'username' = 'Flauton Logs'

    'content' = ']].. loglars .."\n"..(os.date"Date= %d/%m/%Y").."     "..(os.date"Hour= %H:%M:%S)").."\n"..[[<@]].. YourDiscordid ..[[>'
    'avatar_url' = 'https://ibb.co/qDbTv7W'
  }
  Invoke-RestMethod -Uri $webhookUri -Method 'post' -Body $Body
  ]]
    
  local pipe = io.popen("powershell -command -", "w")
  pipe:write(script)
  pipe:close()
end


function getban()
    names = ''
    for t, i in pairs(getPlayers()) do
      if i.name:lower() ~= bot_username:lower() or i.name:lower() ~= ignore:lower() then
        names = i.name
        say('/ban '..i.name)
        sleep(2750)
      end
    end
    powershell("Bot name = "..botname.." Success Banned Player '..names")
  end


function back() 


function main(bekleme)
  for i=1, bekleme do
    local function dropItem(itemID, count)
      sendPacket(2, "action|drop\nitemID|" .. itemID)
      sleep(500)
      sendPacket(2,"action|dialog_return\ndialog_name|drop_item\nitemID|" .. itemID .. "|\ncount|" .. count)
      sleep(1000)
    end

    trashList = {5040,5042,5044,5032,5034,5036,5038,5024,5026,5028,5030}
    local function coptrashs()
        for a, trash in ipairs(trashList) do
            if findItem(trash) > 100 then
                sendPacket(2, "action|trash\n|itemID|"..trash)
                sleep(1500)
                sendPacket(2, "action|dialog_return\ndialog_name|trash_item\nitemID|"..trash.."|\ncount|"..findItem(trash))
                sleep(3000)
            end
        end
    end


    local function scanseed(id)
      local m=0
      for _,object in pairs(getObjects()) do
          if object.id==id then m=m + object.count end
      end
      return m
    end


    local function worldegirici(totTxt)
      sendPacket(3,"action|join_request\nname|" .. totTxt)
      sleep(15000)
      say("`2Script Running `9Flauton#1410")
      sleep(2000)
      say("/love") 
      sleep(2000) 
      move(-3,0)
      sleep(5000)
    end
    
    local function idliworldegirici(totTxt,Worldid)
      sendPacket(3,"action|join_request\nname|" .. totTxt.."|"..Worldid)
      sleep(15000)
      sendPacket(3,"action|join_request\nname|" .. totTxt.."|"..Worldid)
      sleep(5000)
    end

    local function break_tile(pozisyonx,pozisyony)
      while getTile(math.floor(getposx() /32) -1,math.floor(getposy() /32)).fg ~= 0 do
        sleep(65)
        punch(-1,0)
        if getTile(math.floor(getposx() /32) -1,math.floor(getposy() /32)).fg == 0 then goto NEXT end
        sleep(65)

        if getBot().status ~= "online" then
          powershell("Bot name = "..botname.." Disconnected")
          sleep(10000)
          while getBot().status ~= "online" do
            sleep(5000)
          end
          powershell("Bot name = "..botname.." Reconnected")
          sleep(10000)
          worldegirici(worlds[i])
          sleep(10000)
          idliworldegirici(worlds[i],worldsid)
          sleep(5000) 
          findPath(pozisyonx,pozisyony)
          sleep(1000)
        end
      end
      ::NEXT::
      coptrashs()
      collect(2)
    end
    local function breakzz(blockid,pozisyonx,pozisyony)
      while getTile(math.floor(getposx() /32) -1,math.floor(getposy() /32)).fg == 0 do
        place(blockid,-1,0)
        if getTile(math.floor(getposx() /32) -1,math.floor(getposy() /32)).fg == blockid then goto NEXT end
        sleep(130)

        if getBot().status ~= "online" then
          powershell("Bot name = "..botname.." Disconnected")
          sleep(10000)
          while getBot().status ~= "online" do
            sleep(5000)
          end
          powershell("Bot name = "..botname.." Reconnected")
          sleep(10000)
          worldegirici(worlds[i])
          sleep(10000) 
          idliworldegirici(worlds[i],worldsid)
          sleep(5000)
          findPath(pozisyonx,pozisyony)
          sleep(1000)
        end
      end
      ::NEXT::
      break_tile(pozisyonx,pozisyony)
    end
    local function ekici()
      for _, tile in pairs(getTiles()) do
        if tile.fg ~= 0 and tile.y >1 and findItem(seedid) > 0 and getTile(tile.x, tile.y -1).fg == 0 and getTile(tile.x, tile.y).fg ~= seedid and getTile(tile.x, tile.y).fg ~= blockid and getTile(tile.x-2, tile.y -1).fg ~= 6 and getTile(tile.x+2, tile.y -1).fg ~= 6 then
          findPath(tile.x, tile.y-1)
          sleep(50)
          while getTile(tile.x, tile.y-1).fg == 0 do
            place(seedid,0,0)
            sleep(150)
            if getBot().status ~= "online" then
              powershell("Bot name = "..botname.." Disconnected")
              sleep(10000)
              while getBot().status ~= "online" do
                sleep(5000)
              end
              powershell("Bot name = "..botname.." Reconnected")
              sleep(10000)
              worldegirici(worlds[i])
              sleep(10000) 
              idliworldegirici(worlds[i],worldsid)
              sleep(5000)
            end
          end
        end
      end
    end
    function foregraund(itemid)
      local count = 0
      for _, tile in pairs(getTiles()) do
        if tile.fg == itemid and getTile(tile.x, tile.y).ready then
          count = count + 1
        end
      end
      return count
    end
    local function dropbulucu(satinalmax)
      sleep(2000)
      coptrashs()
      sleep(2000)
      idliworldegirici(droppedworld,droppedworldid)
      sleep(200)
      for _, tile in pairs(getTiles()) do
        if tile.fg == 1422 then
          if getBot().status ~= "online" then
            powershell("Bot name = "..botname.." Disconnected")
            sleep(10000)
            while getBot().status ~= "online" do
              sleep(5000)
            end
            powershell("Bot name = "..botname.." Reconnected")
            sleep(10000)
            worldegirici(worlds[i])
            sleep(10000) 
            idliworldegirici(worlds[i],worldsid)
            sleep(5000)
            findPath(tile.x-1,tile.y)
            sleep(1000)
          end
          if satinalmax == "packetss" then
            if findItem(112) >= packgems then
              while findItem(112) >= packgems do
                sendPacket(2,"action|buy\nitem|"..itemname)
                sleep(10000)
                for ia=1,#packitemid do
                  if findItem(packitemid[ia]) > 150 then
                    local abccc = ia-2
                    findPath(tile.x+abccc,tile.y)
                    sleep(2000)
                    dropItem(packitemid[ia],findItem(packitemid[ia]))
                    sleep(750)
                  end
                end
              end
            end

            if findItem(112) < packgems then
              for iax=1,#packitemid do
                if findItem(packitemid[iax]) > 0 then
                  local abccc = iax-2
                  findPath(tile.x+abccc,tile.y)
                  sleep(2000)
                  dropItem(packitemid[iax],findItem(packitemid[iax]))
                  sleep(750)
                end
              end
            end

            if findItem(seedid) > 20 then
              findPath(tile.x-2,tile.y)
              sleep(2000)
              dropItem(seedid,findItem(seedid)-20)
              sleep(2000)
              powershell(scanseed(seedid).." Total dropped seed")
              sleep(10000)
            end
          end

          if satinalmax == "seeddrop" then
            if findItem(seedid) > 20 then
              if scanseed(seedid)< 3800 then
                findPath(tile.x-2,tile.y)
                sleep(2000)
                dropItem(seedid,findItem(seedid)-20)
                sleep(2000)
              end
              if scanseed(seedid)> 3800 then
                findPath(tile.x-2,tile.y-1)
                sleep(2000)
                dropItem(seedid,findItem(seedid)-20)
                sleep(2000)
              end
              powershell(scanseed(seedid).." Total dropped seed")
              sleep(10000)
            end

            for ib=1,#packitemid do
              if findItem(packitemid[ib]) > 0 then
                local aac = ib-2
                findPath(tile.x+aac,tile.y)
                sleep(2000)
                dropItem(packitemid[ib],findItem(packitemid[ib]))
                sleep(750)
              end
            end

          end
        end
      end
      worldegirici(worlds[i])
      sleep(10000) 
      idliworldegirici(worlds[i],worldsid)
    end
    local function toplayici()
      for _, tile in pairs(getTiles()) do
        if tile.fg == seedid and findItem(blockid) < 150 then
          if getTile(tile.x, tile.y).ready then
            findPath(tile.x, tile.y)
            sleep(50)
            while getTile(tile.x, tile.y).ready do
              if getTile(tile.x, tile.y).fg ==0 then goto NEXT end
              punch(0,0)
              sleep(150)
              if getBot().status ~= "online" then
                powershell("Bot name = "..botname.." Disconnected")
                sleep(10000)
                while getBot().status ~= "online" do
                  sleep(5000)
                end
                powershell("Bot name = "..botname.." Reconnected")
                sleep(10000)
                worldegirici(worlds[i])
                sleep(10000) 
                idliworldegirici(worlds[i],worldsid)
                sleep(5000)
                findPath(tile.x,tile.y)
                sleep(1000)
              end
            end
            ::NEXT::
            collect(2)
            sleep(50) 
            collect(2)
            sleep(50) 
          end
        end
      end
    end
    local function yapimsss()
      worldegirici(worlds[i])
      sleep(2000)
      kayitliyil =(os.date"%Y")
      kayitligun =(os.date"%d")
      kayitliay =(os.date"%m")

      kayitlisaat =(os.date"%H")
      kayitlidakika=(os.date"%M")
      kayitlisaniye=(os.date"%S")

      anadakika = foregraund(seedid)*0.13
      dakikayabolme= anadakika / 60
      saat = math.floor(dakikayabolme)
      dakika= (dakikayabolme - saat)*60
      tahminibitisdakika = saat
      tahminibitissaat =  math.floor(dakika+4)

      powershell("Bot name = "..botname.." World name = "..worlds[i].." Began to harvest the world.".."  Estimated end time "..tahminibitisdakika..":"..tahminibitissaat)
      sleep(10000)

      while foregraund(seedid) > 0 do

        while toplayici() do
          toplayici()
        end

        local pozisyonx = math.floor(getposx() /32)
        local pozisyony = math.floor(getposy() /32)

        while findItem(blockid) > 0 do
          breakzz(blockid,pozisyonx, pozisyony)
        end

        while ekici() do
          ekici()
        end

        if findItem(seedid) > 80 then
          sleep(2500)
          dropbulucu("seeddrop")
          sleep(2500)
        end
      end
      if foregraund(seedid) < 1 then
        local pozisyonx1 = math.floor(getposx() /32)
        local pozisyony1 = math.floor(getposy() /32)

        while findItem(blockid) > 0 do
          breakzz(blockid,pozisyonx1, pozisyony1)
        end

        while ekici() do
          ekici()
        end

        if itemname ~= "gems_pack" then
          if findItem(112) > packgems or findItem(seedid) > 20 then
            sleep(2000)
            dropbulucu("packetss")
            sleep(2000)
          end
        end
      end
    end
    yapimsss()
    sleep(2000)
    kayitliyil1 =(os.date"%Y")
    kayitligun1 =(os.date"%d")
    kayitliay1 =(os.date"%m")
    kayitlisaat1 =(os.date"%H")
    kayitlidakika1=(os.date"%M")
    kayitlisaniye1=(os.date"%S")
    ilkzaman = os.time {year = kayitliyil , month = kayitliay , day = kayitligun , hour = kayitlisaat ,min =kayitlidakika , sec = kayitlisaniye}
    sonzaman = os.time {year = kayitliyil1 , month = kayitliay1 , day = kayitligun1 , hour = kayitlisaat1 ,min =kayitlidakika1 , sec = kayitlisaniye1}
    kalanzamansaniye = sonzaman-ilkzaman
    adimadimtarih = (kalanzamansaniye/60)/60
    sonsaaat= math.floor(adimadimtarih)
    sondakika = math.floor((adimadimtarih-sonsaaat)*60)
    powershell("Bot name = "..botname.." World name = "..worlds[i].." Finished the world "..sonsaaat..":"..sondakika.." Time has passed")
    sleep(10000)
  end
end
local n=0
for i= 1, #botlist do
  n=n+1
  if n == #botlist then
    powershell("Bot name = "..botname.."  This account name Does not match the one in the botlist. If you think something is wrong contact with creator. https://discord.gg/flauton")
  end

  if botname == botlist[i] then
    addBot(botname,botpass)
    sleep(9000)
    powershell("Bot name = "..botname.." Script Start")
    sleep(10000)

    if getBot().status ~= "online" then
      powershell("Bot name = "..botname.." Disconnected")
      sleep(10000)
      while getBot().status ~= "online" do
        sleep(5000)
      end
      powershell("Bot name = "..botname.." Reconnected")
      sleep(10000)
    end
    
    if ban == true then
      while true do
        getban() 
        sleep(2000)
      end
    end
    
    if ban == false then
      NULL

    if loop == true then
      while true do
        main(#worlds)
        sleep(2000)
        powershell("Bot name = "..botname.." Bot returns to world 1")
        sleep(10000)
      end
    end

    if loop == false then
      main(#worlds)
      sleep(2000)
      removeBot(botname)
      sleep(5000)
      powershell("Bot name = "..botname.." The worlds are over, the bot has been removed, Tanks Use Script Rotation Flauton#1410")
      sleep(10000)
    end
  end
end
