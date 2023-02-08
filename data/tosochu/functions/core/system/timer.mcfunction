# タイマーループ処理 (exe /20t)
# タイマーを減算
execute store result storage tosochu: Timer.Value int 0.9999999 run data get storage tosochu: Timer.Value

# 一般的な表記に変換 & ボスバーに適用
execute store result score $Timer:second Tosochu run data get storage tosochu: Timer.Value

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

    # 適用
    bossbar set tosochu:timer name [{"text": "残り時間: ","color": "yellow","bold": true},{"nbt":"Timer.0Padding[0]", "storage": "tosochu:"},{"score":{"name": "$Timer:hour","objective": "Tosochu"}},":",{"nbt":"Timer.0Padding[1]", "storage": "tosochu:"},{"score":{"name": "$Timer:minute","objective": "Tosochu"}},":",{"nbt":"Timer.0Padding[2]", "storage": "tosochu:"},{"score":{"name": "$Timer:second","objective": "Tosochu"}}]
    execute store result bossbar tosochu:timer value run data get storage tosochu: Timer.Value

# スコアリセット
scoreboard players set $Timer Tosochu 0
