class StresController < ApplicationController
  before_action :set_stre, only: [:show, :edit, :update, :destroy]

  # GET /stres
  # GET /stres.json
  def index
    @stres = Stre.all
  end

  # GET /stres/1
  # GET /stres/1.json
  def show
  end

  # GET /stres/new
  def new
    @stre = Stre.new
  end

  # GET /stres/1/edit
  def edit
  end

  # POST /stres
  # POST /stres.json
  def create
    @stre = Stre.new(stre_params)

    respond_to do |format|
      if @stre.save
        format.html { redirect_to @stre, notice: 'Stre was successfully created.' }
        format.json { render :show, status: :created, location: @stre }
      else
        format.html { render :new }
        format.json { render json: @stre.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stres/1
  # PATCH/PUT /stres/1.json
  def update
    respond_to do |format|
      if @stre.update(stre_params)
        format.html { redirect_to @stre, notice: 'Stre was successfully updated.' }
        format.json { render :show, status: :ok, location: @stre }
      else
        format.html { render :edit }
        format.json { render json: @stre.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stres/1
  # DELETE /stres/1.json
  def destroy
    @stre.destroy
    respond_to do |format|
      format.html { redirect_to stres_url, notice: 'Stre was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stre
      @stre = Stre.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stre_params
      params.require(:stre).permit(:title, :content)
    end
end
