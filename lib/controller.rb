class Controller
  attr_accessor :gossip, :view

  def initialize
    self.view = View.new
  end

  def create_gossip
    params = view.create_gossip
    self.gossip = Gossip.new(params[:author], params[:content])
    gossip.save_as_csv
  end

  def index_gossips
    view.index_gossips(Gossip.all)
  end

  def destroy_gossip
    Gossip.destroy_gossip(view.destroy_gossip(Gossip.all))
  end
end