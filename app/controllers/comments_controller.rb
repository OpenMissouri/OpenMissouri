class CommentsController < ApplicationController
  
  def create
    @data_set = DataSet.find(params[:data_set_id])
    @comment = @data_set.comments.new(params[:comment].except([:data_set_id]))
    @comment.user = current_user
    @comment.save
    redirect_to @data_set
  end
  
end
