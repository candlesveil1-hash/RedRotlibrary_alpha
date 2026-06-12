
local RedRot = {}

function RedRot.keyboardInput()
    os.execute("stty -icanon -echo min 0 time 0")
    local ch = io.stdin:read(1)
--    os.execute("stty sane")
    return ch
end

-- snowflake lua based lib
-- # Screen API
SpritSprite ={}
for i = 1, 4 do
SpritSprite[i] ={}
for j = 1, 4 do
SpritSprite[i][j] = 0

end

end
RedRot.viewPortX = 0;
RedRot.viewPortY = 0;
ChunkMap = {}
for i = 1, 4 do
ChunkMap[i] ={}
for j = 1, 4 do
ChunkMap[i][j] = 0

end

end

palette = {
["Black"] = "\27[0;30m",
["Red"] = "\27[0;31m",
["Green"] = "\27[0;32m",
["Yellow"] = "\27[0;33m",
["Blue"] = "\27[0;34m",
["Purple"] = "\27[0;35m",
["Cyan"] = "\27[0;36m",
["White"] = "\27[0;37m",

["HighBlack"] = "\27[1;90m",
["HighRed"] = "\27[1;91m",
["HighGreen"] = "\27[1;92m",
["HighYellow"] = "\27[1;93m",
["HighBlue"] = "\27[1;94m",
["HighPurple"] = "\27[1;95m",
["HighCyan"] = "\27[1;96m",
["HighWhite"] = "\27[1;97m",

}
RedRot.display = {}
RedRot.charDisplay = {}

RedRot.SCREEN = {
   ["small"] = {
	width =24,
	height = 24
   },
   ["medium"] = {
	width = 32,
	height = 32
   },
   ["big"] = {
	width = 36,
	height = 36,
   },
   ["large"] = {
	width = 56,
	height = 56,
   }

}

function clearTerm()
os.execute("clear")
end
clearTerm()
function RedRot.initScreen(pickSize)
if pickSize > 3 then print(palette["Red"].."Error Size Not Found! Try 0 or 1 or 2!");
print("\n".. palette["Black"].." ");
return
end
    if pickSize == 0 then
        RedRot.terminalCess = "small"
    elseif pickSize == 1 then
        RedRot.terminalCess = "medium"
    elseif pickSize == 2 then
        RedRot.terminalCess = "big"
    elseif pickSize == 3 then
            RedRot.terminalCess = "large"
    else
        RedRot.terminalCess = "small"
    end

    local screen = RedRot.SCREEN[RedRot.terminalCess]

    RedRot.draw_screen_width = screen.width
    RedRot.draw_screen_height = screen.height

    RedRot.display = {}

    for x = 1, screen.width do
        RedRot.display[x] = {}
        for y = 1, screen.height do
            RedRot.display[x][y] = 0
        end
    end

    local screen = RedRot.SCREEN[RedRot.terminalCess]

    RedRot.draw_screen_width = screen.width
    RedRot.draw_screen_height = screen.height

    RedRot.charDisplay = {}

    for x = 1, screen.width do
        RedRot.charDisplay[x] = {}
        for y = 1, screen.height do
            RedRot.charDisplay[x][y] = ""
        end
    end

end
function RedRot.drawScreen()
io.write("\27[?25l\27[H")
local screen_buffer = {}
for j = 1, RedRot.draw_screen_height do
local line = ""
 for i = 1, RedRot.draw_screen_width do
  line = line ..RedRot.charDisplay[i][j];

 end
 table.insert(screen_buffer, line)
end
io.write(table.concat(screen_buffer, "\n") .. "\n")

io.write("\27[?25h\27[0m")
io.flush()
end
function RedRot.drawDebugScreen()
for j = 1, RedRot.draw_screen_width do
local line = ""
 for i = 1, RedRot.draw_screen_height do
  line = line ..RedRot.display[i][j];

 end
 io.write(line)
end
end

function RedRot.clear()
    local sizeName = RedRot.terminalCess or "small"
    local w = RedRot.SCREEN[sizeName].width
    local h = RedRot.SCREEN[sizeName].height
    
    RedRot.display = {}
    RedRot.charDisplay = {}
    
    for x = 1, w do
        RedRot.display[x] = {}
        RedRot.charDisplay[x] = {}
        for y = 1, h do
            RedRot.display[x][y] = 0
            RedRot.charDisplay[x][y] = " "
        end
    end
end

function RedRot.setPixel(x, y, Color_value)
    if not RedRot.display[x] or not RedRot.display[x][y] then
        return
    end
    if (Color_value > 8) then return end
    RedRot.display[x][y] = Color_value
end

function RedRot.setText(x, y,string, color)

local TTA = {}
local colorPalette = palette[color]
-- print(colorPalette, color)

for i = 1,#string do
table.insert(TTA, string.sub(string,i,i))
end

