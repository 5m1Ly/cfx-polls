Poll = {}

function Poll.new(tbl)

	local data = {
		parties = {},
		voters = {},
		total = 0
	}

	for i = 1, #tbl do
		data.parties[tbl[i]] = counter.new()
	end

	return setmetatable(data, {
		__index = Poll,
		__tostring = __meta.tostring,
		__metatable = nil
	})

end

function Poll:vote(party, name, id)

	if id ~= nil then

		-- check if person has voted
		local voted = false
		for vid, _ in pairs(self.voters) do	
			if vid == id then voted = true end
		end
	
		-- add vote if not voted yet
		if not voted then
			self.voters[id] = name
			self.parties[party]()
			self.total = self.total + 1
		end

		for name, _ in pairs(self.parties) do

			-- calculate percentage
			local perc = math.floor((self.parties[name].count / self.total) * 100)

			-- set percentage
			self.parties[name].perc = perc

		end

	end

end