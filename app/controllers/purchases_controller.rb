class PurchasesController < ApplicationController
  def create
    purchase = Contexts::PurchaseTripContext.new(params[:purchase], current_user).call
    @purchase = Presenters::PurchasePresenter.new(purchase)
    render :show
  end

  def show
    @purchase = Presenters::PurchasePresenter.new(Purchase.find(params[:id]))
  end
end