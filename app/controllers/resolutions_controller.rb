class ResolutionsController < ApplicationController
  before_action :set_resolution, only: [:show, :edit, :update, :destroy]

  # GET /resolutions
  # GET /resolutions.json
  def index
    new
    @resolutions = Resolution.includes(:user => :profile).recent.page params[:page]
  end

  # GET /resolutions/1
  # GET /resolutions/1.json
  def show
    @comments = @resolution.comments.with_state([:draft, :published])
  end

  # GET /resolutions/new
  def new
    @resolution = current_user.resolutions.new
  end

  # GET /resolutions/1/edit
  def edit
  end

  # POST /resolutions
  # POST /resolutions.json
  def create
    @resolution = current_user.resolutions.new(resolution_params)

    respond_to do |format|
      if @resolution.save
        format.html { redirect_to root_url, notice: 'Resolution was successfully created.' }
        format.js
        format.json { render action: 'show', status: :created, location: @resolution }
      else
        format.html { render action: 'new' }
        format.json { render json: @resolution.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /resolutions/1
  # PATCH/PUT /resolutions/1.json
  def update
    respond_to do |format|
      if @resolution.update(resolution_params)
        format.html { redirect_to @resolution, notice: 'Resolution was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @resolution.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /resolutions/1
  # DELETE /resolutions/1.json
  def destroy
    @resolution.destroy
    respond_to do |format|
      format.html { redirect_to resolutions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_resolution
      @resolution = Resolution.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def resolution_params
      params[:resolution].merge!(:user_id => current_user.id)
      params.require(:resolution).permit(:description, :user_id)
    end
end
