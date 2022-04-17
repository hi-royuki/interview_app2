class InterviewsController < ApplicationController

  def new
  end

  def index
    # @company_name = CompanyName.find(params[:company_name_id])
    # @interview = Interview.new
    # @interviews = Interview.all.order(create_at: :desc)
  end

  def create
    @interview = Interview.new(interview_params)
    @company_name = CompanyName.find(params[:company_name_id])
    @interview.user_id = current_user.id
    @interview.company_name_id = @company_name.id
    if @interview.save
      redirect_to user_company_name_path(@company_name), notice: "投稿しました。"
    else
      #　redirect_toの場合はflash.now[:alert]は使用不可
      flash[:alert] = "全て入力してください"
      redirect_to user_company_name_path(@company_name)
    end

  end

  # def show

  # end

  def edit
    @company_name = CompanyName.find(params[:company_name_id])
    @interview = Interview.find(params[:id])
  end

  def update
    @company_name = CompanyName.find(params[:company_name_id])
    @interview = Interview.find(params[:id])
  if @interview.update(interview_params)
    redirect_to user_company_name_path(params[:company_name_id]), notice: "変更しました。"
  else
    flash.now[:alert] = "全て入力してください"
    render action: :edit
  end
  end

  def destroy
    Interview.find_by(id: params[:id]).destroy
    redirect_to user_company_name_path(params[:company_name_id]), notice: "削除できました。"
  end

  private
  def interview_params
    params.require(:interview).permit(:answer, :content, :memo)
  end
end
