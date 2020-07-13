#クライアントサイドの処理を受け持つチャンネル
App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    # サーバーからデータを受け取ったときの動きを定義
    # 受け取ったデータをアラートで表示
    alert data['message']

  # サーバーサイドのspeakアクションを呼びだし、messageをパラメータとして渡す
  speak: (message) ->
    @perform 'speak', message: message