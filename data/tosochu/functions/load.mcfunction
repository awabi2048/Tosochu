# load
# スコアボード定義
scoreboard objectives add Tosochu dummy
scoreboard objectives add Tosochu.Temp dummy

scoreboard objectives add Tosochu.ItemUsed minecraft.used:carrot_on_a_stick

scoreboard objectives add Constant dummy

# 定数定義
scoreboard players set #60 Constant 60
scoreboard players set #120 Constant 120

# 言語ファイルを定義
function tosochu:core/system/setup/message
