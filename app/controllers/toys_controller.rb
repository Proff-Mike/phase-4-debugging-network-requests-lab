class ToysController < ApplicationController
  wrap_parameters format: []

  def index
    toys = Toy.all
    render json: toys
  end

  def create
    toy = Toy.create(toy_params)
    render json: toy, status: :created
  end

  def update
    toy = Toy.find_by(id: params[:id])
    if Toy
      toy.update(toy_params)
      render json: toy, status: :accepted
    else
      render json: {error: cannot_be_updated}, status: :not_updated
    end
  end

  def destroy
    toy = Toy.find_by(id: params[:id])
    if toy
      toy.destroy
      head :no_content
    else 
      render json: { error: "Toy not found "}, status: not_found
  end
end

  private
  
  def toy_params
    params.permit(:name, :image, :likes)
  end

end
