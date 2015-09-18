require 'rails_helper'

describe WebsitesController do
  context 'logged in user' do
    let!(:user) { create(:user) }
    let!(:website) {create(:website)}
    login_user
    it "should have a current_user" do
      subject.current_user.should_not be_nil
      expect(user.email).to eq 'email@pl.pl'
    end

    it "should create new website" do
      expect(website.name).to eq 'http://www.wp.pl'
      expect(website).to be_a(Website)
      expect(website).to be_persisted      
    end

    it "should redirect to root" do
      expect(response).to be_success
    end

  end

  context 'not logged in user' do
    let (:use) {create :use}
    it 'should be redirected to login page' do
      get :index
      expect(response).to redirect_to(new_user_session_path)
    end
  end

end
