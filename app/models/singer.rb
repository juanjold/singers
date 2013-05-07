class Singer < ActiveRecord::Base
  attr_accessible :bio, :email, :id, :lastname, :name, :number, :points, :skills, :voicepart, :year, :status, :performing
  scope :performing,      :conditions => { :performing => true }
  validates :number, :numericality => true, :length => { :is => 10 }
  validates :name, :lastname, :status, :email, :year, presence: true
  validates :email, :uniqueness=> true, :format => {:with =>  /^(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})$/i }
  
end
