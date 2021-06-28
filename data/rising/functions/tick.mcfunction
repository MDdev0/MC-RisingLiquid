#tick functions booyah

#Enable triggers
scoreboard players enable @a rising-status
scoreboard players enable @a rising-mode
scoreboard players enable @a rising-height
scoreboard players enable @a rising-delay
scoreboard players enable @a rising-death
scoreboard players enable @a rising-book

#Update triggers
execute if entity @a[scores={rising-status=1}] if score status rising-data matches 0 run function rising:start
execute as @a[scores={rising-status=1..2},limit=1] store result score status rising-data run scoreboard players get @s rising-status
execute if entity @a[scores={rising-status=1},limit=1] run tellraw @a [{"text":"[","color":"dark_red","bold":true},{"text":"Rising","color":"red","bold":false},{"text":"]"},{"text":" Game Started!","color":"aqua","bold":false}]
execute if entity @a[scores={rising-status=2},limit=1] run tellraw @a [{"text":"[","color":"dark_red","bold":true},{"text":"Rising","color":"red","bold":false},{"text":"]"},{"text":" Game Paused!","color":"light_purple","bold":false}]
scoreboard players reset @a[scores={rising-status=1..2}] rising-status

execute as @a[scores={rising-mode=1..2},limit=1] store result score mode rising-data run scoreboard players get @s rising-mode
execute if entity @a[scores={rising-mode=2},limit=1] run tellraw @a [{"text":"[","color":"dark_red","bold":true},{"text":"Rising","color":"red","bold":false},{"text":"]"},{"text":" Mode set to ","color":"yellow","bold":false},{"text":"WATER","color":"blue"},{"text":".","color":"yellow","bold":false}]
execute if entity @a[scores={rising-mode=1},limit=1] run tellraw @a [{"text":"[","color":"dark_red","bold":true},{"text":"Rising","color":"red","bold":false},{"text":"]"},{"text":" Mode set to ","color":"yellow","bold":false},{"text":"LAVA","color":"gold"},{"text":".","color":"yellow","bold":false}]
scoreboard players reset @a[scores={rising-mode=1..2}] rising-mode

execute as @a[scores={rising-height=1..256},limit=1] store result score height rising-data run scoreboard players get @s rising-height
execute if entity @a[scores={rising-height=1..},limit=1] run tellraw @a [{"text":"[","color":"dark_red","bold":true},{"text":"Rising","color":"red","bold":false},{"text":"]"},{"text":" Height set to ","color":"yellow","bold":false},{"score":{"name":"height","objective":"rising-data"},"color":"dark_green"},{"text":" blocks.","color":"yellow","bold":false}]
execute if entity @a[scores={rising-height=-1},limit=1] run function rising:raise_level
execute if entity @a[scores={rising-height=-1},limit=1] run tellraw @a [{"text":"[","color":"dark_red","bold":true},{"text":"Rising","color":"red","bold":false},{"text":"]"},{"text":" Level change manually triggered.","color":"dark_green","bold":false}]
execute as @a[scores={rising-height=-2},limit=1] run tellraw @s [{"text":"Click this to set a new value for ","color":"aqua","clickEvent":{"action":"suggest_command","value":"/trigger rising-height set <NEW HEIGHT>"}},{"text":"Height","color":"dark_green","bold":true,"clickEvent":{"action":"suggest_command","value":"/trigger rising-height set <NEW HEIGHT>"}}]
scoreboard players reset @a[scores={rising-height=-2..-1}] rising-height
scoreboard players reset @a[scores={rising-height=1..256}] rising-height

execute as @a[scores={rising-delay=1..},limit=1] store result score delay rising-data run scoreboard players get @s rising-delay
execute if entity @a[scores={rising-delay=1..},limit=1] run tellraw @a [{"text":"[","color":"dark_red","bold":true},{"text":"Rising","color":"red","bold":false},{"text":"]"},{"text":" Delay set to ","color":"yellow","bold":false},{"score":{"name":"delay","objective":"rising-data"},"color":"dark_aqua"},{"text":" seconds.","color":"yellow","bold":false}]
execute if entity @a[scores={rising-delay=-1},limit=1] run scoreboard players set second rising-data 0
execute if entity @a[scores={rising-delay=-1},limit=1] run scoreboard players set tick rising-data 0
execute if entity @a[scores={rising-delay=-1},limit=1] run tellraw @a [{"text":"[","color":"dark_red","bold":true},{"text":"Rising","color":"red","bold":false},{"text":"]"},{"text":" Timer reset manually triggered.","color":"dark_aqua","bold":false}]
execute as @a[scores={rising-delay=-2},limit=1] run tellraw @s [{"text":"Click this to set a new value for ","color":"aqua","clickEvent":{"action":"suggest_command","value":"/trigger rising-delay set <NEW DELAY IN SEC>"}},{"text":"Delay","color":"dark_aqua","bold":true,"clickEvent":{"action":"suggest_command","value":"/trigger rising-delay set <NEW DELAY IN SEC>"}}]
scoreboard players reset @a[scores={rising-delay=-2..-1}] rising-delay
scoreboard players reset @a[scores={rising-delay=1..}] rising-delay

