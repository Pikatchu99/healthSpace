class CommentsController < ApplicationController
    before_action :set_pharmacy, only: [:create, :edit, :update]
    before_action :authenticate_user!
  def create
    @pharmacy = Pharmacy.find(params[:pharmacy_id])
      @comment = @pharmacy.comments.build(comment_params)
      respond_to do |format|
        if @comment.save
          format.js { render :index }
        else
          format.html { redirect_to pharmacy_path(@pharmacy), notice: 'Impossible de poster.' }
        end
      end
    end

  def edit
    @comment = @pharmacy.comments.find(params[:id])
    respond_to do |format|
      flash.now[:notice] = 'Modifier votre commentaire'
      format.js { render :edit }
    end
  end
  def update
    @comment = @pharmacy.comments.find(params[:id])
      respond_to do |format|
        if @comment.update(comment_params)
          flash.now[:notice] = 'Votre commentaire a été modifié !'
          format.js { render :index }
        else
          flash.now[:notice] = 'Impossible de modifier votre commentaire'
          format.js { render :edit_error }
        end
      end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      flash.now[:notice] = 'Votre commentaire a été supprimé.'
      format.js { render :index }
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:pharmacy_id, :content)
  end
  def set_pharmacy
    @pharmacy = Pharmacy.find(params[:pharmacy_id])
  end
end
