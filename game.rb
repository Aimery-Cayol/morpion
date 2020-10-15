# coding: utf-8
require_relative "player"
require_relative "board"
require 'pry'

require 'bundler'
Bundler.require




class Game 
  def initialize
  puts "------------------------------------------------"
  puts "| Bienvenue dans le 'MORPION' !                |"
  puts "|  Le but du jeu est d'aligner trois symboles !|"
  puts "------------------------------------------------"

  # Recuperation des prenoms et association à un symbole: 
  puts "Que le joueur 1 rentre son prénom !"
  @name_player_one = gets.chomp
  @player1 = Player.new(@name_player_one, "O")
  puts "Bienvenue #{ @name_player_one}, ton symbole sera O"

  puts "Au tour du joueur 2 de se présenter !"
  @name_player_two = gets.chomp
  @player2 = Player.new(@name_player_two, "X")
  puts "Bienvenue à toi #{@name_player_two}, son symbole sera X"

  @board_game = Board.new
  end
  sleep 3 
  
  #définition des régles : 
  def aff_rules
    puts "Pour jouer, choisis un chiffre (entre 1 et 9) qui correspondra à une case du morpion selon cet ordre : "
    sleep 3
    puts " "
    puts " 1 | 2 | 3 "
    puts "-----------"
    puts " 4 | 5 | 6 "
    puts "-----------"
    puts " 7 | 8 | 9 "
  end 

  #Le premier joueur engage : 
  def play(string)
    puts string + " c'est à toi !\n"
    puts "Choisis un chiffre entre 1 et 9\n"
    @pos = gets.chomp.to_i
    @pos -= 1
  end

  #lancement de la partie : 
  def go # lance la partie
    
    aff_rules
    player_back = @player2.name
    begin
      while @board_game.victory == false do
        @board_game.print_board             # à chaque tour, affiche la grille de jeu
        if player_back.eql? @player2.name   # ont-ils la meme clef de hash ? 
          puts @player1.name + " à toi de jouer !\n"
          puts "Choisis un chiffre entre 1 et 9\n"
          @pos = gets.chomp.to_i
          @pos -= 1
          while @board_game.update_board(@pos, @player1.value.to_s) != true #le chiffre est-il valable ?
            play(@player1.status)
          end
         player_back = @player1.name
        elsif player_back.eql? @player1.name
          puts @player2.name + " à toi de jouer !\n"
          puts "Choisis un chiffre entre 1 et 9\n"
          @pos = gets.chomp.to_i
          @pos -= 1
          while @board_game.update_board(@pos, @player2.value.to_s) != true
            play(@player2.status)
          end
          player_back = @player2.name
        else
          puts "Oups ! Y a un bug.\n recommence !"
        end
      end
    rescue  => e
      puts "J'AI DIS ENTRE 1 ET 9 !!!"
      retry
    end
  end

  def turn
    #TO DO : affiche le plateau, demande ce qu'il joue au joueur, vérifie si un joueur a gagné, passe au joueur suivant si la partie n'est pas finie
  end



end
