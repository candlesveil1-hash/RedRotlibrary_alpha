RedRot = require("RedRot")
file1 = io.open("main_setup.RR","r");
fileContent1 = file1:read("*a")

file = io.open("main_draw.RR","r");
fileContent = file:read("*a")
if(arg[1] == "run") then
RedRot.setup(fileContent1);
RedRot.execute(fileContent);
end
if(arg[1] == "debug") then
RedRot.debugMode()
end
if(arg[1] == "palette") then
RedRot.paletteMode()
end

file:close()
file1:close()
