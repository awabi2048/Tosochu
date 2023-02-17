# ゲーム開始
# フラグ
data modify storage tosochu: InEvent set value false

# タイマー設定
data modify storage tosochu: Timer.Value set value -1

# ボスバー削除
bossbar remove tosochu:timer

# 告知
tellraw @a[tag=Tosochu.Participant] [{"nbt":"Message.Core.Prefix","storage":"tosochu:system","interpret": true},{"nbt":"Message.Game.End","storage":"tosochu:system","interpret": true}]

# 逃走成功 or 失敗
title @a[tag=Tosochu.Participant] times 10 100 10

execute unless entity @a[tag=Tosochu.Escaper] run title @a[tag=Tosochu.Caught] title {"nbt":"Message.Game.EscapeFailed","storage":"tosochu:system","interpret": true}
execute unless entity @a[tag=Tosochu.Escaper] as @a[tag=Tosochu.Caught] at @s run playsound entity.wither.spawn master @s ~ ~ ~ 1 1

execute if entity @a[tag=Tosochu.Escaper] run title @a[tag=Tosochu.Caught] title {"nbt":"Message.Game.EscapeSucceeded","storage":"tosochu:system","interpret": true}

execute if entity @a[tag=Tosochu.Escaper] as @a[tag=Tosochu.Caught] at @s run playsound entity.player.levelup master @s ~ ~ ~ 1 1
execute if entity @a[tag=Tosochu.Escaper] as @a[tag=Tosochu.Escaper] at @s run playsound block.note_block.pling master @s ~ ~ ~ 1 2

# 演出
execute as @a[tag=Tosochu.Participant] at @s run playsound entity.player.levelup master @s ~ ~ ~ 1 0.5
execute as @a[tag=Tosochu.Participant] at @s run playsound entity.experience_orb.pickup master @s ~ ~ ~ 1 0.5

# タグ関係リセット
tag @a remove Tosochu.Participant
tag @a remove Tosochu.Escaper
tag @a remove Tosochu.Hunter
tag @a remove Tosochu.Caught
tag @a remove Tosochu.PreHunter
