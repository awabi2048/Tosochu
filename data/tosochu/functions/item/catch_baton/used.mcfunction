# 確保アイテム使用時実行
#Memo: as 使用プレイヤー at @s

# クールタイム中でないか確認
# gametime取得、最後使用時のgametimeとの差が一定以上なら使用を許可
execute store result score $TimeDifference Tosochu.Temp run time query gametime
execute store result score $LastUsedTime Tosochu.Temp run data get entity @s SelectedItem.tag.Tosochu.LastUsedTime

execute store result score $ItemCooldown Tosochu.Temp run data get storage tosochu:system Item.Cooldown.CatchBaton

scoreboard players operation $TimeDifference Tosochu.Temp -= $LastUsedTime Tosochu.Temp
execute unless score $TimeDifference Tosochu.Temp >= $ItemCooldown Tosochu.Temp run function tosochu:item/catch_baton/fail
execute if score $TimeDifference Tosochu.Temp >= $ItemCooldown Tosochu.Temp run function tosochu:item/catch_baton/success
