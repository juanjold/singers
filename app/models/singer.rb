class Singer < ActiveRecord::Base
  attr_accessible :bio, :email, :id, :lastname, :name, :number, :points, :skills, :voicepart, :year, :status, :performing
end
