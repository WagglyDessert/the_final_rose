class Bachelorette < ApplicationRecord
  has_many :contestants
  
  def avg_age_of_contestants
    self.contestants.average("age").to_f
  end
end