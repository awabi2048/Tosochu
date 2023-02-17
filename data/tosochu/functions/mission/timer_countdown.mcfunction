# カウントダウン
# 減算
execute store result storage tosochu: Timer.Countdown int 0.99999 run data get storage tosochu: Timer.Countdown

# 残り5秒以下なら告知
execute store result score $Timer:Countdown Tosochu.Temp run data get storage tosochu: Timer.Countdown
execute if score $Timer:Countdown Tosochu.Temp matches ..5 run tellraw @a[tag=Tosochu.Participant] [{"nbt":"Message.Core.Prefix","storage":"tosochu:system","interpret": true},{"nbt":"Message.OngoingCountdown","storage":"tosochu:","interpret": true},{"text": "まで残り ","color": "gold","bold": false},{"text":"","color": "gold","bold": true,"extra":[{"nbt":"Timer.Countdown","storage":"tosochu:","interpret": true},{"text": "秒"}]}]

# タイマーに残りあれば再帰
execute unless data storage tosochu: {Timer:{Countdown:1}} run schedule function tosochu:mission/timer_countdown 20t

# 再帰終わったらデータリセット
execute if data storage tosochu: {Timer:{Countdown:1}} run data modify storage tosochu: Timer.Countdown set value 0
execute if data storage tosochu: {Timer:{Countdown:1}} run data modify storage tosochu: Message.OngoingCountdown set value ""
