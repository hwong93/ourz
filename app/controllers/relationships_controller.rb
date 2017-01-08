class RelationshipsController < ApplicationController

  def index
  end

  def new
    @relationship = Relationship.new
  end

  def create
    @relationship = Relationship.new(relationship_params)

    if @relationship.save
      render body: nil, notice: 'Followed';
    else
      render body: nil, notice: 'Error or You are already follwing'
    end

  end

  def show
  end

  def update
  end

  def edit
  end

  def destroy
  end

  private
    def relationship_params
      params.require(:relationship).permit(:follower_id, :followed_id)
    end
end
