require 'rails_helper'

describe WebsitesController do
  context 'logged in user' do
    let!(:user) { create(:user) }
    let!(:website) {create(:website)}
    login_user
    it "should have a current_user" do
      expect(subject.current_user).to_not be_nil
      expect(user.email).to eq 'email@pl.pl'
    end

    it "should create new website" do
      expect(website.name).to eq 'http://www.wp.pl'
      expect(website).to be_a(Website)
      expect(website).to be_persisted     
    end

    it "should create associated response" do
      expect(website.responses).to_not be_nil
      expect(website.responses.last.id).to eq website.id
    end 

    it "should create response" do
      expect(website.responses).to_not be_nil
    end

    it "should redirect to root" do
      expect(response).to be_success
    end

  end

  context 'not logged in user' do
    let (:user) {create :user}
    it 'should not be logged in' do
      expect(subject.current_user).to be_nil
    end
    it 'should be redirected to login page' do
      get :index
      expect(response).to redirect_to(new_user_session_path)
    end
  end

end
