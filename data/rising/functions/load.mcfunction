scoreboard objectives add rising-data dummy
execute unless score status rising-data matches 0..2 run function rising:init