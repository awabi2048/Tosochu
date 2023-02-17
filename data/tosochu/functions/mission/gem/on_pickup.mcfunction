# 宝玉回収
# トリガー解除
advancement revoke @s only tosochu:mission/gem/on_pickup

# 告知
execute as @e[tag=Tosochu.EventMarker,distance=..8] if data entity @s {data:{Tosochu:{Name:"GemPickup"}}} run data modify storage tosochu:temp Season set from entity @s data.Tosochu.Season
tellraw @a[tag=Tosochu.Participant] [{"nbt":"Message.Core.Prefix","storage":"tosochu:system","interpret": true},{"selector":"@s","color": "gold","bold": true},{"nbt":"Message.Mission.GemPicked","storage":"tosochu:system","interpret": true}]

