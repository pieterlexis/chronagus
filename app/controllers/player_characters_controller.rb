class PlayerCharactersController < ApplicationController
  before_filter :set_player_character, only: [:show, :edit, :update]

  def show
  end

  def new
    campaign = Campaign.find(params[:campaign_id])
    @player_character = PlayerCharacter.new(campaign: campaign)
  end

  def create
    @player_character = PlayerCharacter.new(player_character_params)

    if @player_character.save
      redirect_to player_character_path(@player_character)
    else
      render :new
    end
  end

  def edit
    redirect_to player_character_path(@player_character) unless my_character?(@player_character)
  end

  def update
    redirect_to player_character_path(@player_character) unless my_character?(@player_character)

    if @player_character.update(player_character_params)
      redirect_to player_character_path(@player_character)
    else
      render :edit
    end
  end

  private

  def set_player_character
    @player_character = PlayerCharacter.find(params[:id])
  end

  def player_character_params
    input_params = params.require(:player_character).permit(:name, :public_description, :campaign_id, :player_id)
    sanitize_input(input_params, [:name, :public_description])
    input_params
  end
end
