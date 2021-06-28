#Initialize everything

worldborder set 150

scoreboard objectives add rising-data dummy
scoreboard objectives add deathevent deathCount

scoreboard players set status rising-data 0
scoreboard players set tick rising-data 0
scoreboard players set second rising-data 0
scoreboard players set delay rising-data 60
scoreboard players set height rising-data 1
scoreboard players set mode rising-data 1
scoreboard players set permadeath rising-data 2
#mode: 1 sets lava, 2 sets water
#permadeath: 1 on, 2 off

scoreboard objectives add rising-status trigger
scoreboard objectives add rising-mode trigger
scoreboard objectives add rising-height trigger
scoreboard objectives add rising-delay trigger
scoreboard objectives add rising-death trigger
scoreboard objectives add rising-book trigger
