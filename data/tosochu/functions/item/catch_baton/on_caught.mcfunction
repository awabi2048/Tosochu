# 逃走者確保

# tellraw
tellraw @a[tag=Tosochu.Participant] [{"text": "[","color": "white"},{"text": "逃走中","color": "blue","bold":true},{"text": "] ","color": "white"},{"selector":"@p","color": "red","bold": true},{"text": "が","color": "gold"},{"text": "確保","color": "gold","bold":true},{"text": "された。","color": "gold"}]

# 確保者に追加
tag @s add Tosochu.Caught
tag @s remove Tosochu.Escaper

function tosochu:stop_process
