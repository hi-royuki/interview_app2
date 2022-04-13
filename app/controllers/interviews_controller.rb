class InterviewsController < ApplicationController
  def new
  end

  def index
    @company_name = CompanyName.find(params[:company_name_id])
    @interview = Interview.new
    @interviews = Interview.all.order(create_at: :desc)
  end

  def create
    @interview = Interview.new(interview_params)
    @company_name = CompanyName.find(params[:company_name_id])
    if @interview.save
      redirect_to user_company_name_interviews_path, notice: "投稿しました。"
    else
      @interviews = Interview.all.order(created_at: :desc)
      render action: :index
    end
  end

  def show
  end

  def edit
    @company_name = CompanyName.find(params[:company_name_id])
    @interview = Interview.find(params[:id])
  end

  def update
    @company_name = CompanyName.find(params[:company_name_id])
    @interview = Interview.find(params[:id])
    @interview.update(interview_params)
    redirect_to user_company_name_interviews_path(@interview), notice: "変更しました。"
  end

  def destroy
    @interview = Interview.find(params[:id])
    @interview.destroy
    redirect_to user_company_name_interviews_path(@interview), notice: "削除できました。"
  end

  private
  def interview_params
    params.require(:interview).permit(:answer, :content, :memo)
  end
end