for i = 1,#TTA do
RedRot.charDisplay[(x+i) - 1][y] = colorPalette.. TTA[i]
end

end

function RedRot.setColor(secondpal)
for j = 1, RedRot.draw_screen_height do
 for i = 1, RedRot.draw_screen_width do
    if not RedRot.charDisplay[i] or not RedRot.charDisplay[i][j] then
    else
if(secondpal == 0) then
if(RedRot.display[i][j] == 0) then
RedRot.charDisplay[i][j] = palette["Black"].."█"
end
if(RedRot.display[i][j] == 1) then
RedRot.charDisplay[i][j] = palette["Red"].."█"
end
if(RedRot.display[i][j] == 2) then
RedRot.charDisplay[i][j] = palette["Green"].."█"
end
if(RedRot.display[i][j] == 3) then
RedRot.charDisplay[i][j] = palette["Yellow"].."█"
end
if(RedRot.display[i][j] == 4) then
RedRot.charDisplay[i][j] = palette["Blue"].."█"
end
if(RedRot.display[i][j] == 5) then
RedRot.charDisplay[i][j] = palette["Purple"].."█"
end
if(RedRot.display[i][j] == 6) then
RedRot.charDisplay[i][j] = palette["Cyan"].."█"
end
if(RedRot.display[i][j] == 7) then
RedRot.charDisplay[i][j] = palette["White"].."█"
end
end

if(secondpal == 1) then
if(RedRot.display[i][j] == 1) then
RedRot.charDisplay[i][j] = palette["HighRed"].."█"
end
if(RedRot.display[i][j] == 2) then
RedRot.charDisplay[i][j] = palette["HighGreen"].."█"
end
if(RedRot.display[i][j] == 3) then
RedRot.charDisplay[i][j] = palette["HighYellow"].."█"
end
if(RedRot.display[i][j] == 4) then
RedRot.charDisplay[i][j] = palette["HighBlue"].."█"
end
if(RedRot.display[i][j] == 5) then
RedRot.charDisplay[i][j] = palette["HighPurple"].."█"
end
if(RedRot.display[i][j] == 6) then
RedRot.charDisplay[i][j] = palette["HighCyan"].."█"
end
if(RedRot.display[i][j] == 7) then
RedRot.charDisplay[i][j] = palette["HighWhite"].."█"
end
end

end
end
end
end
function RedRot.SpriteData(...)
local data = {...}
for i = 1, #data - 2, 3 do 
    local color = data[i+2]
    local y = 1 + data[i+1]
    local x = 1 + data[i]
	local ids = id 
    SpritSprite[x][y] = 1 + color  
	
end
end


function RedRot.Sprite(x,y)
for i = 1, 4 do
for j = 1, 4 do
RedRot.setPixel(1+ x+ i,1 + y + j,SpritSprite[i][j])
-- SpritSprite[i][j]
  end
 end
end

function RedRot.execute(codeString)
print("Program Running....")
os.execute("sleep 1")
    local chunk, err = loadstring(codeString)
    if not chunk then
        print(err)
        return
    end

    while true do
        chunk()
    end
end
function RedRot.setup(codeString)
print("Program Setting Up....")

os.execute("sleep 1")
    local chunk, err = loadstring(codeString)
    if not chunk then
        print(err)
        return
    end

        chunk()
end
function RedRot.debugMode()
paletteNames = {

	"Black",
	"Red",
	"Green",
	"Yellow",
	"Blue",
	"Purple",
	"Cyan",
	"White",

	"HighBlack",
	"HighRed",
	"HighGreen",
	"HighYellow",
	"HighBlue",
	"HighPurple",
	"HighCyan",
	"HighWhite"
}
-- ["Black"] = "\27[0;30m",
-- ["Red"] = "\27[0;31m",
-- ["Green"] = "\27[0;32m",
-- ["Yellow"] = "\27[0;33m",
-- ["Blue"] = "\27[0;34m",
-- ["Purple"] = "\27[0;35m",
-- ["Cyan"] = "\27[0;36m",
-- ["White"] = "\27[0;37m",
-- 
-- ["HighBlack"] = "\27[1;90m",
-- ["HighRed"] = "\27[1;91m",
-- ["HighGreen"] = "\27[1;92m",
-- ["HighYellow"] = "\27[1;93m",
-- ["HighBlue"] = "\27[1;94m",
-- ["HighPurple"] = "\27[1;95m",
-- ["HighCyan"] = "\27[1;96m",
-- ["HighWhite"] = "\27[1;97m",

