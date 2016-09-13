require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) { create(:user) }

  describe "GET #index" do
    subject { get :index }

    before :each do
      login user
      subject
    end

    it "gets a paginated list of users" do
      expect(assigns[:users]).to eq [user]
    end

    it "renders the index template" do
      expect(response).to render_template :index
    end
  end

  describe "GET #show" do
    subject { get :show, id: user.id }

    before :each do
      subject
    end

    it "finds a specific user" do
      expect(assigns[:user]).to eq user
    end

    it "renders the index template" do
      expect(response).to render_template :show
    end
  end

  describe "GET #new" do
    subject { get :new }

    before :each do
      subject
    end

    it "instantiates a new user" do
      expect(assigns[:user]).to be_new_record
    end

    it "renders the new template" do
      expect(response).to render_template :new
    end
  end

  describe "POST #create" do
    subject { post :create, user: params }

    context "with valid params" do
      let(:params) { {name: "test_user", email: "test@example.com", password: "password", password_confirmation: "password"} }

      it "creates a new user" do
        expect{ subject }.to change(User, :count).by(1)
      end

      it "renders a success flash message" do
        subject
        expect(flash["success"]).to eq "Welcome to the Sample App!"
      end

      it "redirect the user to the user's show page" do
        subject
        expect(response).to redirect_to user_path(User.last)
      end
    end

    context "with invalid params" do
      let(:params) { {name: " ", email: "test@example.com", password: "password", password_confirmation: "password"} }

      it "does not create a new user" do
        expect{ subject }.not_to change(User, :count)
      end

      it "renders the new template" do
        subject
        expect(response).to render_template :new
      end
    end
  end

  describe "GET #edit" do
    subject { get :edit, id: user.id }

    before :each do
      login user
      subject
    end

    it "finds a specific user" do
      expect(assigns[:user]).to eq user
    end

    it "renders the edit template" do
      expect(response).to render_template :edit
    end
  end

  describe "PATCH #update" do
    subject { patch :update, { id: user.id, user: params } }

    before :each do
      login user
    end

    context "with valid params" do
      let(:params) { {name: "example_user", email: "test@example.com", password: "password", password_confirmation: "password"} }


      before :each do
        subject
      end

      it "updates the user's attributes" do
        user.reload
        expect(user.name).to eq "example_user"
      end

      it "renders a success flash message" do
        expect(flash["success"]).to eq "Profile updated"
      end
    end

    context "with invalid params" do
      let(:params) { {name: " ", email: "test@example.com", password: "password", password_confirmation: "password"} }

      before :each do
        subject
      end

      it "does not update the user's attributes" do
        expect(user.name).not_to eq " "
      end

      it "renders the edit template" do
        expect(response).to render_template :edit
      end
    end
  end

  describe "DELETE #destroy" do
    subject { delete :destroy, id: user.id }

    before :each do
      login user
    end

    it "find a specific user" do
      subject
      expect(assigns[:user]).to eq user
    end

    it "destroy's the user" do
      expect{ subject }.to change(User, :count).by(-1)
    end

    it "redirect_to to the users page" do
      subject
      expect(response).to redirect_to users_path
    end

    it "renders an success flash message" do
      subject
      expect(flash["success"]).to eq "User successfully deleted"
    end
  end
end
