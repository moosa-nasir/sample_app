class User < ActiveRecord::Base
  has_many :sent
  attr_accessible :active, :cell_no, :nick, :password
end
