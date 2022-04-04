fx_version 'cerulean'
games { 'rdr3', 'gta5' }

author 'Sm1Ly'
description 'A resource you can use to make api calls to you server'
version '1.5'
stay_up_to_date 'true'

server_scripts {

	-- happi api builder library files
	"lib/happi/config/*.lua",
	"lib/happi/handlers/*.lua",
	"lib/happi/api.lua",
	"lib/happi/src/vcheck.lua",

	-- your source code
	"src/server/meta/*.lua",
	"src/server/*.lua",

}