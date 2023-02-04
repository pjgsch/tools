-- lua-file

--x = arg[1]
--print(x)

--print("enter the file name : ")
--io.write("enter the file name : ")
--filename = io.read("*line")
--print('filename = ',filename)

--if (filename == '') then
--  print("bad")
--  os.exit()
--else
--  print("good")
--end

-- -------------------------------------------------------------------
-- The text below will be printed in the file 'testin'
-- -------------------------------------------------------------------

text = [[
# Test input file
ITEM1|ITEM2|ITEM3|ITEM4|
ITEM1|ITEM2|ITEM3|ITEM4|
ITEM1|ITEM2|ITEM3|ITEM4|
ITEM1|ITEM2|ITEM3|ITEM4|
ITEM1|ITEM2|ITEM3|ITEM4|
]]

infile = io.open("testin","w") 
infile:write(text)
infile:close()

os.execute("grep '^#' -v testin > testtr")

-- -------------------------------------------------------------------
-- The file 'testtr' is read and printed to the screen
-- -------------------------------------------------------------------

trfile = io.open("testtr","r")
contents = trfile:read("*all")
--firstline = trfile:read()
trfile:close()

--print(firstline)

print(contents)

-- -------------------------------------------------------------------
-- The file 'testtr' is read and printed to the screen line by line
-- -------------------------------------------------------------------

lines = {}
for line in io.lines("testtr") do
  words = {}

  word = {}
  for character in line:gmatch "." do
    if ( character ~= "|" ) then
      table.insert(word,character)
    end
    if ( character == "|" ) then
      table.insert(word," ")
      woord = table.concat(word)
      table.insert(words,woord)
      word = {}
    end
  end
  io.write(words[1],words[2],words[3],words[4],"\n")
--  print(table.concat(words))
   table.insert(lines,table.concat(words))
--  lines[#lines+1] = table.concat(words)
end



print();


-- -------------------------------------------------------------------
-- The file is printed again, now with line numbers
-- -------------------------------------------------------------------

for k,v in pairs(lines) do
--  print('line[' .. k .. ']',v)
  print(k,v)
end


-- -------------------------------------------------------------------

xyout = io.open("testxy","w")
io.output(xyout)

pi = 4*math.atan(1)
for i = 0,361,1 do
  x = i
  y = math.sin((x/180*pi))
  io.write(x,"  ",y,"\n")
end

io.close(xyout)

-- -------------------------------------------------------------------
--[[
local function read_file(path)
    local file = io.open(path, "r") 
    if not file then return nil end
    local content = file:read "*all" 
    file:close() 
--    io.close(path)
    return content
end
]]


