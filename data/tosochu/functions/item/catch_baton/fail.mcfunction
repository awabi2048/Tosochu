# 確保アイテム使用時: 失敗
# 演出
playsound entity.enderman.teleport master @s ~ ~ ~ 1 0.5

# tellraw
tellraw @s [{"text": "[","color": "white"},{"text": "逃走中","color": "blue","bold":true},{"text": "] ","color": "white"},{"text": "アイテムのクールタイム中です。","color": "red"}]

# 現在のgametimeを記録
execute store result storage tosochu:temp CurrentGametime int 1 run time query gametime
item modify entity @s weapon.mainhand tosochu:core/record_gametime
