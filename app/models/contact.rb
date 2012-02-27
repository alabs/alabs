class Contact < ActiveRecord::Base
  
  validates_presence_of :name
  validates_format_of :email, :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i
  validates_presence_of :subject
  validates_presence_of :body

  attr_accessible :name, :email, :subject, :body, :mailing
end
