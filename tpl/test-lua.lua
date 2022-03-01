-- lua-file

--x = arg[1]
--print(x)

print("enter the file name :")
filename = io.read("*line")
print('filename = ',filename)

if (filename == '') then
  print("bad")
  os.exit()
else
  print("good")
end


text = [[
 123 string characters out of 1917023
 48804 words of memory out of 1500000
 3390 multiletter control sequences out of 10000+200000
 3640 words of font info for 14 fonts, out of 1200000 for 2000
 645 hyphenation exceptions out of 8191
]]

exfile = io.open("file1.txt","w") 
exfile:write(text)
exfile:close()

infile = io.open(filename,"r")
contents = infile:read("*all")
firstline = infile:read()
infile:close()

print(contents)

infile = io.open(filename,"r")

lines = {}
for line in io.lines(filename) do
--  words = {}
--  for word in line:gmatch("%w+") do
--    table.insert(words,word)
--  end
--  table.insert(lines,words)
  lines[#lines+1] = line
  print(line)
end

infile:close()

for k,v in pairs(lines) do
  print('line[' .. k .. ']',v)
end

print(lines)

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

--local FileContent = read_file(filename);
--print (FileContent)

