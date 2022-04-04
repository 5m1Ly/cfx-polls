Path = {}

function Path.new(method, path, handler)
	return setmetatable({
		path = path,
		method = method,
		handler = handler
	}, {
		__index = Path,
		__call = function(self, p, r)
			return self.handler(p, r)
		end,
		__tostring = __meta.tostring,
		__metatable = nil
	})
end