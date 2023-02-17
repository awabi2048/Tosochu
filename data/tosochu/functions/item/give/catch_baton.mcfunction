# 確保アイテム付与
give @s carrot_on_a_stick{Tosochu:{TriggerRightClick:true,ID:"CatchBaton"}}

execute if entity @s[tag=Tosochu.Debug] run tellraw @s [{"nbt":"Message.Core.Prefix","storage":"tosochu:system","interpret": true},{"nbt":"Message.Item.Give","storage":"tosochu:system","interpret": true},{"text": "\"確保棒\"","color": "gold","bold": false}]
