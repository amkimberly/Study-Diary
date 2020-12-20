class StudyItemsController < ApplicationController
  before_action :set_item, only: %i[show edit update destroy comment mark_as_done]
 
  def new
    @study_item = StudyItem.new
    @categorias = Categorium.all
  end

  def create
    @categorias = Categorium.all
    @study_item = StudyItem.new (study_item_params)
    if @study_item.save
      redirect_to root_path
    else
      render_ :new
    end
    flash[:notice] = "Item cadastrado com sucesso!" 
  end
  
  def see_items
    @study_items = StudyItem.all
  end

  def show
  end

  def search  
     @title = params[:title]
     @study_items = StudyItem.where "title LIKE ? ", "%#{@title}%"
  end

  def edit
    render_ :edit
  end

  def update
    if @study_item.update (study_item_params)
      flash[:notice] = "Item atualizado com sucesso!"
      redirect_to study_items_all_path
    else
      render_ :edit
    end
  end

  def destroy
    @study_item.destroy

    #varáveis de instância só duram uma requisição. Utilizar o flash para alertas.
    flash[:notice] = "Item removido com sucesso!"
    redirect_to study_items_all_path
  end

  def mark_as_done
    @study_item.update(finished_at: Date.current)
    redirect_to @study_item
  end

  
  private

  def render_ (view)
    @categorias = Categorium.all
    render (view)
  end

  def set_item
    @study_item = StudyItem.find(params[:id])
  end

  def study_item_params
    params.require(:study_item).permit (:title, :description, :category_id, :deadline, :comment)
  end
end