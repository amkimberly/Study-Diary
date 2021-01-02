class CommentsController < ApplicationController

  def create
    @study_item = StudyItem.find(params[:study_item_id])
    @comment = @study_item.comments.create(comment_params)
    redirect_to root_path
    flash.now[:notice] = "Comentário inserido com sucesso!" 
  end
   


  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
