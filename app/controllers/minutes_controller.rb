class MinutesController < ApplicationController
  before_action :set_minute, only: %i[ show edit update destroy ]
  before_action :set_projects, only: [:new, :edit, :create, :update, :destroy]

  # GET /minutes or /minutes.json
  def index
    @minutes = Minute.all
  end

  # GET /minutes/1 or /minutes/1.json
  def show
  end

  # GET /minutes/new
  def new
    @minute = Minute.new
  end

  # GET /minutes/1/edit
  def edit
  end

  # POST /minutes or /minutes.json
  def create
    byebug 
    @minute = Minute.new(minute_params)
    articles = recieve_articles
    respond_to do |format|
      if @minute.save
        articles.each { |article| Article.create(number: article[:number], minute_id: @minute.id, project_id: article[:project_id]) }
        format.html { redirect_to minute_url(@minute), notice: "Minute was successfully created." }
        format.json { render :show, status: :created, location: @minute }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @minute.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /minutes/1 or /minutes/1.json
  def update
    respond_to do |format|
      if @minute.update(minute_params)
        format.html { redirect_to minute_url(@minute), notice: "Minute was successfully updated." }
        format.json { render :show, status: :ok, location: @minute }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @minute.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /minutes/1 or /minutes/1.json
  def destroy
    @minute.destroy

    respond_to do |format|
      format.html { redirect_to minutes_url, notice: "Minute was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_minute
      @minute = Minute.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def minute_params
      params.require(:minute).permit(:number, :date, :file, articles: [:_destroy, :number, :minute_id, :project_id])
    end

    def set_projects
      @projects = Project.all
    end

    def recieve_articles
      if params[:minute]
        return params[:minute][:articles_attributes].values
      end
    end
end
