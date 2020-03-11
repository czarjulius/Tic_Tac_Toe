class Output

    attr_reader :text, :win_text, :rules_text, :ask_for_player_text, :player1_text, :player2_text, :choice_text, :move_text

    def initialize
        @text = "ha nhata"
        @win_text = "onye mmeri: "
        @rules_text = <<-EOS 
        \n
        ========================================= USORO EGWU =================================================
        || 1. A na-egwu egwuregwu ahu na okporo okporo uzo ahu bu sooso ato site na nkeji ato.                ||
        || 2. Onye okpukpo izizi inweta akara ato n\'usoro n\'otu                                             ||
        ||     (elu, ala, gafee, ma o bu nke dagonally) bu onye meriri.                                       ||
        || 3. Enwere ike hooro ikwaga site na 0 ruo 8                                                         ||
        || 4. Mgbe okirikiri 9 niile juputara, egwuregwu ahu agwula. O buru na enweghi onye okpukpo           ||
        ||    nwere akara ato n\'usoro, egwuregwu ga-ejedebe na eriri.                                         ||
        ======================================================================================================
        \n
        EOS
        @ask_for_player_text = "Kedu onye ị ga-achọ igwu egwu?"
        @player1_text = "1. Onye egwu mbu"
        @player2_text = "2. Onye egwu abuo"
        @choice_text = "Nhọrọ: "
        @move_text =  "Gaa n’ihu: "
    end

    def display_tie
        puts @text
    end
    def display_win(other_player)
        puts @win_text + other_player
    end
    def display_rules
        puts @rules_text
    end

    def display_ask_for_player
        puts @ask_for_player_text
    end
    def display_player1
        puts @player1_text
    end
    def display_player2
        puts @player2_text
    end
    def display_choice
        print @choice_text
    end
    def display_move
        print @move_text
    end
end