execute as @a[scores={rising-death=1..2},limit=1] store result score permadeath rising-data run scoreboard players get @s rising-death
execute if entity @a[scores={rising-death=1},limit=1] run tellraw @a [{"text":"[","color":"dark_red","bold":true},{"text":"Rising","color":"red","bold":false},{"text":"]"},{"text":" Permadeath ","color":"yellow","bold":false},{"text":"ENABLED","color":"red"},{"text":".","color":"yellow","bold":false}]
execute if entity @a[scores={rising-death=2},limit=1] run tellraw @a [{"text":"[","color":"dark_red","bold":true},{"text":"Rising","color":"red","bold":false},{"text":"]"},{"text":" Permadeath ","color":"yellow","bold":false},{"text":"DISABLED","color":"green"},{"text":".","color":"yellow","bold":false}]
scoreboard players reset @a[scores={rising-death=1..2}] rising-death

execute as @a[scores={rising-book=1}] run give @s minecraft:written_book{display:{Name:'[{"text":"||","color":"white","bold":false,"italic":false,"obfuscated":true},{"text":" Rising Control Book ","color":"red","bold":true,"italic":true,"obfuscated":false},{"text":"||","color":"white","bold":false,"italic":false,"obfuscated":true}]',Lore:['{"text":"Used to control the parameters of a rising lava or water challenge. ","color":"gray","bold":true,"italic":true}']},title:"Rising Control Book",author:"The Void",generation:3,pages:['[{"text":"Rising Control Book\\n\\n","color":"red","bold":true,"underlined":true},{"text":"For Admin use only!\\n\\n","color":"reset","bold":false,"italic":false,"underlined":false,"strikethrough":false,"obfuscated":false,"hoverEvent":{"action":"show_text","value":[{"text":"I\'m looking at you, Steve.","color":"dark_red"}]}},{"text":"Change Mode\\n","color":"light_purple","bold":true,"italic":false,"underlined":false,"hoverEvent":{"action":"show_text","value":[{"text":"Changing these mid-game may cause unintended side effects!","color":"dark_purple","italic":true}]}},{"text":"LAVA","color":"gold","bold":false,"italic":true,"underlined":false,"strikethrough":false,"obfuscated":false,"hoverEvent":{"action":"show_text","value":[{"text":"The map will flood with lava.","color":"yellow","italic":true}]},"clickEvent":{"action":"run_command","value":"/trigger rising-mode set 1"}},{"text":" ","color":"black","bold":false,"italic":false,"underlined":false,"strikethrough":false,"obfuscated":false},{"text":"WATER","color":"blue","bold":false,"italic":true,"underlined":false,"strikethrough":false,"obfuscated":false,"hoverEvent":{"action":"show_text","value":[{"text":"The map will flood with water.","color":"yellow","italic":true}]},"clickEvent":{"action":"run_command","value":"/trigger rising-mode set 2"}},{"text":"\\n\\n","color":"reset","bold":false,"italic":false,"underlined":false,"strikethrough":false,"obfuscated":false},{"text":"Set Parameters\\n","color":"dark_purple","bold":true,"italic":false,"underlined":false,"strikethrough":false,"obfuscated":false,"hoverEvent":{"action":"show_text","value":[{"text":"Safe to change mid-game.","color":"dark_purple","italic":true}]}},{"text":"Set Height","color":"dark_green","bold":false,"italic":true,"underlined":false,"strikethrough":false,"obfuscated":false,"hoverEvent":{"action":"show_text","value":[{"text":"The next y-layer to be filled.","color":"yellow","italic":true}]},"clickEvent":{"action":"run_command","value":"/trigger rising-height set -2"}},{"text":" ","color":"reset","bold":false,"italic":false,"underlined":false,"strikethrough":false,"obfuscated":false},{"text":"[Trigger]","color":"dark_gray","bold":false,"italic":false,"underlined":false,"strikethrough":false,"obfuscated":false,"hoverEvent":{"action":"show_text","value":[{"text":"Manually triggers a fill of the next y-level.","color":"yellow","italic":true}]},"clickEvent":{"action":"run_command","value":"/trigger rising-height set -1"}},{"text":"\\n","color":"reset","bold":false,"italic":false,"underlined":false,"strikethrough":false,"obfuscated":false},{"text":"Set Delay","color":"dark_aqua","bold":false,"italic":true,"underlined":false,"strikethrough":false,"obfuscated":false,"hoverEvent":{"action":"show_text","value":[{"text":"The time ","color":"yellow","italic":true},{"text":"in seconds","color":"red","bold":true},{"text":" between the lava/water rising by one block.","color":"yellow"}]},"clickEvent":{"action":"run_command","value":"/trigger rising-delay set -2"}},{"text":" ","color":"reset","bold":false,"italic":false,"underlined":false,"strikethrough":false,"obfuscated":false,"hoverEvent":{"action":"show_text","value":[{"text":"","italic":true}]}},{"text":"[Reset]","color":"gray","bold":false,"italic":false,"underlined":false,"strikethrough":false,"obfuscated":false,"hoverEvent":{"action":"show_text","value":[{"text":"Reset the timer for the next level rise.","color":"yellow","italic":true}]},"clickEvent":{"action":"run_command","value":"/trigger rising-delay"}},{"text":"\\n\\n","color":"reset","bold":false,"italic":false,"underlined":false,"strikethrough":false,"obfuscated":false},{"text":"Toggle Permadeath\\n","color":"dark_red","bold":true,"italic":false,"underlined":false,"strikethrough":false,"obfuscated":false,"hoverEvent":{"action":"show_text","value":[{"text":"Safe to change mid-game.","color":"dark_purple","italic":true}]}},{"text":"ON","color":"red","bold":false,"italic":true,"underlined":false,"strikethrough":false,"obfuscated":false,"hoverEvent":{"action":"show_text","value":[{"text":"Players will not respawn.","color":"yellow","italic":true}]},"clickEvent":{"action":"run_command","value":"/trigger rising-death set 1"}},{"text":" ","color":"black","bold":false,"italic":false,"underlined":false,"strikethrough":false,"obfuscated":false},{"text":"OFF","color":"green","bold":false,"italic":true,"underlined":false,"strikethrough":false,"obfuscated":false,"hoverEvent":{"action":"show_text","value":[{"text":"Players will respawn.","color":"yellow","italic":true}]},"clickEvent":{"action":"run_command","value":"/trigger rising-death set 2"}}]','[{"text":"Start/Stop\\n\\n","bold":true,"underlined":true},{"text":"Start the game!","color":"dark_green","bold":false,"italic":true,"underlined":false,"hoverEvent":{"action":"show_text","value":[{"text":"Starts the game.","color":"yellow","italic":true}]},"clickEvent":{"action":"run_command","value":"/trigger rising-status set 1"}},{"text":"\\n","color":"reset","bold":false,"italic":false,"underlined":false,"hoverEvent":{"action":"show_text","value":[{"text":"","color":"yellow","italic":true}]}},{"text":"Stop the game!","color":"red","bold":false,"italic":true,"underlined":false,"hoverEvent":{"action":"show_text","value":[{"text":"Pauses the game.","color":"yellow","italic":true}]},"clickEvent":{"action":"run_command","value":"/trigger rising-status set 2"}}]']} 1
scoreboard players reset @a[scores={rising-book=1}] rising-book

