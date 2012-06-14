class BaseController < ApplicationController
  protect_from_forgery
  def load_accounts_index_resources
    @accounts = Account.with_permissions_to
      .filter_by_active(@filter_by_active)
      .filter_by_type(@filter_by_type)
      .filter_by_name(@filter_by_name)
      .basic_search(@query)
      .paginate(:page => params[:page], :per_page => @per_page)
      .order('id DESC')
  end
  # Handle non unique record exception.
  rescue_from 'ActiveRecord::RecordNotUnique' do |exception|
    @transaction.update_attribute(:status,"failure") if @transaction.present?
    if @account.present?
      flash[:alert] = "Ani already exists in call platform."
      redirect_to csportal_account_path(@account.id)
    else
      flash[:alert] = "Account already exists inside the call platform."
      redirect_to csportal_accounts_path
    end
  end
  
end