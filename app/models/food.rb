class Food < ApplicationRecord
  belongs_to :category
  validates :description, presence: true
  
  validates :name, presence: true, uniqueness: true

  validates :price, numericality: true, comparison: { greater_than_or_equal_to: 0.01 }

  def self.by_letter(letter)
    where("name LIKE ?", "#{letter}%").order(:name)
  end
end