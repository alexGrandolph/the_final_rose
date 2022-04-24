class Bachelorette < ApplicationRecord
  has_many :contestants
  


  def average_age_of_contestants
    # binding.pry
    contestants.average(:age)
  end

  def unique_hometowns
    contestants.order(:hometown)
    .select(:hometown)
    .group(:hometown)
    .pluck(:hometown)
  end

  
end
