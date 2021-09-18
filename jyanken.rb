
class Duel
    def jkn_jdg(hand,name)
        case hand
        when "0"
            puts "#{name}：チョキ"
        when "1"
            puts "#{name}：グー" 
        when "2"
            puts "#{name}：パー" 
        else
            yourhand = 4
            puts "#{name}：何も出していない" 
        end
    end
    def fig_jdg(finger,name)
        case finger
        when "0"
            puts "#{name}：上"
        when "1"
            puts "#{name}：右" 
        when "2"
            puts "#{name}：下"
        when "3"
            puts "#{name}：左"    
        else
            finger = 5
            puts "#{name}：どこも指していない" 
        end
    end
    def jyanken
        puts "じゃんけん…"
        puts "０（チョキ）、１（グー）、２（パー）"
        swjkn = 0
        while swjkn < 1
            @winner_flg = 0
            yourhand = gets.chomp  #あなたの手
            puts "ぽん"
            puts "-----------------------------"
            jkn_jdg(yourhand,"あなた") 
            opphand = rand(3)
            jkn_jdg(opphand.to_s,"相手")
            puts "-----------------------------"
            if yourhand < "3"
                if yourhand == "0" && opphand == 2   #ジャンケン勝ち
                    @winner_flg = 1 
                    swjkn = 1
                else
                    if yourhand == "2" && opphand == 0   #ジャンケン負け
                        swjkn = 1
                    else
                        if yourhand.to_i > opphand  #ジャンケン勝ち
                            @winner_flg = 1
                            swjkn = 1
                        else
                            if yourhand.to_i < opphand   #ジャンケン負け
                                swjkn = 1
                            else   #ジャンケンあいこ
                                puts "あいこで…"
                            end
                        end
                    end                       
                end
            else
                puts "０〜２の間で入力してください"    
            end
        end
    end
    def finger_game
        swfig = 0
        while swfig < 1
            puts "あっち向いて…"
            puts "０（上）、１（右）、２（下）、３（左）"
            yourfinger = gets.chomp  #あなたの指
            puts "ほい"
            puts "-----------------------------"
            fig_jdg(yourfinger,"あなた")
            oppfinger = rand(4)
            fig_jdg(oppfinger.to_s,"相手")
            puts "-----------------------------"
            if yourfinger < "4"
                swfig = 1
                if yourfinger.to_i == oppfinger
                    if @winner_flg == 1
                        $winner = "あなた"
                    else
                        $winner = "相手"
                    end
                    $sw_finish = 1
                end
            else
                puts  "０〜３の間で入力してください"
            end
        end
    end
end




duel = Duel.new
$sw_finish = 0
while $sw_finish < 1
    duel.jyanken
    duel.finger_game
    if $sw_finish == 1
        puts "#{$winner}が勝ちました"
    end
end