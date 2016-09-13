require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do

  describe "static views" do
    it "renders a static home page" do
      get :home
      expect(response).to render_template :home
    end

    it "renders a static about page" do
      get :about
      expect(response).to render_template :about
    end

    it "renders a static help page" do
      get :help
      expect(response).to render_template :help
    end

    it "renders a static contact page" do
      get :contact
      expect(response).to render_template :contact
    end
  end

end
