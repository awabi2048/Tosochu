# 逃走者確保
# 確保通達
tellraw @a[tag=Tosochu.Participant] [{"nbt":"Message.Core.Prefix","storage":"tosochu:system","interpret": true},{"nbt":"Message.Core.Notification","storage":"tosochu:system","interpret": true},{"selector":"@p","color": "red","bold": true},{"nbt":"Message.Game.SomeoneCaught","storage":"tosochu:system","interpret": true}]

# 確保者に追加
tag @s add Tosochu.Caught
tag @s remove Tosochu.Escaper

# 牢屋にtp
tp @s @e[tag=Tosochu.Prison,limit=1]

# 演出
execute as @a[tag=Tosochu.Participant] at @s run playsound minecraft:entity.player.hurt master @s ~ ~ ~ 1 0.75
execute as @a[tag=Tosochu.Participant] at @s run playsound minecraft:block.note_block.pling master @s ~ ~ ~ 1 0.8

# 全員確保されたら強制終了
execute unless entity @a[tag=Tosochu.Escaper] run tellraw @a[tag=Tosochu.Participant] [{"nbt":"Message.Core.Prefix","storage":"tosochu:system","interpret": true},{"nbt":"Message.Core.Notification","storage":"tosochu:system","interpret": true},{"nbt":"Message.Game.AllEscapersCaught","storage":"tosochu:system","interpret": true}]
execute unless entity @a[tag=Tosochu.Escaper] run function #tosochu:system/end_game

# 処理停止
function tosochu:stop_process
