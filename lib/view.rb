class View



  def create_gossip
    puts
    puts "Auteur du Gosssip : "
    print " > "; author = gets.chomp
    puts "Contenu du Gossip :"
    print " > "; content = gets.chomp
    puts
    return params = {author: author, content: content}
  end

  def index_gossips(gossips_array)
    puts
    gossips_array.each_with_index { |gossip, i| puts " > #{i + 1} " + gossip.author; puts " >>>> " + gossip.content}
    puts
  end

  def destroy_gossip(gossips_array)
    puts
    puts "Quels Gossip veux tu détruire?"
    index_gossips(gossips_array)
    print " > "; gossip_index_to_be_destroyed = gets.chomp.to_i
    puts
    case gossip_index_to_be_destroyed
    when (1..gossips_array.length)
      return (gossip_index_to_be_destroyed - 1)
    else
      puts
      puts "Essaie encore"
      destroy_gossip(gossips_array)
    end 
  end
end