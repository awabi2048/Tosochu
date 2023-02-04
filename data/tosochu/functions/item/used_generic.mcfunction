# トリガーアイテム使用時
# トリガー解除
scoreboard players set @s Tosochu.ItemUsed 0
advancement revoke @s only tosochu:core/used_item

# 手持ちアイテムによってfunction実行
execute if data entity @s {SelectedItem:{tag:{Tosochu:{ID:"CatchBaton"}}}} run function tosochu:item/catch_baton/used
