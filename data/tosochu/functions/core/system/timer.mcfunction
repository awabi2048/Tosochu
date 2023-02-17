# タイマーループ処理 (exe /20t)
# タイマーを減算
execute store result storage tosochu: Timer.Value int 0.9999999 run data get storage tosochu: Timer.Value

# 一般的な表記に変換 & ボスバーに適用
execute store result score $Timer:value Tosochu.Temp run data get storage tosochu: Timer.Value
scoreboard players operation $Timer:second Tosochu = $Timer:value Tosochu.Temp

    # 分
    scoreboard players operation $Timer:minute Tosochu = $Timer:second Tosochu
    scoreboard players operation $Timer:minute Tosochu /= #60 Constant

    # 時
    scoreboard players operation $Timer:hour Tosochu = $Timer:minute Tosochu
    scoreboard players operation $Timer:hour Tosochu /= #60 Constant

    # 秒
    scoreboard players operation $Timer:second Tosochu %= #60 Constant

    scoreboard players operation $Timer:minute Tosochu %= #60 Constant

    # 0padding用の設定
    data modify storage tosochu: Timer.0Padding set value ["0", "0", "0"]

    execute if score $Timer:hour Tosochu matches 10.. run data modify storage tosochu: Timer.0Padding[0] set value ""
    execute if score $Timer:minute Tosochu matches 10.. run data modify storage tosochu: Timer.0Padding[1] set value ""
    execute if score $Timer:second Tosochu matches 10.. run data modify storage tosochu: Timer.0Padding[2] set value ""

    # 適用, 残り時間によって色分け
    execute if score $Timer:value Tosochu.Temp matches 2701..5400 run bossbar set tosochu:timer name [{"text": "残り時間: ","color": "#DDD605","bold": true},{"text": "","color":"white","bold": true,"extra":[{"nbt":"Timer.0Padding[0]", "storage": "tosochu:"},{"score":{"name": "$Timer:hour","objective": "Tosochu"}},":",{"nbt":"Timer.0Padding[1]", "storage": "tosochu:"},{"score":{"name": "$Timer:minute","objective": "Tosochu"}},":",{"nbt":"Timer.0Padding[2]", "storage": "tosochu:"},{"score":{"name": "$Timer:second","objective": "Tosochu"}}]}]
    execute if score $Timer:value Tosochu.Temp matches 901..2700 run bossbar set tosochu:timer name [{"text": "残り時間: ","color": "#DDD605","bold": true},{"text": "","color":"yellow","bold": true,"extra":[{"nbt":"Timer.0Padding[0]", "storage": "tosochu:"},{"score":{"name": "$Timer:hour","objective": "Tosochu"}},":",{"nbt":"Timer.0Padding[1]", "storage": "tosochu:"},{"score":{"name": "$Timer:minute","objective": "Tosochu"}},":",{"nbt":"Timer.0Padding[2]", "storage": "tosochu:"},{"score":{"name": "$Timer:second","objective": "Tosochu"}}]}]
    execute if score $Timer:value Tosochu.Temp matches 0..900 run bossbar set tosochu:timer name [{"text": "残り時間: ","color": "#DDD605","bold": true},{"text": "","color":"gold","bold": true,"extra":[{"nbt":"Timer.0Padding[0]", "storage": "tosochu:"},{"score":{"name": "$Timer:hour","objective": "Tosochu"}},":",{"nbt":"Timer.0Padding[1]", "storage": "tosochu:"},{"score":{"name": "$Timer:minute","objective": "Tosochu"}},":",{"nbt":"Timer.0Padding[2]", "storage": "tosochu:"},{"score":{"name": "$Timer:second","objective": "Tosochu"}}]}]
    
    execute store result bossbar tosochu:timer value run data get storage tosochu: Timer.Value

# スコアリセット
scoreboard players set $Timer Tosochu 0

# 逃走者告知
scoreboard players operation $Timer:value Tosochu.Temp %= #120 Constant 
execute store result storage tosochu:temp Game.EscaperCount int 1 if entity @a[tag=Tosochu.Escaper]

execute if score $Timer:value Tosochu.Temp matches 0 if entity @a[tag=Tosochu.Escaper] unless data storage tosochu:temp {Game:{EscaperCount:1}} run tellraw @a[tag=Tosochu.Participant] [{"nbt":"Message.Core.Prefix","storage":"tosochu:system","interpret": true},{"nbt":"Message.Game.TellrawEscaper","storage":"tosochu:system","interpret": true},{"selector":"@a[tag=Tosochu.Escaper]","color": "yellow","bold": true},{"text": " の","color": "gold","bold": false},{"text": "","color": "gold","bold": true,"extra":[{"nbt":"Game.EscaperCount","storage": "tosochu:temp"},{"text": "人"}]},{"text": "です。","color": "gold","bold": false}]
execute if score $Timer:value Tosochu.Temp matches 0 if entity @a[tag=Tosochu.Escaper] if data storage tosochu:temp {Game:{EscaperCount:1}} run tellraw @a[tag=Tosochu.Participant] [{"nbt":"Message.Core.Prefix","storage":"tosochu:system","interpret": true},{"nbt":"Message.Game.TellrawEscaper","storage":"tosochu:system","interpret": true},{"selector":"@a[tag=Tosochu.Escaper]","color": "yellow","bold": true},{"text": " のみです。","color": "gold","bold": false}]

execute if score $Timer:value Tosochu.Temp matches 0 if entity @a[tag=Tosochu.Escaper] as @a[tag=Tosochu.Participant] at @s run playsound block.note_block.pling master @s ~ ~ ~ 0.5 1.25

# 終了処理
execute if data storage tosochu: {Timer:{Value:0}} run function tosochu:core/system/end_game
