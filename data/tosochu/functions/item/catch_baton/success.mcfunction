# 確保アイテム使用時: 成功
# 演出
playsound ui.button.click master @s ~ ~ ~ 1 1.5

# 現在のgametimeを記録
execute store result storage tosochu:temp CurrentGametime int 1 run time query gametime
item modify entity @s weapon.mainhand tosochu:core/record_gametime

# 視点先検知
execute anchored eyes run function tosochu:item/catch_baton/raycast
