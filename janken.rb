class Player
	def hand
	  puts "数字を入力してください。"
	  puts "0:グー, 1:チョキ, 2:パー"
	  input_hand = gets.chomp
	  while true
			if input_hand == "0" || input_hand == "1" || input_hand == "2"
				return input_hand 
			else
				puts "!ERROR"
				puts "0:グー, 1:チョキ, 2:パー"
				input_hand = gets.chomp
			end
	  end
	end
end
 
class Enemy
	def hand
		enemy_hand = rand (0..2)
		return enemy_hand.to_s 
	end
end

class Janken
	def pon(player_hand, enemy_hand)
	  janken = ["グー", "チョキ", "パー"]
		puts "相手の手は#{janken[enemy_hand.to_i]}です。"
		if player_hand == enemy_hand
			puts "あいこです"
			return true
		elsif (player_hand == "0" && enemy_hand == "1") || (player_hand == "1" && enemy_hand == "2") || (player_hand == "2" && enemy_hand == "0")
			puts "あなたの勝ちです"
			return false
		else
			puts "あなたの負けです"
			return false
		end
	end
end
  # じゃんけんゲームを実行するロジックを書きます。
class Action
	def self.jankenpon
	  player = Player.new
	  enemy = Enemy.new
	  janken = Janken.new
		next_game = true
	  while next_game == true
		  # 変数「next_game」にじゃんけんを実行して返ってきた値(戻り値)を代入します。
		  # 「janken.pon(player.hand, enemy.hand)」でじゃんけんを実行しています。
		  next_game = janken.pon(player.hand, enemy.hand)
		  # じゃんけんの実行結果に「false」が返ってくると、このwhileを終了します。「true」が返ってくると、その回数だけ繰り返し続けます。
	  # while文のend
	  end
	end
end
  # クラス名を使ってjankenponメソッドを呼び出します。
  Action.jankenpon