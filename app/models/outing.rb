class Outing < ApplicationRecord
  has_many :contestant_outings
  has_many :contestants, through: :contestant_outings
  
  def contestant_count
    self.contestants.count
  end
end