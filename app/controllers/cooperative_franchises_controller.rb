class CooperativeFranchisesController < ApplicationController
  before_action :set_cooperative_franchise, only: %i[ show edit update destroy ]

  # GET /cooperative_franchises or /cooperative_franchises.json
  def index
    @cooperative_franchises = CooperativeFranchise.all
    @products = Product.all
  end

  # GET /cooperative_franchises/1 or /cooperative_franchises/1.json
  def show
  end

  # GET /cooperative_franchises/new
  def new
    @cooperative_franchise = CooperativeFranchise.new
    @cooperative_franchise.status = "Initiated"
  end

  # GET /cooperative_franchises/1/edit
  def edit
  end

  # POST /cooperative_franchises or /cooperative_franchises.json
  def create
    @cooperative_franchise = CooperativeFranchise.new(cooperative_franchise_params)

    respond_to do |format|
      if @cooperative_franchise.save
        format.html { redirect_to cooperative_franchises_url, notice: "Cooperative franchise was successfully created." }
        format.json { render :show, status: :created, location: @cooperative_franchise }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cooperative_franchise.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cooperative_franchises/1 or /cooperative_franchises/1.json
  def update
    respond_to do |format|
      if @cooperative_franchise.update(cooperative_franchise_params)
        format.html { redirect_to cooperative_franchise_url(@cooperative_franchise), notice: "Cooperative franchise was successfully updated." }
        format.json { render :show, status: :ok, location: @cooperative_franchise }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cooperative_franchise.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cooperative_franchises/1 or /cooperative_franchises/1.json
  def destroy
    @cooperative_franchise.destroy

    respond_to do |format|
      format.html { redirect_to cooperative_franchises_url, notice: "Cooperative franchise was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cooperative_franchise
      @cooperative_franchise = CooperativeFranchise.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cooperative_franchise_params
      params.require(:cooperative_franchise).permit(:cooperative_id, :franchisee_id, :franchisee_type, :product_id, :status, :creator_id, :creator_type, :expiry)
    end
end
