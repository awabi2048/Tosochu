# 視点先検知
particle dust 1 0 0 1 ~ ~ ~ 0 0 0 0 1

execute as @a[tag=Tosochu.Escaper,distance=..50,limit=1] positioned ~-50 ~-50 ~-50 if predicate hitbox:hitbox at @s run function tosochu:item/catch_baton/on_caught

execute positioned ^ ^ ^0.25 if entity @s[distance=..6] if block ~ ~ ~ air run function tosochu:item/catch_baton/raycast
