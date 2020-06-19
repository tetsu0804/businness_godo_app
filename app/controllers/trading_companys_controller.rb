class TradingCompanysController < ApplicationController

  def index
    @companys = TradingCompany.all
  end

  def show
    @company = TradingCompany.find(params[:id])
  end

  def new
    @company = TradingCompany.new
  end

  def create
    @company = TradingCompany.new(trading_company_params)
    if @company.save
      flash[:success] = '取引会社を作成しました。'
      redirect_to trading_company_path(@company.id)
    else
      flash[:danger] = '取引会社の作成失敗しました。'
      render 'new'
    end
  end

  def edit
    @company = TradingCompany.find(params[:id])
  end

  def update
    @company = TradingCompany.find(params[:id])
    if @company.update_attributes(trading_company_params)
      flash[:success] = "#{@company.company_name}を編集しました。"
      redirect_to trading_company_path(@company.id)
    else
      flash[:danger] = "#{@company.company_name}の編集失敗しました。"
      render 'edit'
    end
  end

  def destroy
    company = TradingCompany.find(params[:id])
    flash[:notice] = "#{company.company_name}を削除しました。"
    company.destroy
    redirect_to trading_companys_path
  end

  private

    def trading_company_params
      params.require(:trading_company).permit(:company_name, :address, :tel)
    end
end
