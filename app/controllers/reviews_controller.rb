class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new(review_params)
    @review.restaurant = @restaurant

    if @review.save
      redirect_to restaurant_path(@restaurant), notice: 'The Review was successful created.'
    else
      render 'new.html.erb'
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy

    redirect_to restaurant_path(@review.restraurant), notice: 'Review was successfully deleted.'
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end

end
