class PharmaciesController < ApplicationController
  before_action :set_pharmacy, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /pharmacies or /pharmacies.json
  def index
    @pharmacies = Pharmacy.where(city: current_user.city)
  end
  # GET /search/?parameters
  def search
    session[:search] = {'name' => params[:pn], 'city' => params[:pc], 'quartier' => params[:pq], 'product' => params[:pr], 'availability' => params[:pa]}
    if params[:pn].present? && params[:pc].present? && params[:pq].present?
      @pharmacies = Pharmacy.find_name(params[:pn]).find_city(params[:pc]).find_quartier(params[:pq])
    elsif params[:pn].present? && params[:pc].present? && params[:pq].blank?
      @pharmacies = Pharmacy.find_name(params[:pn]).find_city(params[:pc])
    elsif params[:pn].present? && params[:pc].blank? && params[:pq].present?
      @pharmacies = Pharmacy.find_name(params[:pn]).find_quartier(params[:pq])
    elsif params[:pn].blank? && params[:pc].present? && params[:pq].present?
      @pharmacies = Pharmacy.find_city(params[:pc]).find_quartier(params[:pq])
    elsif params[:pn].present? && params[:pc].blank? && params[:pq].blank?
      @pharmacies = Pharmacy.find_name(params[:pn])
    elsif params[:pn].blank? && params[:pc].present? && params[:pq].blank?
      @pharmacies = Pharmacy.find_city(params[:pc])
    elsif params[:pn].blank? && params[:pc].blank? && params[:pq].present?
      @pharmacies = Pharmacy.find_quartier(params[:pq])
    else
      @pharmacies = Pharmacy.where(city: current_user.city)
    end
    render :index
  end

  def psearch
    if params[:pa].to_i == 1 
      @etat = true
    elsif params[:pa].to_i == 0
      @etat = false
    end
    if params[:pr].present? && params[:pa].present?
      @products = Product.where(pharmacy_id: params[:id]).find_product(params[:pr]).find_availability(@etat)
      @pharmacy = Pharmacy.find(params[:id])
      @comments = @pharmacy.comments
      @comment = @pharmacy.comments.build
    elsif params[:pr].present? && params[:pa].blank?
      @products = Product.where(pharmacy_id: params[:id]).find_product(params[:pr])
      @pharmacy = Pharmacy.find(params[:id])
      @comments = @pharmacy.comments
      @comment = @pharmacy.comments.build
    elsif params[:pr].blank? && params[:pa].present?
      @products = Product.where(pharmacy_id: params[:id]).find_availability(@etat)
      @pharmacy = Pharmacy.find(params[:id])
      @comments = @pharmacy.comments
      @comment = @pharmacy.comments.build
    end
    render :show
  end

  # GET /pharmacies/1 or /pharmacies/1.json
  def show
    @products = Product.where(pharmacy_id: @pharmacy.id)
    @comments = @pharmacy.comments
    @comment = @pharmacy.comments.build
    @comment.user_id = current_user.id
  end
  
  # GET /pharmacies/new
  def new
    if !current_user
      redirect_to new_user_session_path
    elsif current_user && current_user.user_role != "Pharmacien"
      redirect_to pharmacies_path
    else
      @pharmacy = Pharmacy.new

    end
  end
  
  # GET /pharmacies/1/edit
  def edit
  end
  
  # POST /pharmacies or /pharmacies.json
  def create
    @pharmacy = Pharmacy.new(pharmacy_params)
    @pharmacy.user_id = current_user.id
    respond_to do |format|
      if @pharmacy.save
        format.html { redirect_to new_schedule_path, notice: "Pharmacy was successfully created. Now add your opening hours." }
        format.json { render :show, status: :created, location: @pharmacy }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @pharmacy.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # PATCH/PUT /pharmacies/1 or /pharmacies/1.json
  def update
    respond_to do |format|
      if @pharmacy.update(pharmacy_params)
        format.html { redirect_to edit_schedule_path(@pharmacy.schedules.ids), notice: "Pharmacy was successfully updated." }
        format.json { render :show, status: :ok, location: @pharmacy }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @pharmacy.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # # DELETE /pharmacies/1 or /pharmacies/1.json
  # def destroy
  #   @pharmacy.destroy
  #   respond_to do |format|
  #     format.html { redirect_to pharmacies_url, notice: "Pharmacy was successfully destroyed." }
  #     format.json { head :no_content }
  #   end
  # end

  
  private
  # Use callbacks to share common setup or constraints between actions.
  def set_pharmacy
    @pharmacy = Pharmacy.find(params[:id])
  end
  
  # Only allow a list of trusted parameters through.
  def pharmacy_params
    params.require(:pharmacy).permit(:name, :email, :contact, :whatsapp, :city, :quartier)
  end
end
