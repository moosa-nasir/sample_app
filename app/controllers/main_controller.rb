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
    unless params[:nick].blank? || params[:number].blank?
      if User.find_by_nick(params[:nick])
        msg[:status] = 1
        msg[:des] = "User already exist"
      else
        password = "7744"
        user = User.create(:nick => params[:nick] , :cell_no => params[:number], :password => password, :active => 1)
        msg[:status] = 0
        msg[:des] = user.id
      end
    else
      msg[:status] = 1
      msg[:des] = "Please fill the required information"
    end
    
    respond_to do |format|
      format.json  { render :json => msg.to_json}
    end
  end

  def sent_message
    
    msg = {}
    unless params[:id].blank? || params[:numbers].blank?

      user = User.find(params[:id])
      unless user.nil?
        unless params[:numbers].size <= 5
          begin
            message = "#{user.nick} says: \n#{params[:message]} \n\nFrom #{user.cell_no}"
            params[:numbers].each do |number|
              Sent.create(:user_id => params[:id], :message => message, :sent_to => number , :status => 0)
            end
            msg[:status] = 0
            msg[:des] = "Message sent successfully"
          rescue
            msg[:status] = 1
            msg[:des] = "Something went wrong, Message not sent please try again"
          end
        else
          msg[:status] = 1
          msg[:des] = "You enter more then 5 numbers"
        end
        
      else
        msg[:status] = 1
        msg[:des] = "User does not exist"
      end

    else
      msg[:status] = 1
      msg[:des] = "Please fill the required information"
    end
    
    respond_to do |format|
      format.json  { render :json => msg.to_json}
    end
  end
end
