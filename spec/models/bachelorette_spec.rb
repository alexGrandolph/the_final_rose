require 'rails_helper'

RSpec.describe Bachelorette, type: :model do
  describe 'relationships' do
    it {should have_many :contestants}
  end

  describe 'instance methods' do

    it 'returns the age of a bachelorettes contestants' do
      @bach1 = Bachelorette.create!(name: 'Timbo', season_number: 69, description: 'stupid ass show')
      @bach2 = Bachelorette.create!(name: 'JIMBO', season_number: 4, description: 'dumb show')

      @contest1 = @bach1.contestants.create(name: 'leroy', age: 69, hometown: 'milawaukee')
      @contest2 = @bach1.contestants.create(name: 'bob saget', age: 44, hometown: 'cheese town')
      @contest3 = @bach1.contestants.create(name: 'ludacris', age: 89, hometown: 'buttsville')
      @contest4 = @bach1.contestants.create(name: 'actually 50 cent', age: 6, hometown: 'a town')
      #bach2s contests
      @contest5 = @bach2.contestants.create!(name: 'barry bonds', age: 55, hometown: 'juice world')
      @contest6 = @bach2.contestants.create!(name: 'sammy sosa', age: 21, hometown: 'steroid city')
      @contest7 = @bach2.contestants.create!(name: 'sammy sosas corked bat', age: 49, hometown: 'corksville')
      @contest8 = @bach2.contestants.create!(name: 'mark ROIDS mcguire', age: 26, hometown: 'hometown #1339C')

      expect(@bach2.average_age_of_contestants).to eq(37.75)
    end 

    it 'returns a unique list of hometowns for a bachelorettes contestants' do 
      bach3 = Bachelorette.create!(name: 'Timbo', season_number: 69, description: 'stupid ass show')

      cont1 = bach3.contestants.create(name: 'leroy', age: 69, hometown: 'milawaukee')
      cont2 = bach3.contestants.create(name: 'bob saget', age: 44, hometown: 'cheese town')
      cont3 = bach3.contestants.create(name: 'ludacris', age: 89, hometown: 'buttsville')
      cont4 = bach3.contestants.create(name: 'actually 50 cent', age: 69, hometown: 'milawaukee')
      cont5 = bach3.contestants.create(name: 'elron hubbard', age: 65, hometown: 'milawaukee')

      expect(bach3.unique_hometowns).to eq(["buttsville", "cheese town", "milawaukee"])

    end 
  end 
end
