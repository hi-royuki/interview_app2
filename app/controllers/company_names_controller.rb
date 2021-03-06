class CompanyNamesController < ApplicationController
before_action :login?
  def new
    @company_name = CompanyName.new
  end

  def create
    @company_name = CompanyName.new(company_name_params)
    @company_name.user_id = current_user.id

    if @company_name.save
      redirect_to user_path, notice: "登録完了しました"
    else
      flash.now[:alert] = "入力されていません"
      render :new
    end
  end

  def show
    @company_name = CompanyName.find(params[:id])
    @interview = Interview.new
    # @interviews = Interview.all.order(create_at: :desc)
  end

  def index
    @user = current_user
    @company_names = @user.company_names.all.order(created_at: :desc)
  end

  def destroy
    @company_name = CompanyName.find(params[:id])
    @company_name.destroy
      redirect_to user_path, notice: "削除されました。"
  end

  private
  def company_name_params
    params.require(:company_name).permit(:interview_date, :company_name)
  end

end
