class Sent < ActiveRecord::Base
  belongs_to :user
  attr_accessible :message, :sent_to, :status, :user_id
end
