class AristocratsController < ApplicationController

  def create
     @aristocrat = Aristocrat.create do |param|
      param.first_name = params[:aristocrat][:first_name]
      param.surname = params[:aristocrat][:surname]
      param.email = params[:aristocrat][:email]
    end

    if @aristocrat.valid?
      render :json => '{"aristocrat is born"}'
    else
      render :json => '{"invalid aristocrat input data"}'
    end
  end
end