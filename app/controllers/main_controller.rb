class MainController < ApplicationController
  def index
    respond_to do |format|
      msg = { :status => "ok", :message => "Success!", :html => "<b>...</b>" }
      format.json  { render :json => msg } # don't do msg.to_json
    end

  end

  def new_user
    msg = {}
    #number_reg = /^(0092|\+92|0)(33)\d{8}$/
    
    if User.find_by_nick(params[:nick])
        msg[:status] = 1
        msg[:des] = "User already exist"
    else
      password = "7744"
      User.create(:nick => params[:nick] , :cell_no => params[:number], :password => password, :active => 1)
      msg[:status] = 0
      msg[:des] = "7744"
    end
    respond_to do |format|
      format.json  { render :json => msg.to_json}
    end
  end
end
