class NonplayerCharactersController < ApplicationController
  before_filter :set_nonplayer_character, only: [:show, :edit, :update]

  def show
  end

  def new
    campaign = Campaign.find(params[:campaign_id])
    @nonplayer_character = NonplayerCharacter.new(campaign: campaign)
  end

  def create
    @nonplayer_character = NonplayerCharacter.new(nonplayer_character_params)

    if @nonplayer_character.save
      redirect_to nonplayer_character_path(@nonplayer_character)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @nonplayer_character.update(nonplayer_character_params)
      redirect_to nonplayer_character_path(@nonplayer_character)
    else
      render :edit
    end
  end

  private

  def set_nonplayer_character
    @nonplayer_character = NonplayerCharacter.find(params[:id])
  end

  def nonplayer_character_params
    input_params = params.require(:nonplayer_character).permit(:name, :public_description, :campaign_id)
    sanitize_input(input_params, [:name, :public_description])
    input_params
  end
end