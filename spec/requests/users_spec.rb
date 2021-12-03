 require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/users", type: :request do
  
  # User. As you add validations to User, be sure to
  # adjust the attributes here as well.
  let(:user) {create(:user)}

  describe "GET /index" do
    it "renders a successful response" do
      get users_url
      expect(response.status).to eq(200)
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      get user_url(user.id)
      expect(response.status).to eq(200)
    end
  end

  describe "POST /Login" do
    it 'allows the user to redirect after successful login' do
      post login_path, :params => {user: {email: user.email, password: user.password}}
      expect(flash[:notice]).to eq('You have successfully Logged in.')
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_user_url
      expect(response.status).to eq(200)
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      get edit_user_url(user.id)
      expect(response.status).to eq(200)
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new User" do
        expect {
          post users_url,params: { user: { name: user.name, email: user.email, password: user.password,
          access: user.access, role: user.role}}
        }.to change(User, :count).by(2)
      end

      it "redirects to the created user" do
        post users_url, params: { user: { name: user.name, email: user.email, password: user.password,
        access: user.access, role: user.role}}
        expect(response.status).to redirect_to(user_url(User.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new User" do
        expect {
          post users_url, params: { user: { name: '', email: '', password: '',
            access: user.access, role: user.role}}
        }.to change(User, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post users_url, params: { user: { name: user.name, email: user.email, password: user.password,
        access: user.access, role: user.role}}
        expect(response.status).to eq(302)
      end
    end
  end

  describe "PATCH /update" do
    let(:user) {create(:user)}
    context "with valid parameters" do
      it "updates the requested user" do
        patch user_url(user.id), params: { user: { name: user.name, email: user.email, password: user.password,
        access: user.access, role: user.role}}
        user.reload
      end

      it "redirects to the user" do
        patch user_url(user.id), params: { user: { name: user.name, email: user.email, password: user.password,
          access: user.access, role: user.role}}
        user.reload
        expect(response.status).to eq(302)
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        patch user_url(user.id), params: { user: { name: user.name, email: user.email, password: user.password,
          access: user.access, role: user.role}}
        expect(response.status).to eq(302)
      end
    end
  end

  describe "DELETE /destroy" do
    let(:user) {create(:user)}
    it "destroys the requested user" do
      User.create(name: user.name, email: user.email, password: user.password).save
      expect {
        delete user_url(user.id)
      }.to change(User, :count).by(-1)
    end

    it "redirects to the users list" do
      delete user_url(user.id)
      expect(response.status).to eq(302)
    end
  end
end
