-- poll storage
CurrentPoll = {}

-- create api
local Api = api.create()
local parties = {}

-- http://127.0.0.1:30120/polls/new?a=hans&b=piet&c=henk
Api.route('GET', 'new', function(params, response)
	-- register parties
	for _, party in pairs(params) do
		parties[#parties + 1] = tostring(party)
	end
	-- set current poll
	CurrentPoll = Poll.new(parties)
	response(200, "poll created")
end)

-- http://127.0.0.1:30120/polls/vote?party=hans&name=jansen&id=jdilabvislasbviloasu
Api.route('GET', 'vote', function(params, response)
	if (params.party and params.name and params.id) ~= nil then
		CurrentPoll:vote(params.party, params.name, params.id)
		response(200, "poll created")
		print(CurrentPoll)
	else
		response(305, "poll created")
	end
end)

-- testing zone
Api.fetch('http://127.0.0.1:30120/polls/new?a=hans&b=piet&c=henk', function(a, b, c)
	if a then
		for i = 1, 250 do
			Api.fetch(('http://127.0.0.1:30120/polls/vote?party=%s&name=jansen&id=%s'):format(parties[math.random(1, #parties)], __meta:randomStr(10)), function(a, b, c) end)
		end
	end
end)