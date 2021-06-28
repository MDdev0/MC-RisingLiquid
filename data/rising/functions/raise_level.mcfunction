#Teleports up to selected height, fills the layer with the selected fluid.

scoreboard players set second rising-data 0

execute as @e[type=armor_stand,tag=rising-marker] store result entity @s Pos[1] double 1 run scoreboard players get height rising-data

execute if score mode rising-data matches 1 as @e[tag=rising-marker] at @s run fill ~-75 ~ ~-75 ~75 ~ ~75 minecraft:lava replace minecraft:air
execute if score mode rising-data matches 1 as @e[tag=rising-marker] at @s run fill ~-75 ~ ~-75 ~75 ~ ~75 minecraft:lava replace minecraft:cave_air
execute if score mode rising-data matches 2 as @e[tag=rising-marker] at @s run fill ~-75 ~ ~-75 ~75 ~ ~75 minecraft:water replace minecraft:air
execute if score mode rising-data matches 2 as @e[tag=rising-marker] at @s run fill ~-75 ~ ~-75 ~75 ~ ~75 minecraft:water replace minecraft:cave_air

scoreboard players add height rising-data 1