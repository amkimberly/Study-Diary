class StudyItemsController < ApplicationController

  def see_items
    @study_items = StudyItem.all
  end

  def show
    @study_item = StudyItem.find(params[:id])
  end

  def search
     @title = params[:title]
     @study_items = StudyItem.where "title like ?", "%#{@title}%"
  end

  def new
    @study_item = StudyItem.new
  end

  def create
    @study_item = StudyItem.new params.require(:study_item).permit :title, :description, :category
    if @study_item.save
      redirect_to root_path
    else
      render :new
    end
    flash[:notice] = "Item cadastrado com sucesso!" 
  end

  def destroy
    @study_item = StudyItem.find(params[:id])
    @study_item.destroy
    #varáveis de instância só duram uma requisição. Utilizar o flash para alertas.
    flash[:notice] = "Item removido com sucesso!"
    redirect_to study_items_all_path
  end
end