# ゲーム開始
# フラグ
data modify storage tosochu: InEvent set value false

# タイマー設定
data modify storage tosochu: Timer.Value set value -1

# ボスバー削除
bossbar remove tosochu:timer