class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [:show, :edit, :update]

  def index
    @cocktails = Cocktail.all

    if params[:query].present?
      @cocktails = @cocktails.where("name ILIKE ?", "%#{params[:query]}%")
    end
  end

  def show
    @dose = Dose.new
    @ingredients = Ingredient.all
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktails_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @cocktail = Cocktail.update(cocktails_params)
      redirect_to cocktail_path(@cocktail)
    else
      render :edit
    end
  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def cocktails_params
    params.require(:cocktail).permit(:name, :photo)
  end
end
