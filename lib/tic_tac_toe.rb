class TicTacToe

    WIN_COMBINATIONS = [
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,3,6],
        [1,4,7],
        [2,5,8],
        [0,4,8],
        [6,4,2]
]


    def initialize(board = nil)
        @board = Array.new(9, " ")
    end

    def display_board
        puts " " + @board[0] + " | " + @board[1] + " | " + @board[2] + " "
        puts "-----------"
        puts " " + @board[3] + " | " + @board[4] + " | " + @board[5] + " "
        puts "-----------"
        puts " " + @board[6] + " | " + @board[7] + " | " + @board[8] + " "
    end

    def input_to_index(string)
        input = (string.to_i)-1
        input
    end

    def move(index, token = "X")
        @board[index] = token
    end

    def position_taken?(index)
         @board[index] == " " ? false : true
    end

    def valid_move?(index)
        if index < 0 || index > 8
            false
        else
             if position_taken?(index) == false
                true
             end
        end
    end

    def turn_count
        counter = 0
        @board.each do |index|
            if index != " "
                counter += 1
            end
        end
        counter
    end

    def current_player
        turn_count % 2 == 0 ? "X" : "O"
    end

    def turn
        puts "hey user whats your choice?"
        choice = gets.chomp
        position = input_to_index(choice)
        if valid_move?(position)
            move(position, current_player)
            display_board
        else
            turn
        end
    end

    def won?
        WIN_COMBINATIONS.detect do |combo|
            @board[combo[0]] == @board[combo[1]] &&
            @board[combo[1]] == @board[combo[2]] &&
            position_taken?(combo[0])
        end
    end

    def full?
        @board.all?{|token| token == "X" || token == "O"}
    end

    def draw?
        !won? && full?
    end

    def over?
        won? || draw?
    end

    def winner
        if winning_combo = won?
            @board[winning_combo.first]
        end
    end

    def play
        while !over?
            turn
        end
        if won?
            puts "Congratulations #{winner}!"
        elsif draw?
            puts "Cat's Game!"
        end
    end
end