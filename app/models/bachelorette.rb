class Bachelorette < ApplicationRecord
  has_many :contestants
  
  def avg_age_of_contestants
    self.contestants.average("age").to_f
  end

  def hometown_list
    self.contestants
    .select("contestants.hometown")
    .distinct
    .order("contestants.hometown")
    .pluck(:hometown)
  end
end