#Display
execute if score status rising-data matches 1 run bossbar set minecraft:rising players @a
execute if score status rising-data matches 1 store result bossbar minecraft:rising value run scoreboard players get height rising-data
execute if score status rising-data matches 1 run bossbar set rising name [{"text":"Next Layer: ","color":"white"},{"score":{"name":"height","objective":"rising-data"},"color":"light_purple"},{"text":" Rising in: "},{"score":{"name":"second","objective":"rising-data"},"color":"yellow"},{"text":"/","color":"gold"},{"score":{"name":"delay","objective":"rising-data"},"color":"red"}]
execute if score mode rising-data matches 1 run bossbar set minecraft:rising color red
execute if score mode rising-data matches 2 run bossbar set minecraft:rising color blue

#Permadeath
execute if score status rising-data matches 1 if score permadeath rising-data matches 2 run gamemode spectator @a[scores={deathevent=1..},gamemode=!spectator]

#Raise level 
execute if score status rising-data matches 1 if score second rising-data >= delay rising-data run function rising:raise_level

#Run clock if game is running
execute if score status rising-data matches 1 run scoreboard players add tick rising-data 1
execute if score tick rising-data matches 20 run scoreboard players add second rising-data 1
execute if score tick rising-data matches 20.. run scoreboard players set tick rising-data 0

#Stop
execute if score height rising-data matches 256.. if score status rising-data matches 1..2 run tellraw @a [{"text":"[","color":"dark_red","bold":true},{"text":"Rising","color":"red","bold":false},{"text":"]"},{"text":" The whole map has been filled. Game stopped.","color":"gray","bold":false}]
execute if score height rising-data matches 256.. if score status rising-data matches 1..2 run scoreboard players set status rising-data 0