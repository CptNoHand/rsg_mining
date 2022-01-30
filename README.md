# RexshackGaming
- discord : https://discord.gg/s5uSk56B65
- youtube : https://www.youtube.com/channel/UCikEgGfXO-HCPxV5rYHEVbA
- github : https://github.com/RexShack
- website : https://www.rexshack.com

# Framework QBCore RedM Edition
- https://github.com/qbcore-redm-framework

# Server Game Build
- https://docs.fivem.net/docs/server-manual/server-commands/#sv_enforcegamebuild-build
- add to your server.cfg : sv_enforceGameBuild 1436

# Description
- mine for resouces around the map
- pickaxe required to mine

# Installation
1. extract the contents of the rsg_mining.zip
2. add it to your resources folder
3. Add the following to your resources\[qbr]\qbr-core\shared\items.lua

### items.lua

	["pickaxe"]						= {["name"] = "pickaxe",					["label"] = "Pickaxe",					["weight"] = 100,	["type"] = "item",	["image"] = "rsg_pickaxe.png",				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	['combinable'] = nil,	['level'] = 0,	["description"] = "equipment for mining"},
	["smallnugget"]					= {["name"] = "smallnugget",				["label"] = "Small Nugget",				["weight"] = 100,	["type"] = "item",	["image"] = "rsg_smallnugget.png",			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	['combinable'] = nil,	['level'] = 0,	["description"] = "small gold nugget"},
	["mediumnugget"]				= {["name"] = "mediumnugget",				["label"] = "Medium Nugget",			["weight"] = 200,	["type"] = "item",	["image"] = "rsg_mediumnugget.png",			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	['combinable'] = nil,	['level'] = 0,	["description"] = "medium gold nugget"},
	["largenugget"]					= {["name"] = "largenugget",				["label"] = "Large Nugget",				["weight"] = 300,	["type"] = "item",	["image"] = "rsg_largenugget.png",			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	['combinable'] = nil,	['level'] = 0,	["description"] = "large gold nugget"},
	["copper"]						= {["name"] = "copper",						["label"] = "Copper",					["weight"] = 100,	["type"] = "item",	["image"] = "rsg_copper.png",				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	['combinable'] = nil,	['level'] = 0,	["description"] = "crafting material"},
	["aluminum"]					= {["name"] = "aluminum",					["label"] = "Aluminum",					["weight"] = 100,	["type"] = "item",	["image"] = "rsg_aluminum.png",				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	['combinable'] = nil,	['level'] = 0,	["description"] = "crafting material"},
	["iron"]						= {["name"] = "iron",						["label"] = "Iron",						["weight"] = 100,	["type"] = "item",	["image"] = "rsg_iron.png",					['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	['combinable'] = nil,	['level'] = 0,	["description"] = "crafting material"},
	["steel"]						= {["name"] = "steel",						["label"] = "Steel",					["weight"] = 100,	["type"] = "item",	["image"] = "rsg_steel.png",				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	['combinable'] = nil,	['level'] = 0,	["description"] = "crafting material"},

4. Add the following to your "server.cfg"

ensure rsg_mining

# consider donating:
- https://www.buymeacoffee.com/rexshack