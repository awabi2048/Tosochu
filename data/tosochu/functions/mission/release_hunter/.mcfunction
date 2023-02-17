# ハンター開放
# 移動
execute as @e[tag=Tosochu.EventMarker] if data entity @s {data:{Tosochu:{Name:"Start"}}} at @s run spreadplayers ~ ~ 3 3 false @a[tag=Tosochu.PreHunter]
tag @a[tag=Tosochu.PreHunter] add Tosochu.Hunter
tag @a[tag=Tosochu.PreHunter] remove Tosochu.PreHunter

# 演出
execute as @a[tag=Tosochu.Escaper] at @s run playsound block.note_block.pling master @s ~ ~ ~ 1 0.5
execute as @a[tag=Tosochu.Escaper] at @s run playsound minecraft:entity.wither.spawn master @s ~ ~ ~ 1 0.75

# 通達
tellraw @a[tag=Tosochu.Participant] [{"nbt":"Message.Core.Prefix","storage":"tosochu:system","interpret": true},{"nbt":"Message.Core.Notification","storage":"tosochu:system","interpret": true},{"text": "ハンターが開放された。","color": "red","bold": true}]

