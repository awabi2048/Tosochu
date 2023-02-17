# 確保アイテム使用時: 失敗
# 演出
playsound entity.enderman.teleport master @s ~ ~ ~ 1 0.5

# tellraw
tellraw @s [{"nbt":"Message.Core.Prefix","storage":"tosochu:system","interpret": true},{"nbt":"Message.Item.OnCooldown","storage":"tosochu:system","interpret": true}]
