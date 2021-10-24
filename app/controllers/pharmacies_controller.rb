class PharmaciesController < ApplicationController
  before_action :set_pharmacy, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  def index
    @pharmacies = Pharmacy.where(city: current_user.city).page(params[:page]).per(10)
  end
  def search
    session[:search] = {'name' => params[:pn], 'city' => params[:pc], 'quartier' => params[:pq], 'product' => params[:pr], 'availability' => params[:pa]}
    if params[:pn].present? && params[:pc].present? && params[:pq].present?
      @pharmacies = Pharmacy.find_name(params[:pn]).find_city(params[:pc]).find_quartier(params[:pq]).page(params[:page]).per(10)
    elsif params[:pn].present? && params[:pc].present? && params[:pq].blank?
      @pharmacies = Pharmacy.find_name(params[:pn]).find_city(params[:pc]).page(params[:page]).per(10)
    elsif params[:pn].present? && params[:pc].blank? && params[:pq].present?
      @pharmacies = Pharmacy.find_name(params[:pn]).find_quartier(params[:pq]).page(params[:page]).per(10)
    elsif params[:pn].blank? && params[:pc].present? && params[:pq].present?
      @pharmacies = Pharmacy.find_city(params[:pc]).find_quartier(params[:pq]).page(params[:page]).per(10)
    elsif params[:pn].present? && params[:pc].blank? && params[:pq].blank?
      @pharmacies = Pharmacy.find_name(params[:pn]).page(params[:page]).per(10)
    elsif params[:pn].blank? && params[:pc].present? && params[:pq].blank?
      @pharmacies = Pharmacy.find_city(params[:pc]).page(params[:page]).per(10)
    elsif params[:pn].blank? && params[:pc].blank? && params[:pq].present?
      @pharmacies = Pharmacy.find_quartier(params[:pq]).page(params[:page]).per(10)
    else
      @pharmacies = Pharmacy.where(city: current_user.city).page(params[:page]).per(10)
    end
    render :index
  end

  def psearch
    if params[:pr].present?
      @products = Product.where(pharmacy_id: params[:id]).find_product(params[:pr])
      @pharmacy = Pharmacy.find(params[:id])
      @comments = @pharmacy.comments
      @comment = @pharmacy.comments.build
      @comment.user_id = current_user.id
    else
      @products = Product.where(pharmacy_id: params[:id])
      @pharmacy = Pharmacy.find(params[:id])
      @comments = @pharmacy.comments
      @comment = @pharmacy.comments.build
      @comment.user_id = current_user.id
    end
    render :show
  end

  def show
    if current_user && current_user.user_role == "Pharmacien" && current_user.pharmacy.nil?
      flash[:alert] = "Veuillez créer votre pharmacie." 
      redirect_to new_pharmacy_path
    end
    @products = Product.where(pharmacy_id: @pharmacy.id)
    @comments = @pharmacy.comments
    @comment = @pharmacy.comments.build
    @comment.user_id = current_user.id
    @day = DateTime.now.strftime("%w").to_i
    if @day == 1
      @when = @pharmacy.schedules[0].lundi
    elsif @day == 2
      @when = @pharmacy.schedules[0].mardi
    elsif @day == 3
      @when = @pharmacy.schedules[0].mercredi
    elsif @day == 4
      @when = @pharmacy.schedules[0].jeudi
    elsif @day == 5
      @when = @pharmacy.schedules[0].vendredi
    elsif @day == 6
      @when = @pharmacy.schedules[0].samedi
    elsif @day == 0
      @when = @pharmacy.schedules[0].dimanche
    end
  end
  
  def new
    if !current_user
      redirect_to new_user_session_path
    elsif current_user && current_user.user_role != "Pharmacien"
      redirect_to pharmacies_path
    else
      @pharmacy = Pharmacy.new
    end
  end
  
  def edit
    if current_user.pharmacy.id != @pharmacy.id
      redirect_to pharmacies_path, alert: "❌ Accès interdit. Veillez à ne plus le refaire s'il vous plaît.❌"
    end
  end
  
  def create
    @pharmacy = Pharmacy.new(pharmacy_params)
    @pharmacy.user_id = current_user.id
    respond_to do |format|
      if @pharmacy.save
        format.html { redirect_to new_schedule_path, notice: "Pharmacie crée avec succès. Maintenant ajoutez vos  horaires d'ouvertures." }
        format.json { render :show, status: :created, location: @pharmacy }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @pharmacy.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def update
    respond_to do |format|
      if @pharmacy.update(pharmacy_params)
        format.html { redirect_to edit_schedule_path(@pharmacy.schedules.ids), notice: "Votre pharmacie a été mise à jour avec succès." }
        format.json { render :show, status: :ok, location: @pharmacy }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @pharmacy.errors, status: :unprocessable_entity }
      end
    end
  end
  

  
  private
  def set_pharmacy
    @pharmacy = Pharmacy.find(params[:id])
  end
  
  def pharmacy_params
    params.require(:pharmacy).permit(:name, :email, :contact, :whatsapp, :city, :quartier)
  end
end
