# ゲーム開始
# フラグ
data modify storage tosochu: InEvent set value true

# タイマー設定
data modify storage tosochu: Timer.Value set value 5400

# タイマーリセット
scoreboard players set $Timer Tosochu 0

# タイマー用ボスバー設定
bossbar add tosochu:timer [{"text": "残り時間: ","color": "yellow","bold": true},{"nbt":"Timer.0Padding[0]", "storage": "tosochu:"},{"score":{"name": "$Timer:hour","objective": "Tosochu"}},":",{"nbt":"Timer.0Padding[1]", "storage": "tosochu:"},{"score":{"name": "$Timer:minute","objective": "Tosochu"}},":",{"nbt":"Timer.0Padding[2]", "storage": "tosochu:"},{"score":{"name": "$Timer:second","objective": "Tosochu"}}]

bossbar set tosochu:timer max 5400
bossbar set tosochu:timer value 5400

bossbar set tosochu:timer players @a[tag=Tosochu.Participant]
bossbar set tosochu:timer color white
bossbar set tosochu:timer style notched_10

# タグ関係
    # リセット
    tag @a remove Tosochu.Participant
    tag @a remove Tosochu.Escaper
    tag @a remove Tosochu.Hunter
    tag @a remove Tosochu.PreHunter

    # 逃走者待機所のプレイヤーに追加
    execute at @e[tag=Tosochu.WaitingArea] as @a[distance=..3] run tag @s add Tosochu.Participant
    execute at @e[tag=Tosochu.WaitingArea] as @a[distance=..3] run tag @s add Tosochu.Escaper

    # ハンター待機所のプレイヤーに追加
    execute at @e[tag=Tosochu.HunterWaitingArea] as @a[distance=..3] run tag @s add Tosochu.Participant
    execute at @e[tag=Tosochu.HunterWaitingArea] as @a[distance=..3] run tag @s add Tosochu.PreHunter

# 各プレイヤー移動
execute as @e[tag=Tosochu.EventMarker] if data entity @s {data:{Tosochu:{Name:"Start"}}} at @s run spreadplayers ~ ~ 3 3 false @a[tag=Tosochu.Escaper]
schedule function tosochu:mission/release_hunter 5s

# 通知
tellraw @a[tag=Tosochu.Participant] [{"nbt":"Message.Prefix","storage":"tosochu:system","interpret": true},{"nbt":"Message.OnStart","storage":"tosochu:system","interpret": true}]

# 演出
execute as @a[tag=Tosochu.Participant] at @s run playsound entity.player.levelup master @s ~ ~ ~ 1 1.5
execute as @a[tag=Tosochu.Participant] at @s run playsound entity.experience_orb.pickup master @s ~ ~ ~ 1 0.5
