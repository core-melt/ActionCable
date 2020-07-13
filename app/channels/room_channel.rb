# サーバーサイドの処理を受け持つチャンネル
# サーバーでWebSocketを受け付けるたびに、Connectionオブジェクトがインスタンス化する。
# Connection自体は、アプリのロジックは扱わない。
# ConnectionはApplicationCable::Connectionのインスタンスである。
# Connectionオブジェクトは、全てのChannel Subscriptionsの親となる(2-1)。
# Consumer: WebSocket Connectionのクライアント。
# 各ユーザーが開くブラウザタブ、ウィンドウ、デバイスごとに、ConsumerのConnectionのペアが1つづつ作成される。
class RoomChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from "room_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

　# クライアントから送信されたmessageデータを受け取り、全クライアントへブロードキャスト
  def speak(data)
    ActionCable.server.broadcast 'room_channel', message: data['message']
  end
end
