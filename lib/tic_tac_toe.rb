class TicTacToe

    attr_accessor :board;

    WIN_COMBINATIONS = [[0,1,2],[3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8],[0,4,8],[2,4,6]]

    def initialize()
        @board=Array.new(9," ")
    end

    def display_board()
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
        
    end

    def input_to_index(input)
        index=input.to_i-1
    end

    def move(index,token="X")
        @board[index]=token
    end
    
    def position_taken?(index)
        if self.board[index]==" "
            return false
        else 
            return true
        end
    end

    def valid_move?(index)
        if (index >=0 && index <=8)
            if position_taken?(index)==false
                return true
            end
        end
        false    
    end

    def turn_count
        empty=@board.count(" ")
        9-empty
    end

    def current_player
        if(turn_count.even?)
            "X"
        elsif(turn_count.odd?)
            "O"
        end
    end

    def turn
        puts "#{value=current_player}'s Turn Input Position:"
      
      
        position = gets.chomp
        position = input_to_index(position)
        if valid_move?(position)
            move(position,value) 
            display_board()
        else
            puts"Invalid Choice, Try again"
            turn
        end
       
    end

   
    def won?
        WIN_COMBINATIONS.any? do |combo|
            if position_taken?(combo[0]) && @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]]
                return combo
            end
        end
    end

    def full?
         !@board.include?(" ")
    end
    
    def draw?
       if(full? && !won?)
        true
       else
        false
       end
    end

    def over?
      if(full? || draw?)
        true
      else
        false
      end
    end

    def winner
        if combo = won?
            @board[combo[0]]
        end
    end

    def play
        
        while over? == false
            if(won?)
                break
            end
            turn 
        end

        puts winner ? "Congratulations #{winner}!" : "Cat's Game!"

    end
 


end