require 'rails_helper'

describe WebsitesController do
  context 'logged in user' do
    login_user

    it "should have a current_user" do
      subject.current_user.should_not be_nil
    end
  end
end
