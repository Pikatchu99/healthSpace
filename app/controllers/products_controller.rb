class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy]
  before_action :authenticate_user!

  # GET /products or /products.json
  def index
    if current_user.user_role == "Patient"
      redirect_to pharmacies_path, alert: "❌ Accès non autorisé. ❌"
    elsif current_user.user_role == "Pharmacien"
      redirect_to pharmacien_path(current_user.id), notice: "Vous pouvez voir vos produits ici sur votre dashboard."
    else
      redirect_to rails_admin_path
    end
  end

  # GET /products/1 or /products/1.json
  def show
  end

  def asking
    redirect_to "https://wa.me/229#{params[:wsp]}?text=Bonjour,Je%20m'apelle%20#{current_user.name.gsub(/\s+/, "")}%20et%20je%20suis%20un%20utilisateur%20de%20la%20plateforme%20HealthSpace.%20J'aimerai%20savoir%20si%20le%20produit%20du%20nom%20#{params[:pn]}%20est%20disponible%20dans%20votre%20pharmacie."
    # redirect_to link
  end
  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
    if current_user.pharmacy.id != @product.pharmacy.id
      redirect_to pharmacies_path, alert: "❌ Accès interdit. Veillez à ne plus le refaire s'il vous plaît.❌"
    end
  end

  # POST /products or /products.json
  def create
    @product = Product.new(product_params)
    @product.pharmacy_id = current_user.pharmacy.id

    respond_to do |format|
      if @product.save
        format.html { redirect_to pharmacien_path(current_user.id), notice: "Produit crée avec succès." }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to pharmacien_path(current_user.id), notice: "Produit mis à jour avec succès." }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to pharmacien_path(current_user.id), notice: "Le produit a été détruit avec succès." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:name, :description, :available, :first_image, :second_image, :first_image_cache, :second_image_cache)
    end
end
