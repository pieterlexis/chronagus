class NonplayerCharactersController < ApplicationController
  before_action :set_nonplayer_character, only: [:show, :edit, :update, :destroy]
  before_action :set_campaign, only: [:index ,:new]

  def index
    authorize @campaign, :show?

    @nonplayer_characters = @campaign.nonplayer_characters.alphabetical
  end

  def show
    authorize @nonplayer_character
  end

  def new
    @nonplayer_character = NonplayerCharacter.new(campaign: @campaign)

    authorize @nonplayer_character
  end

  def create
    @nonplayer_character = NonplayerCharacter.new(nonplayer_character_params)
    authorize @nonplayer_character

    if @nonplayer_character.save
      redirect_to nonplayer_character_path(@nonplayer_character)
    else
      render :new
    end
  end

  def edit
    authorize @nonplayer_character
  end

  def update
    authorize @nonplayer_character

    if @nonplayer_character.update(nonplayer_character_params)
      redirect_to nonplayer_character_path(@nonplayer_character)
    else
      render :edit
    end
  end

  def destroy
    authorize @nonplayer_character

    @nonplayer_character.destroy
    redirect_to campaign_nonplayer_characters_path(@nonplayer_character.campaign)
  end

  private

  def set_nonplayer_character
    @nonplayer_character = NonplayerCharacter.find(params[:id])
  end

  def set_campaign
    @campaign = Campaign.find(params[:campaign_id])
  end

  def nonplayer_character_params
    params
      .require(:nonplayer_character)
      .permit(:name, :public_description, :campaign_id, :avatar)
  end
end
