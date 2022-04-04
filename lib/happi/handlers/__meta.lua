__meta = {}

function __meta.collection()
	return setmetatable({}, { __index = __meta })
end

function __meta.tostring(self)
	
	local function tPrint(tbl, indent)

		indent = indent or 0

		for k, v in pairs(tbl) do

			local tblType = type(v)
			local formatting = ("%s ^3%s:^0"):format(string.rep("  ", indent), k)

			if tblType == "table" then
				print(formatting)
				tPrint(v, indent + 1)
			elseif tblType == 'boolean' then
				print(("%s^1 %s ^0"):format(formatting, v))
			elseif tblType == "function" then
				print(("%s^9 %s ^0"):format(formatting, v))
			elseif tblType == 'number' then
				print(("%s^5 %s ^0"):format(formatting, v))
			elseif tblType == 'string' then
				print(("%s ^2'%s' ^0"):format(formatting, v))
			else
				print(("%s^2 %s ^0"):format(formatting, v))
			end

		end

		return ''

	end

	print('start of debug\n')

	return tPrint(self, 0)..'\nend of debug'

end

function __meta.split(heystack, needle)

	if heystack == nil then return end

	local result = {}

	local from = 1
	local delim_from, delim_to = string.find(heystack, needle, from)

	while delim_from do
		result[#result+1] = string.sub(heystack, from, delim_from - 1)
		from = delim_to + 1
		delim_from, delim_to = string.find(heystack, needle, from)
	end

	result[#result+1] = string.sub(heystack, from)

	return result

end

-- including self keyword
function __meta:randomChar()
	local char = math.random(1, 3)
	return string.char((
		char == 2 and (
			char == 3 and math.random(97, 122) or math.random(65,  90)
		) or math.random(48,  57)
	))
end

function __meta:randomStr(length)
	if length <= 0 then return '' end
	return self:randomStr(length - 1) .. self:randomChar()
end