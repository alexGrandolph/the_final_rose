require 'rails_helper'

RSpec.describe 'Bachelorette Contestant Index Page' do
  
  describe 'as a visitor' do
    before do

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
    end 

    it 'has only the contestants belonging to the bachelorette' do 
      visit "/bachelorettes/#{@bach2.id}/contestants"
      # save_and_open_page
      expect(page).to have_content("barry bonds")
      expect(page).to have_content("sammy sosa")
      expect(page).to have_content("sammy sosas corked bat")
      expect(page).to have_content("mark ROIDS mcguire")      

      expect(page).to_not have_content("leroy")
      expect(page).to_not have_content("bob saget")
      expect(page).to_not have_content("ludacris")

    end 

    it 'shows contestants attributes and link to that contestants show page' do 
      visit "/bachelorettes/#{@bach2.id}/contestants"
      # save_and_open_page
      within "#contestant-#{@contest5.id}" do
        expect(page).to have_content("Age: 55")
        expect(page).to have_content("Hometown: juice world")
        expect(page).to have_link("View This Contestant")
        expect(page).to_not have_content("Age: 21")
      end 

      within "#contestant-#{@contest6.id}" do
        expect(page).to have_content("Age: 21")
        expect(page).to have_content("Hometown: steroid city")
        expect(page).to have_link("View This Contestant")
        expect(page).to_not have_content("Age: 49")
      end 

      within "#contestant-#{@contest7.id}" do
        expect(page).to have_content("Age: 49")
        expect(page).to have_content("Hometown: corksville")
        expect(page).to_not have_content("Age: 55")
        click_link "View This Contestant"
      end 
    end 

    it 'shows a list of unique hometowns for contestants' do

      bach3 = Bachelorette.create!(name: 'Timbo', season_number: 69, description: 'stupid ass show')

      cont1 = bach3.contestants.create(name: 'leroy', age: 69, hometown: 'milawaukee')
      cont2 = bach3.contestants.create(name: 'bob saget', age: 44, hometown: 'cheese town')
      cont3 = bach3.contestants.create(name: 'ludacris', age: 89, hometown: 'buttsville')
      cont4 = bach3.contestants.create(name: 'actually 50 cent', age: 69, hometown: 'milawaukee')
      cont5 = bach3.contestants.create(name: 'elron hubbard', age: 65, hometown: 'milawaukee')
      
      visit "/bachelorettes/#{bach3.id}/contestants"
      # save_and_open_page
      expect(page).to have_content("These Contestants are from these hometowns: buttsville, cheese town, milawaukee")
    end 


  end 
end 