class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]
  def index
    if params[:search]
      # Show search results for jobs created by the signed-in user
      @jobs = current_user.jobs.search(params[:search]).order("created_at DESC")
    else
      # Show all jobs created by the signed-in user
      @jobs = current_user.jobs
    end
      @user_jobs = current_user.jobs
  end

  def show
    # Only show a job if created by the signed-in user
    @job = current_user.jobs.find(params[:id])
  end

  def new
    @job = Job.new
  end

  def create
    @job = current_user.jobs.build(permitted_params)
    respond_to do |format|
      if @job.save
        format.html { redirect_to root_path, notice: 'Your job has been posted.' }
      else
        format.html { render :new }
      end
    end
  end

  def search_params
    @query_title = params[:search]
  end

  private

  def set_job
    @job = Job.find(params[:id])
  end

  def permitted_params
    params.require(:job).permit(:name, :description, :status, :employment_type, :user_id)
  end
end
