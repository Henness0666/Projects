-- Frogger by Henness
-- Version 1.0 12/19/2012

-- Config
screenw,screenh = term.getSize()
colors = {
	["0"] = 1,
	["1"] = 2,
	["2"] = 4,
	["3"] = 8,
	["4"] = 16,
	["5"] = 32,
	["6"] = 64,
	["7"] = 128,
	["8"] = 256,
	["9"] = 512,
	["a"] = 1024,
	["b"] = 2048,
	["c"] = 4096,
	["d"] = 8192,
	["e"] = 16384,
	["f"] = 32768
}
terrain = {
	[1] =  {"5","5","5","5","5","5","5","5","5","5","5","5","5"},
	[2] =  {"b","5","5","b","5","5","b","5","5","b","5","5","b"},
	[3] =  {"b","b","b","b","b","b","b","b","b","b","b","b","b"},
	[4] =  {"b","b","b","b","b","b","b","b","b","b","b","b","b"},
	[5] =  {"b","b","b","b","b","b","b","b","b","b","b","b","b"},
	[6] =  {"b","b","b","b","b","b","b","b","b","b","b","b","b"},
	[7] =  {"a","a","a","a","a","a","a","a","a","a","a","a","a"},
	[8] =  {"f","f","f","f","f","f","f","f","f","f","f","f","f"},
	[9] =  {"f","f","f","f","f","f","f","f","f","f","f","f","f"},
	[10] = {"f","f","f","f","f","f","f","f","f","f","f","f","f"},
	[11] = {"f","f","f","f","f","f","f","f","f","f","f","f","f"},
	[12] = {"a","a","a","a","a","a","a","a","a","a","a","a","a"},
	[13] = {"f","f","f","f","f","f","f","f","f","f","f","f","f"}
}
terrainw = #terrain[1]
terrainh = #terrain
woffset = (screenw/2)-(terrainw/2)
hoffset = 2
objects = {
	[1] =  {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
	[2] =  {0,1,1,0,1,1,0,1,1,0,1,1,0,0,0,0,0},
	[3] =  {0,1,1,1,1,1,0,0,0,1,1,1,1,1,1,0,0},
	[4] =  {0,0,1,1,1,0,0,1,1,1,1,1,1,1,1,1,1},
	[5] =  {0,0,0,1,1,1,1,0,0,0,1,1,1,1,0,0,0},
	[6] =  {0,0,0,1,0,0,0,1,0,0,0,1,1,1,1,1,1},
	[7] =  {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
	[8] =  {1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0},
	[9] =  {1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0},
	[10] = {1,0,0,0,0,0,1,0,0,0,0,1,0,0,0,0,0},
	[11] = {1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,0,0},
	[12] = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
	[13] = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
	[14] = {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1}
}
locations = {
	[1] =  {},
	[2] =  {},
	[3] =  {2,3,4,5,6,10,11,12,13,14,15},
	[4] =  {3,4,5,8,9,10,11,12,13,14,15,16,17},
	[5] =  {4,5,6,7,11,12,13,14},
	[6] =  {4,8,12,13,14,15,16,17},
	[7] =  {},
	[8] =  {1,8},
	[9] =  {1,8},
	[10] = {1,7,12},
	[11] = {1,6,11},
	[12] = {},
	[13] = {}
}
turtlelevel = 3
death = false

-- Functions
function printCentered(str, ypos)
	term.setCursorPos(screenw/2 - #str/2, ypos)
	term.write(str)
end

function returnColor(str)
	return colors[str]
end

function resetFrog()
	posx = 7
	posy = 12
	face = 0
end

function runLogsA()
	while true do
		local advance = 0
		repeat
			advance = advance + 1
			sleep(0.01)
		until advance == 22
		for key,value in pairs(locations[3]) do
			objects[3][value] = 0
			if value < #objects[3] then
				locations[3][key] = locations[3][key] + 1
			else
				locations[3][key] = 1
			end
		end
		for key,value in pairs(locations[3]) do
			objects[3][value] = 1
		end
		if objects[posy][posx] == 0  and posy == 3 then
			posx = posx + 1
		end
	end
end

function runLogsB()
	while true do
		local advance = 0
		repeat
			advance = advance + 1
			sleep(0.01)
		until advance == 16
		for key,value in pairs(locations[5]) do
			objects[5][value] = 0
			if value < #objects[5] then
				locations[5][key] = locations[5][key] + 1
			else
				locations[5][key] = 1
			end
		end
		for key,value in pairs(locations[5]) do
			objects[5][value] = 1
		end
		if objects[posy][posx] == 0  and posy == 5 then
			posx = posx + 1
		end
	end
end

function runTurtlesA()
	while true do
		local advance = 0
		repeat
			advance = advance + 1
			sleep(0.01)
		until advance == 16
		for key,value in pairs(locations[4]) do
			objects[4][value] = 0
			if value > 1 then
				locations[4][key] = locations[4][key] - 1
			else
				locations[4][key] = #objects[4]
			end
		end
		for key,value in pairs(locations[4]) do
			objects[4][value] = 1
		end
		if objects[posy][posx] == 0  and posy == 4 then
			posx = posx - 1
		end
	end
end

function runTurtlesB()
	while true do
		local advance = 0
		repeat
			advance = advance + 1
			sleep(0.01)
		until advance == 16
		for key,value in pairs(locations[6]) do
			objects[6][value] = 0
			if value > 1 then
				locations[6][key] = locations[6][key] - 1
			else
				locations[6][key] = #objects[6]
			end
		end
		for key,value in pairs(locations[6]) do
			objects[6][value] = 1
		end
		if objects[posy][posx] == 0  and posy == 6 then
			posx = posx - 1
		end
	end
end

function runCarsA()
	while true do
		local advance = 0
		repeat
			advance = advance + 1
			sleep(0.01)
		until advance == 22
		for key,value in pairs(locations[8]) do
			objects[8][value] = 0
			if value < #objects[8] then
				objects[8][value+1] = 1
				locations[8][key] = locations[8][key] + 1
			else
				objects[8][1] = 1
				locations[8][key] = 1
			end
		end
	end
end

function runCarsB()
	while true do
		local advance = 0
		repeat
			advance = advance + 1
			sleep(0.01)
		until advance == 16
		for key,value in pairs(locations[10]) do
			objects[10][value] = 0
			if value < #objects[10] then
				objects[10][value+1] = 1
				locations[10][key] = locations[10][key] + 1
			else
				objects[10][1] = 1
				locations[10][key] = 1
			end
		end
	end
end

function runCarsC()
	while true do
		local advance = 0
		repeat
			advance = advance + 1
			sleep(0.01)
		until advance == 16
		for key,value in pairs(locations[9]) do
			objects[9][value] = 0
			if value > 1 then
				objects[9][value-1] = 1
				locations[9][key] = locations[9][key] - 1
			else
				objects[9][1] = #objects[9]
				locations[9][key] = #objects[9]
			end
		end
	end
end

function runCarsD()
	while true do
		local advance = 0
		repeat
			advance = advance + 1
			sleep(0.01)
		until advance == 16
		for key,value in pairs(locations[11]) do
			objects[11][value] = 0
			if value > 1 then
				objects[11][value-1] = 1
				locations[11][key] = locations[11][key] - 1
			else
				objects[11][1] = #objects[11]
				locations[11][key] = #objects[11]
			end
		end
	end
end

function runMove()
	while true do
		local id, key = os.pullEvent("key")
		-- DOWN = 208 UP = 200 LEFT = 203 RIGHT = 205 ENTER = 28
		if key == 200 and not death then
			posy = posy-1
			face = 0
		elseif key == 208 and not death then
			posy = posy+1
			face = 2
		elseif key == 203 and not death then
			posx = posx-1
			face = 3
		elseif key == 205 and not death then
			posx = posx+1
			face = 1
		end
	end
end

function checkDeath()
	while true do
		if death then
			sleep(3)
			death = false
			break
		end
		sleep(0.01)
	end
end

function drawFrogger()
	resetFrog()
	while true do
		term.clear()
		for i=1,terrainh do
			for j=1,terrainw do
				term.setCursorPos(j+woffset, i+hoffset)
				term.setBackgroundColor(returnColor(terrain[i][j]))
				write(" ")
				term.setCursorPos(j+woffset, i+hoffset)
				if i == 2 then
					if objects[i][j] == 2 then
						term.setTextColor(returnColor("4"))
						write("*")
					end
				elseif i == 3 or i == 5 then
					if objects[i][j]  == 0 then
						term.setBackgroundColor(returnColor("c"))
						write(" ")
					end
				elseif i == 4 or i == 6 then
					if objects[i][j]  == 0 then
						if turtlelevel == 3 then
							term.setBackgroundColor(returnColor("e"))
							term.setTextColor(returnColor("5"))
							write("O")
						elseif turtlelevel == 2 then
							term.setTextColor(returnColor("5"))
							write("O")
						elseif turtlelevel == 1 then
							term.setTextColor(returnColor("5"))
							write("o")
						end
					end
				elseif i == 8 or i == 10 then
					if objects[i][j]  == 1 then
						term.setTextColor(returnColor("e"))
						write(">")
					end
				elseif i == 9 or i == 11 then
					if objects[i][j]  == 1 then
						term.setTextColor(returnColor("a"))
						write("<")
					end
				end
				if posx == j and posy == i and not death then
					term.setCursorPos(j+woffset, i+hoffset)
					term.setTextColor(returnColor("5"))
					if face == 0 then
						write("^")
					elseif face == 1 then
						write(">")
					elseif face == 2 then
						write("v")
					elseif face == 3 then
						write("<")
					end
				elseif posx == j and posy == i and death then
					term.setCursorPos(j+woffset, i+hoffset)
					term.setTextColor(returnColor("e"))
					write("X")
				end
			end
		end
		sleep(0.01)
		if objects[posy][posx] == 1 or  posx < 1 or posx > 13 or posy > 13 then
			if posx < 1 then
				posx = posx + 1
			elseif posx > 13 then
				posx = posx - 1
			elseif posy > 13 then
				posy = posy - 1
			end
			death = true
		end
	end
end

if term.isColor() then
	while true do
		parallel.waitForAny(drawFrogger, runMove, runCarsA, runCarsB, runCarsC, runCarsD, checkDeath, runLogsA, runLogsB, runTurtlesA, runTurtlesB)
	end
end