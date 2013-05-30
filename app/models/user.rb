class User < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :name,:address1,:zipcode ,:email, :password, :mstatus,:dob,:address2,:password
  validates_presence_of :name, :address1,:zipcode ,:email, :password, :mstatus,:dob
  validates :email,:uniqueness => true,:on => :create
  validates_format_of :email, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i, :message => " Invalid Format"
  validates_presence_of :password, :length => {:minimum => 6}

end
