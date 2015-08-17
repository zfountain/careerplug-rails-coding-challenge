class CommentsController < ApplicationController

  # def new
  #   @comment = Comment.new
  # end

  def show
    @comments = @job.comments.build(comment_params)
  end

  def create
    @job = Job.find(params[:job_id])
    @comment = @job.comments.build(comment_params)
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @job }
        format.js
      else
        format.html { render :new }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
  end

  private
    def comment_params
      params.require(:comment).permit(:content)
    end
end