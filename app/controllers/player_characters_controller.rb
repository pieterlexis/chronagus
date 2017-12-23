class PlayerCharactersController < ApplicationController
  before_filter :set_player_character, only: [:show, :edit, :update, :destroy]

  def show
    authorize @player_character
  end

  def new
    campaign = Campaign.find(params[:campaign_id])
    @player_character = PlayerCharacter.new(campaign: campaign)
    authorize @player_character
  end

  def create
    @player_character = PlayerCharacter.new(player_character_params)
    authorize @player_character

    if @player_character.save
      redirect_to player_character_path(@player_character)
    else
      render :new
    end
  end

  def edit
    authorize @player_character
  end

  def update
    authorize @player_character

    if @player_character.update(player_character_params)
      redirect_to player_character_path(@player_character)
    else
      render :edit
    end
  end

  def destroy
    authorize @player_character

    @player_character.destroy
    redirect_to root_path
  end

  private

  def set_player_character
    @player_character = PlayerCharacter.find(params[:id])
  end

  def player_character_params
    params
      .require(:player_character)
      .permit(:name, :public_description, :campaign_id, :player_id, :avatar)
  end
end
