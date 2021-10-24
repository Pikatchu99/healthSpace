class SchedulesController < ApplicationController
  before_action :set_schedule, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /schedules or /schedules.json
  def index
    # @schedules = Schedule.all
    redirect_to pharmacies_path, notice: "Veuillez vous rendre sur une pharmacie précise pour voir leurs horaires."
  end

  # GET /schedules/1 or /schedules/1.json
  def show
    redirect_to pharmacies_path, notice: "Veuillez vous rendre sur une pharmacie précise pour voir leurs horaires."
  end

  # GET /schedules/new
  def new
    @schedule = Schedule.new
  end

  # GET /schedules/1/edit
  def edit
    if current_user.pharmacy.id != @schedule.pharmacy.id
      redirect_to pharmacies_path, alert: "❌ Accès interdit. Veillez à ne plus le refaire s'il vous plaît.❌"
    end
  end

  # POST /schedules or /schedules.json
  def create
    @schedule = Schedule.new(schedule_params)
    @schedule.pharmacy_id = current_user.pharmacy.id

    respond_to do |format|
      if @schedule.save
        format.html { redirect_to pharmacien_path(current_user.id), notice: "Horaires d'ouvertures crée avec succès. Voici votre Dashboard." }
        format.json { render :show, status: :created, location: @schedule }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /schedules/1 or /schedules/1.json
  def update
    respond_to do |format|
      if @schedule.update(schedule_params)
        format.html { redirect_to pharmacien_path(current_user.id), notice: "Horaires d'ouvertures mise à jour avec succès." }
        format.json { render :show, status: :ok, location: @schedule }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
  end
  def destroy
    redirect_to pharmacies_path, notice: "Impossible d'effectuer cette action."
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_schedule
      @schedule = Schedule.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def schedule_params
      params.require(:schedule).permit(:lundi, :mardi, :mercredi, :jeudi, :vendredi, :samedi, :dimanche)
    end
end
