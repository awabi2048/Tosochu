## 事前説明
# 開始時: 説明をデータベースからコピー
execute if score $ExplanationLevel Tosochu matches 0 run data modify storage tosochu: Explanation set from storage tosochu:system Message.Other.Explanation

# それぞれのグループだけに向けて説明
tellraw @a[tag=Tosochu.PreHunter] [{"nbt":"Message.Core.Prefix","storage":"tosochu:","interpret": true},{"nbt":"Explanation.Hunter[0]","storage":"tosochu:","interpret": true}]
tellraw @a[tag=Tosochu.PreEscaper] [{"nbt":"Message.Core.Prefix","storage":"tosochu:","interpret": true},{"nbt":"Explanation.Escaper[0]","storage":"tosochu:","interpret": true}]

# ループ時
scoreboard players add $ExplanationLevel Tosochu 1

data remove storage tosochu: Explanation.Hunter[0]
data remove storage tosochu: Explanation.Escaper[0]

execute as @a[tag=Tosochu.Participant] at @s run playsound block.note_block.pling master @s ~ ~ ~ 1 1.25

# ループ終了判定
execute unless data storage tosochu: Explanation.Hunter[0] unless data storage tosochu: Explanation.Escaper[0] run schedule function tosochu:core/system/explanation 200t

execute if score $ExplanationLevel Tosochu >= $ExplanationCount Tosochu run schedule function tosochu:core/system/start_game 600t

say heyaa
