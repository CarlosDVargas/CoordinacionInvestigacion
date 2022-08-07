class AgreementsController < ApplicationController
  before_action :set_agreement, only: %i[ show edit update destroy ]

  # GET /agreements or /agreements.json
  def index
    @agreements = Agreement.all
  end

  # GET /agreements/1 or /agreements/1.json
  def show
  end

  # GET /agreements/new
  def new
    @agreement = Agreement.new
  end

  # GET /agreements/1/edit
  def edit
  end

  # POST /agreements or /agreements.json
  def create
    @agreement = Agreement.new(agreement_params)

    respond_to do |format|
      if @agreement.save
        format.html { redirect_to agreement_url(@agreement), notice: "Agreement was successfully created." }
        format.json { render :show, status: :created, location: @agreement }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @agreement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /agreements/1 or /agreements/1.json
  def update
    respond_to do |format|
      if @agreement.update(agreement_params)
        format.html { redirect_to agreement_url(@agreement), notice: "Agreement was successfully updated." }
        format.json { render :show, status: :ok, location: @agreement }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @agreement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /agreements/1 or /agreements/1.json
  def destroy
    @agreement.destroy

    respond_to do |format|
      format.html { redirect_to agreements_url, notice: "Agreement was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_agreement
      @agreement = Agreement.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def agreement_params
      params.require(:agreement).permit(:agreementNumber, :articleNumber)
    end
end
