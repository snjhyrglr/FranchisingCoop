class MunicipalitiesController < ApplicationController
  before_action :set_municipality, only: %i[ show edit update destroy ]

  # GET /municipalities or /municipalities.json
  def index
    @municipalities = Municipality.all
  end

  # GET /municipalities/1 or /municipalities/1.json
  def show
  end

  def selected 
    @target = params[:target]
    @barangays = Barangay.where(municipality_id: params[:id])
    respond_to do |format|
      format.turbo_stream
    end
  end

  # GET /municipalities/new
  def new
    @municipality = Municipality.new
  end

  # GET /municipalities/1/edit
  def edit
  end

  # POST /municipalities or /municipalities.json
  def create
    @municipality = Municipality.new(municipality_params)

    respond_to do |format|
      if @municipality.save
        format.html { redirect_to municipality_url(@municipality), notice: "Municipality was successfully created." }
        format.json { render :show, status: :created, location: @municipality }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @municipality.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /municipalities/1 or /municipalities/1.json
  def update
    respond_to do |format|
      if @municipality.update(municipality_params)
        format.html { redirect_to municipality_url(@municipality), notice: "Municipality was successfully updated." }
        format.json { render :show, status: :ok, location: @municipality }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @municipality.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /municipalities/1 or /municipalities/1.json
  def destroy
    @municipality.destroy

    respond_to do |format|
      format.html { redirect_to municipalities_url, notice: "Municipality was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_municipality
      @municipality = Municipality.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def municipality_params
      params.require(:municipality).permit(:region_id, :province_id, :name, :psgc_code)
    end
end
