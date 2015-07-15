class CardsController < ApplicationController
  def index
    if params[:user_id].present?
      @user = User.find params[:user_id]
      @cards = @user.cards
    else
      @cards = Card.all
    end
  end

   def new
    @card = Card.new
   end

   def create  
    @card = Card.new(card_params)
    @card.users << current_user

    if @card.valid?
      @card.save!
      flash[:notice] = "Card entry successful!"
      redirect_to :back
    else
      flash[:alert] = "Something went wrong, check errors below"
      render :new
    end
  end



   def show
   end

def card_params
   params.require(:card).permit(:number, :exp_year, :exp_month, :type, :user_id)
end

end