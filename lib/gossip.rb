class Gossip
  attr_accessor :author, :content

  def initialize(author, content)
    self.author = author
    self.content = content
  end
  
  def save_as_csv
    CSV.open("db/gossip.csv","a",headers: true) do |csv| 
      csv << [author, content]
    end
  end

  def self.all
    all_gossips = []
    CSV.open("db/gossip.csv","a+", headers: true) do |csv|
      csv.each do |row|                        
        dummy_gossip = Gossip.new(row[0], row[1])
        all_gossips << dummy_gossip
      end
    end
    return all_gossips
  end

  def self.destroy_gossip(index_to_be_destroyed)
    table = CSV.table("db/gossip.csv")
    table.delete(index_to_be_destroyed)
    File.open("db/gossip.csv",'w') do |f|
      f.write(table.to_csv)
    end
  end
end