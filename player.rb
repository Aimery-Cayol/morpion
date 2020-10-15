# coding: utf-8
class Player
  #TO DO : la classe a 2 attr_accessor, son nom, sa valeur (X ou O). Elle a un attr_writer : il a gagné ?
  attr_accessor :name_player, :value_player
  def initialize(name, value)
    @name = name
    @value = value
  end
  def name
    return @name
  end
  def value
    return @value
  end
end
