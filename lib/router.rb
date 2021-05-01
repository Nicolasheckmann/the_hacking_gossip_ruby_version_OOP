class Router
  attr_accessor :controller

  def initialize
    self.controller = Controller.new
  end

  def perform
    puts "Bienvenue dans THE GOSSIP PROJECT"
    while true
      puts "> 1 - Pour créer un nouveau Gossip"
      puts "> 2 - Pour afficher tous les Gossip"
      puts "> 3 - Pour détruire un Gossip"
      puts "> 4 - Pour quitter l'application"
      case gets.chomp.to_i
      when 1
        puts "Créer un Gossip"
        controller.create_gossip
      when 2
        puts "Voici les Gossips :"
        controller.index_gossips
      when 3
        controller.destroy_gossip
      when 4
        puts "Au revoir"
        break
      else
        puts "Essaie encore"
      end
    end
  end
end