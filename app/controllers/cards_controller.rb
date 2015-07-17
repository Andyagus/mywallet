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
    @user = User.find params[:user_id]
    @card = Card.new
 
   end

   def create  
    @card = Card.new(card_params)

    @card.users << current_user
    @card.save!

    respond_to do |format|
      format.js do
      end

    end

    # if @card.valid?
    #   flash[:notice] = "Card entry successful!"
    #   redirect_to user_cards_path(current_user)
    # else
    #   flash[:alert] = "Something went wrong, check errors below"
    #   render :new
    # end
  end

 def destroy
    @card = Card.find(params[:id]).destroy
    @card.destroy
    redirect_to user_cards_path
end

   def show
   end

   def admin
    @cards = Cards.all
   end

def card_params
   params.require(:card).permit(:number, :exp_year, :exp_month, :type, :balance, :user_id)
end

end