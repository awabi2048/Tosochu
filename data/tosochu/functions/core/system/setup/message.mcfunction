# lang
data modify storage tosochu:system Message.Prefix set value '[{"text":"［","color": "white","bold": false},{"text":"逃走中","color": "gray","bold": true},{"text":"］","color": "white","bold": false}]'

data modify storage tosochu:system Message.Notification set value '[{"text":"通達: ","color": "yellow","bold": true}]'
data modify storage tosochu:system Message.OnCooldown set value '{"text":"エラー: アイテムのクールタイム中です。","color": "red","bold": false}'

data modify storage tosochu:system Message.OnGive set value '{"text":"次のアイテムを付与しました: ","color": "aqua","bold": false}'

data modify storage tosochu:system Message.OnStart set value '{"text":"ゲームを開始しました。","color": "gold","bold": true}'
data modify storage tosochu:system Message.OnEnd set value '{"text":"ゲームが終了しました。","color": "gold","bold": true}'
