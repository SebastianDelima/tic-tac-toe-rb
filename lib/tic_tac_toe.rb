require'pry'
WIN_COMBINATIONS = [
    [0,1,2],#top_row
    [3,4,5],#middle_row
    [6,7,8],#bottom_row
    [0,3,6],#first_row_vertical
    [1,4,7],#second_row_verical
    [2,5,8],#third_row_vertical
    [0,4,8],#diagonal_right
    [2,4,6]#diagonal_left
  ]

def position_taken? (board, index)
    if board[index] == " " || board[index] == "" || board[index] == nil
        false
    elsif board[index] == "X" || board[index] == "O"
        true
    end
end

def won?(board)
        if board[0] == "X" && board[1] == "X" && board[2] == "X" || board[0] == "O" && board[1] == "O" && board[2] == "O"
          return WIN_COMBINATIONS[0]
        elsif board[3] == "X" && board[4] == "X" && board[5] == "X" || board[3] == "O" && board[4] == "O" && board[5] == "O"
          return WIN_COMBINATIONS[1]
        elsif board[6] == "X" && board[7] == "X" && board[8] == "X" || board[6] == "O" && board[7] == "O" && board[8] == "O"
          return WIN_COMBINATIONS[2]
        elsif board[0] == "X" && board[3] == "X" && board[6] == "X" || board[0] == "O" && board[3] == "O" && board[6] == "O"
          return WIN_COMBINATIONS[3]
        elsif board[1] == "X" && board[4] == "X" && board[7] == "X" || board[1] == "O" && board[4] == "O" && board[7] == "O"
          return WIN_COMBINATIONS[4]
        elsif board[2] == "X" && board[5] == "X" && board[8] == "X" || board[2] == "O" && board[5] == "O" && board[8] == "O"
          return WIN_COMBINATIONS[5]
        elsif board[0] == "X" && board[4] == "X" && board[8] == "X" || board[0] == "O" && board[4] == "O" && board[8] == "O"
          return WIN_COMBINATIONS[6]
        elsif board[2] == "X" && board[4] == "X" && board[6] == "X" || board[2] == "O" && board[4] == "O" && board[6] == "O"
         return WIN_COMBINATIONS[7]
    end
 end
        
def full?(board)
    if board.include?(" ")
    false
    else
     true
    end
end
        
 def draw?(board)
    if won?(board) 
     false
    elsif full?(board)
    true
    end
end
        
def over?(board)
    if won?(board) 
    true
    elsif full?(board)
    true
    elsif draw?(board)
    true
    else 
    false
    end
end
        
def winner(board)
    if won?(board)
        board[won?(board)[0]]
    end
end

def valid_move?(board, index)
    if board[index] == " "
        true
    elsif board[index] == "X" || board[index] == "O"
        false
    end
end     

def display_board(board)
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
    input =  input.to_i 
    input = input - 1
    return input
end

def valid_move?(board, index)
    if  board[index] == "X" || board[index] == "Y"
         false
    elsif board[index] == " " && index.between?(0, 8) 
        true
    end
 end

 def move(board, index, token )
    board[index] = token
end


            
def turn_count(board)
    count = 0
    board.each do |turns|
    if turns == "O" || turns == "X"
         count += 1 
     end
    end
    return count
 end

 def current_player(board)
    if turn_count(board).even?
        return "X"
    elsif turn_count(board).even? == false
        return "O"
    end
end

def turn(board)
    puts "Please enter 1-9:" 
       input = gets.strip
       index = input_to_index(input)
      if valid_move?(board, index)
        board[index] = current_player(board)
        display_board(board)
      else
        turn(board)
      end
end 


def play(board)
    until over?(board) == true do
     turn(board)
    if won?(board)
        puts "Congratulations #{winner(board)}!"
    end
    if draw?(board) == true
        puts "Cat's Game!"
    end
  end
end