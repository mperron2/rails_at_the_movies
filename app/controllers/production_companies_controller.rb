class ProductionCompaniesController < ApplicationController
  def index
    # fetch production companies
    @production_companies = ProductionCompany.all
  end

  def show
    # fetch individual production company
    @production_company = ProductionCompany.find(params[:id])
  end
end
