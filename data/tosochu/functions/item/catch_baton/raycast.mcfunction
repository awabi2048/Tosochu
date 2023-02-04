# 視点先検知
execute as @a[tag=Tosochu.Escaper,dx=0] positioned ~-0.75 ~-0.75 ~-0.75 if entity @s[dx=0] run function tosochu:item/catch_baton/on_caught

execute positioned ^ ^ ^0.25 if entity @s[distance=..4] run function tosochu:item/catch_baton/raycast
