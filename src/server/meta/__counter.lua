counter = {}

function counter.new()

	return setmetatable({
		count = 0,
		perc = 0
	}, {
		__index = counter,
		__call = function(self)
			self.count = self.count + 1
		end,
		__tostring = __meta.tostring,
		__metatable = nil
	})

end

function counter:percentage(percentage)
	self.perc = percentage or self.perc
	return self.perc
end