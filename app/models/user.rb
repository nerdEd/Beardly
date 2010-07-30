class User < ActiveRecord::Base
  validates :name, :presence => true, :uniqueness => true
  validates :twitter_handle, :presence => true, :uniqueness => true
end
