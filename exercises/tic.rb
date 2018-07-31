class Game
    @@choices = ["A1","B1","C1","A2","B2","C2","A3","B3","C3"]
    
    def initialize(player1,player2)
        #Create two new player instances
        @player1 = Player.new(player1,"X")
        @player2 = Player.new(player2,"O")
        #Add players to array we'll use to switch between for turns
        @players = [@player1,@player2]
        @moves = []#keeps track of moves entered by both players
        
        puts "Welcome to Tic-Tac-Toe! You know the rules, just get three moves in a row to win"
        puts "\nBeginning game..\n\n"
        @row1 = [1,0,0,0]
        @row2 = [2,0,0,0]
        @row3 = [3,0,0,0]
        turn(@player1)
    end
    
    def displayBoard
        @grid = [@row1,@row2,@row3]
        print "  A B C \n"
        @grid.each {|x| 
            x.each { |e|
                print e.to_s + " "
            }
            print "\n"
        }
        print "\n"
    end
    
    def updateBoard(selection,player)
        sym = player.symbol
        case selection
        when "A1"
            @row1[1] = sym
        when "B1"
            @row1[2] = sym
        when "C1"
            @row1[3] = sym
        when "A2"
            @row2[1] = sym
        when "B2"
            @row2[2] = sym
        when "C2"
            @row2[3] = sym
        when "A3"
            @row3[1] = sym
        when "B3"
            @row3[2] = sym
        when "C3"
            @row3[3] = sym
        end
    end
    
    def checkMoves(player,selection)
        #Push move to players playerMoves array
       player.playerMoves.push(selection).to_s
       #If length is zero, 3 moves corresponding in a win have been made
       if (["A2","B2","C2"] - player.playerMoves).length == 0
           return true
       elsif (["A1","B1","C1"] - player.playerMoves).length == 0
            return true
       elsif (["A3","B3","C3"] - player.playerMoves).length == 0
            return true
       elsif (["A1","A2","A3"] - player.playerMoves).length == 0
            return true
       elsif (["B1","B2","B3"] - player.playerMoves).length == 0
            return true
       elsif (["C1","C2", "C3"] - player.playerMoves).length == 0
            return true
       elsif (["A1","B2","C3"] - player.playerMoves).length == 0
            return true
       elsif (["A3","B2","C1"] - player.playerMoves).length == 0
            return true
       else
           return false
        end 
    end
    
    def turn(player)
        displayBoard #Display up-to-date board
        @flag = false
        puts "#{player.name}'s turn." 
        
        while @flag == false
            if @moves.length == 9
                puts "Game over, no one wins"
                @flag = true
            end
            print "Please enter a grid section using A-C, 1-3. For instance, top left is A1: "
            selection = gets.chomp
            #Check if this move has already been made and if it's valid
            if @@choices.include?(selection) && @moves.include?(selection) == false
                @moves.push(selection)
                #Valid selection, allows us to exit while loop
                #Update board with valid selection
                updateBoard(selection,player)
                @flag = true
                #Check if game is over, if not then switch to other player
                if checkMoves(player, selection)
                    puts "Game over: #{player.name} wins!"
                else
                    @players.each {|x|
                        turn(x) if x != player
                    }
                end  
            else
                puts "invalid move"
            end
        end
    end
    
    class Player
        attr_accessor :name
        attr_accessor :playerMoves
        attr_accessor :symbol
       def initialize(name,symbol)
           @playerMoves = []
           @name = name
           @symbol = symbol
           puts "#{@name} has entered the game!"
        end
    end
end



newGame = Game.new("Sam", "Rob")

