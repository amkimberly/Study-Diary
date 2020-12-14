class StudyItemsController < ApplicationController

  def see_items
    @study_items = StudyItem.all
  end

  def new
    @study_item = StudyItem.new
  end

  def show
    @study_item = StudyItem.find(params[:id])
  end
  
  def destroy
    @study_item = StudyItem.find(params[:id])
    @study_item.destroy
    flash[:notice] = "Item removido!"
    redirect_to study_items_all_path
  end

  def create
    @study_item = StudyItem.create params.require(:study_item).permit :title, :description, :category
    flash[:notice] = "Item cadastrado!"
    redirect_to root_path
  end
end