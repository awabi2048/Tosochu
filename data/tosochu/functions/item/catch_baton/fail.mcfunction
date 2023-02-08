# 確保アイテム使用時: 失敗
# 演出
playsound entity.enderman.teleport master @s ~ ~ ~ 1 0.5

# tellraw
tellraw @s [{"nbt":"Message.Prefix","storage":"tosochu:system","interpret": true},{"nbt":"Message.OnCooldown","storage":"tosochu:system","interpret": true}]
