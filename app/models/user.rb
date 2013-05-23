class User < ActiveRecord::Base
  attr_accessible :active, :cell_no, :nick, :password
end
