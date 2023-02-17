# lang
# Core
data modify storage tosochu:system Message.Core.Prefix set value '[{"text":"［","color": "white","bold": false},{"text":"逃走中","color": "gray","bold": true},{"text":"］","color": "white","bold": false}]'

data modify storage tosochu:system Message.Core.Notification set value '[{"text":"通達: ","color": "yellow","bold": true}]'

# Item
data modify storage tosochu:system Message.Item.OnCooldown set value '{"text":"エラー: アイテムのクールタイム中です。","color": "red","bold": false}'

data modify storage tosochu:system Message.Item.Give set value '{"text":"次のアイテムを付与しました: ","color": "aqua","bold": false}'

# Mission
data modify storage tosochu:system Message.Mission.HunterRelease set value '{"text": "", "extra":[{"text":"ハンターが","color": "gold","bold": false},{"nbt":"Timer.Countdown","storage":"tosochu:","interpret": true,"color": "red","bold": true},{"text":"秒後","color": "red", "bold": true},{"text":"に開放される。","color": "gold","bold": false}]}'

data modify storage tosochu:system Message.Mission.GemPicked set value '[{"text":"が","color": "gold","bold": false},{"text":"宝玉を取得","color": "red", "bold": true},{"text":"した！","color": "gold","bold": false},{"text": "","color": "green","bold": true,"extra":[{"text": " ("},{"nbt":"Season","storage":"tosochu:temp"},{"text": ") "}]}]'

# Game
data modify storage tosochu:system Message.Game.Start set value '{"text":"ゲームを開始しました。","color": "gold","bold": true}'
data modify storage tosochu:system Message.Game.End set value '{"text":"ゲームが終了しました。","color": "gold","bold": true}'

data modify storage tosochu:system Message.Game.TellrawEscaper set value '{"text":"現在、残り逃走者は ","color": "gold","bold": false}'

data modify storage tosochu:system Message.Game.AllEscapersCaught set value '[{"text":"ハンターにより、","color": "#ddd605","bold": true},{"text":"すべての逃走者","color": "red","bold": true,"underlined": true},{"text":"が確保された。","color": "#ddd605","bold": true}]'
data modify storage tosochu:system Message.Game.SomeoneCaught set value '[{"text": "が","color": "gold"},{"text": "確保","color": "gold","bold":true},{"text": "された。","color": "gold"}]'

data modify storage tosochu:system Message.Game.EscapeSucceeded set value '{"text": "逃走成功","color": "yellow", "bold": true}'
data modify storage tosochu:system Message.Game.EscapeFailed set value '{"text": "逃走失敗","color": "dark_aqua", "bold": true}'

# Other

# 開始前説明
data modify storage tosochu:system Message.Other.Explanation set value {Hunter:[],Escaper:[]}

data modify storage tosochu:system Message.Other.Explanation.Hunter append value '{"text": "あなたはハンターです。","color": "gold", "bold": false}'
data modify storage tosochu:system Message.Other.Explanation.Hunter prepend value '{"text": "説明は以上です。30秒後に本開始となりますので、ご準備ください。\\n会場作成: Hiroki1003, システム作成: awabi2048","color": "gold", "bold": false}'

data modify storage tosochu:system Message.Other.Explanation.Escaper append value '{"text": "あなたは逃走者です。","color": "gold", "bold": false}'
data modify storage tosochu:system Message.Other.Explanation.Escaper prepend value '{"text": "説明は以上です。30秒後に本開始となりますので、ご準備ください。\\n会場作成: Hiroki1003, システム作成: awabi2048","color": "gold", "bold": false}'


