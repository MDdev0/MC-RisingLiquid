#Starts the rising game running

bossbar add rising {"text":""}
bossbar set minecraft:rising max 255

worldborder set 150
setworldspawn 0 100 0
spreadplayers ~ ~ 0 5 false @a

summon minecraft:armor_stand 0 0 0 {NoGravity:1b,Invulnerable:1b,Marker:1b,Invisible:1b,PersistenceRequired:1b,Tags:["rising-marker"]}

scoreboard players set status rising-data 1