require 'rails_helper'

describe "delete a task process" do
	it "deletes a task" do
		list = List.create(:name => 'Home stuff')
        task = Task.create(:description => 'Wash the dishes', :list_id => list.id)
        visit list_path(list)
        click_on 'Delete'
        expect(page).to have_content 'List'
	end
end