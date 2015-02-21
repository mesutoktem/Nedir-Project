class PatternTypesController < ApplicationController
  before_action :set_pattern_type, only: [:show, :edit, :update, :destroy]

  # GET /pattern_types
  # GET /pattern_types.json
  def index
    @pattern_types = PatternType.all
  end

  # GET /pattern_types/1
  # GET /pattern_types/1.json
  def show
  end

  # GET /pattern_types/new
  def new
    @pattern_type = PatternType.new
  end

  # GET /pattern_types/1/edit
  def edit
  end

  # POST /pattern_types
  # POST /pattern_types.json
  def create
    @pattern_type = PatternType.new(pattern_type_params)

    respond_to do |format|
      if @pattern_type.save
        format.html { redirect_to @pattern_type, notice: 'Pattern type was successfully created.' }
        format.json { render :show, status: :created, location: @pattern_type }
      else
        format.html { render :new }
        format.json { render json: @pattern_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pattern_types/1
  # PATCH/PUT /pattern_types/1.json
  def update
    respond_to do |format|
      if @pattern_type.update(pattern_type_params)
        format.html { redirect_to @pattern_type, notice: 'Pattern type was successfully updated.' }
        format.json { render :show, status: :ok, location: @pattern_type }
      else
        format.html { render :edit }
        format.json { render json: @pattern_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pattern_types/1
  # DELETE /pattern_types/1.json
  def destroy
    @pattern_type.destroy
    respond_to do |format|
      format.html { redirect_to pattern_types_url, notice: 'Pattern type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pattern_type
      @pattern_type = PatternType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pattern_type_params
      params.require(:pattern_type).permit(:name, :pattern_text)
    end
end
