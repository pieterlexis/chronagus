class LogEntriesController < ApplicationController
  before_filter :set_log_entry, only: [:show, :edit, :update, :destroy]
  before_filter :set_campaign, only: [:index, :new]

  def index
    authorize @campaign, :show?

    @log_entries = @campaign.log_entries.ic_anti_chronological.oc_anti_chronological
  end

  def show
    authorize @log_entry
  end

  def new
    @log_entry = LogEntry.new(campaign: @campaign)
    authorize @log_entry

    @log_entry.ic_date = @campaign.current_date
  end

  def create
    @log_entry = LogEntry.new(log_entry_params)
    authorize @log_entry

    if @log_entry.save
      redirect_to log_entry_path(@log_entry)
    else
      render :new
    end
  end

  def edit
    authorize @log_entry
  end

  def update
    authorize @log_entry

    if @log_entry.update(log_entry_params)
      redirect_to log_entry_path(@log_entry)
    else
      render :edit
    end
  end

  def destroy
    authorize @log_entry

    @log_entry.destroy
    redirect_to campaign_log_entries_path(@log_entry.campaign)
  end

  private

  def set_log_entry
    @log_entry = LogEntry.find(params[:id])
  end

  def set_campaign
    @campaign = Campaign.find(params[:campaign_id])
  end

  def log_entry_params
    params
      .require(:log_entry)
      .permit(:title, :text, :ic_date, :oc_date, :campaign_id, :bootsy_image_gallery_id)
  end
end