-- for i = 1,#paletteNames-1 do
print("First Palette\n")
print(palette[paletteNames[1]] .. "█" .."\27[0;37m".. "["..paletteNames[1].."]")
print(palette[paletteNames[2]] .. "█" .."\27[0;37m".. "["..paletteNames[2].."]")
print(palette[paletteNames[3]] .. "█" .."\27[0;37m".. "["..paletteNames[3].."]")
print(palette[paletteNames[4]] .. "█" .."\27[0;37m".. "["..paletteNames[4].."]")
print(palette[paletteNames[5]] .. "█" .."\27[0;37m".. "["..paletteNames[5].."]")
print(palette[paletteNames[6]] .. "█" .."\27[0;37m".. "["..paletteNames[6].."]")
print(palette[paletteNames[7]] .. "█" .."\27[0;37m".. "["..paletteNames[7].."]")
print(palette[paletteNames[8]] .. "█" .."\27[0;37m".. "["..paletteNames[8].."]")
print("\n Secondary Palette\n")
print(palette[paletteNames[9]] .. "█" .."\27[0;37m".. "["..paletteNames[9].."]")
print(palette[paletteNames[10]] .. "█" .."\27[0;37m".. "["..paletteNames[10].."]")
print(palette[paletteNames[11]] .. "█" .."\27[0;37m".. "["..paletteNames[11].."]")
print(palette[paletteNames[12]] .. "█" .."\27[0;37m".. "["..paletteNames[12].."]")
print(palette[paletteNames[13]] .. "█" .."\27[0;37m".. "["..paletteNames[13].."]")
print(palette[paletteNames[14]] .. "█" .."\27[0;37m".. "["..paletteNames[14].."]")
print(palette[paletteNames[15]] .. "█" .."\27[0;37m".. "["..paletteNames[15].."]")
print(palette[paletteNames[16]] .. "█" .."\27[0;37m".. "["..paletteNames[16].."]")
-- end
end

function RedRot.paletteMode()
paletteNames = {

	"Black",
	"Red",
	"Green",
	"Yellow",
	"Blue",
	"Purple",
	"Cyan",
	"White",

	"HighBlack",
	"HighRed",
	"HighGreen",
	"HighYellow",
	"HighBlue",
	"HighPurple",
	"HighCyan",
	"HighWhite"
}
-- ["Black"] = "\27[0;30m",
-- ["Red"] = "\27[0;31m",
-- ["Green"] = "\27[0;32m",
-- ["Yellow"] = "\27[0;33m",
-- ["Blue"] = "\27[0;34m",
-- ["Purple"] = "\27[0;35m",
-- ["Cyan"] = "\27[0;36m",
-- ["White"] = "\27[0;37m",
-- 
-- ["HighBlack"] = "\27[1;90m",
-- ["HighRed"] = "\27[1;91m",
-- ["HighGreen"] = "\27[1;92m",
-- ["HighYellow"] = "\27[1;93m",
-- ["HighBlue"] = "\27[1;94m",
-- ["HighPurple"] = "\27[1;95m",
-- ["HighCyan"] = "\27[1;96m",
-- ["HighWhite"] = "\27[1;97m",

-- for i = 1,#paletteNames-1 do
print("First Palette\n")
print(palette[paletteNames[1]] .. "█" .."\27[0;37m".. "["..paletteNames[1].."]")
print(palette[paletteNames[2]] .. "█" .."\27[0;37m".. "["..paletteNames[2].."]")
print(palette[paletteNames[3]] .. "█" .."\27[0;37m".. "["..paletteNames[3].."]")
print(palette[paletteNames[4]] .. "█" .."\27[0;37m".. "["..paletteNames[4].."]")
print(palette[paletteNames[5]] .. "█" .."\27[0;37m".. "["..paletteNames[5].."]")
print(palette[paletteNames[6]] .. "█" .."\27[0;37m".. "["..paletteNames[6].."]")
print(palette[paletteNames[7]] .. "█" .."\27[0;37m".. "["..paletteNames[7].."]")
print(palette[paletteNames[8]] .. "█" .."\27[0;37m".. "["..paletteNames[8].."]")
print("\n Secondary Palette\n")
print(palette[paletteNames[9]] .. "█" .."\27[0;37m".. "["..paletteNames[9].."]")
print(palette[paletteNames[10]] .. "█" .."\27[0;37m".. "["..paletteNames[10].."]")
print(palette[paletteNames[11]] .. "█" .."\27[0;37m".. "["..paletteNames[11].."]")
print(palette[paletteNames[12]] .. "█" .."\27[0;37m".. "["..paletteNames[12].."]")
print(palette[paletteNames[13]] .. "█" .."\27[0;37m".. "["..paletteNames[13].."]")
print(palette[paletteNames[14]] .. "█" .."\27[0;37m".. "["..paletteNames[14].."]")
print(palette[paletteNames[15]] .. "█" .."\27[0;37m".. "["..paletteNames[15].."]")
print(palette[paletteNames[16]] .. "█" .."\27[0;37m".. "["..paletteNames[16].."]")
-- end
end

return RedRot

