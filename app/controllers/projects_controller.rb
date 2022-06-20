class ProjectsController < ApplicationController
  before_action :set_project, only: %i[ show edit update destroy ]
  before_action :set_investigators, only: %i[ new edit create update ]

  # GET /projects or /projects.json
  def index
    @projects = Project.all
  end

  # GET /projects/1 or /projects/1.json
  def show
  end

  # GET /projects/new
  def new
    if @investigators.empty?
      flash[:notice] = "No se han agregado investigadores a la base de datos. Para agregar un proyecto, debe agregar al menos un investigador."
      redirect_to new_investigator_path
    else
      @project = Project.new
    end
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects or /projects.json
  def create
    byebug
    get_investigators_passed_in_params
    create_project
    respond_to do |format|
      if @project.save
        add_investigators_to_project
        format.html { redirect_to project_url(@project), notice: "Project was successfully created." }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1 or /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to project_url(@project), notice: "Project was successfully updated." }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1 or /projects/1.json
  def destroy
    @project.destroy

    respond_to do |format|
      format.html { redirect_to projects_url, notice: "Project was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_project
    @project = Project.find(params[:id])
  end

  def set_investigators
    @investigators = Investigator.all
  end

  # Only allow a list of trusted parameters through.
  def create_project
    @project = Project.new
    @project.code = params[:project][:code]
    @project.name = params[:project][:name]
  end

  def add_investigators_to_project
    @investigators_to_add.each { |investigator| 
      if investigator == @investigators_to_add.first then 
        @project_investigator = ProjectInvestigator.create(project_id: @project.id, investigator_id: investigator.id, role: 0)
      else
         @project_investigator = ProjectInvestigator.create(project_id: @project.id, investigator_id: investigator.id, role: 1) 
      end }
  end

  def get_investigators_passed_in_params
    @investigators_to_add = Array.new
    principal_investigator_id_card = params[:project][:principal_investigator].split("-")[0]
    principal_investigator = Investigator.find_by(id_card: principal_investigator_id_card)
    @investigators_to_add << principal_investigator
    params[:project][:investigators].each { |investigator|
      if investigator[1] == "1" then @investigators_to_add << Investigator.find(investigator[0]) end
    }
  end
end
