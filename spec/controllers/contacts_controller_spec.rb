require 'rails_helper'

describe ContactsController do
  describe 'GET #index' do
    context 'with params[:letter]' do
      it "populates an array of contacts starting with the letter" do
        smith = create(:contact, lastname: 'Smith')
        jones = create(:contact, lastname: 'Jones')
        get :index, letter: 'S'
        expect(assigns(:contacts)).to match_array([smith])
      end

      it "renders the :index template" do
        get :index
        expect(response).to render_template :index
      end
    end

    context 'without params[:letter]' do
      it "populates an array of all contacts" do
        smith = create(:contact, lastname: 'Smith')
        jones = create(:contact, lastname: 'Jones')
        get :index
        expect(assigns(:contacts)).to match_array([smith, jones])
      end
      it "renders the :index template" do
        get :index
        expect(response).to render_template :index
      end
    end
  end

  describe 'GET #show' do
    before :each do
      @contact = create(:contact)
      get :show, id: @contact
    end

    it "assigns the requested contact to @contact" do
      expect(assigns(:contact)).to eq @contact
    end

    it "renders the :show template" do
      expect(response).to render_template :show
    end
  end

  describe 'GET #new' do
    before :each do
      get :new
    end

    it "assigns a new Contact to @contact" do
      expect(assigns(:contact)).to be_a_new(Contact)
    end

    it "renders the :new template" do
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    before :each do
      @contact = create(:contact)
      get :edit, id: @contact
    end

    it "assigns the requested contact to @contact" do
      expect(assigns(:contact)).to eq @contact
    end

    it "renders the :edit template" do
      expect(response).to render_template :edit
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it "saves the new contact in the database"
      it "redirects to contacts#show"
    end

    context 'with invalid attributes' do
      it "does not save the new contact in the database"
      it "re-renders the :new template"
    end
  end

  describe 'PATCH #update' do
    context 'with valid attributes' do
      it "updates the contact in the database"
      it "redirects to the contact"
    end

    context 'with invalid attributes' do
      it "does not update the contact"
      it "re-renders the :edit template"
    end
  end

  describe 'DELETE #destroy' do
    it "deletes the contact from the database"
    it "redirects to users#index"
  end
end
