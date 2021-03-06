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

RSpec.describe "/islands", type: :request do
  # Island. As you add validations to Island, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      Island.create! valid_attributes
      get islands_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      island = Island.create! valid_attributes
      get island_url(island)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_island_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      island = Island.create! valid_attributes
      get edit_island_url(island)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Island" do
        expect {
          post islands_url, params: { island: valid_attributes }
        }.to change(Island, :count).by(1)
      end

      it "redirects to the created island" do
        post islands_url, params: { island: valid_attributes }
        expect(response).to redirect_to(island_url(Island.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Island" do
        expect {
          post islands_url, params: { island: invalid_attributes }
        }.to change(Island, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post islands_url, params: { island: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested island" do
        island = Island.create! valid_attributes
        patch island_url(island), params: { island: new_attributes }
        island.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the island" do
        island = Island.create! valid_attributes
        patch island_url(island), params: { island: new_attributes }
        island.reload
        expect(response).to redirect_to(island_url(island))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        island = Island.create! valid_attributes
        patch island_url(island), params: { island: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested island" do
      island = Island.create! valid_attributes
      expect {
        delete island_url(island)
      }.to change(Island, :count).by(-1)
    end

    it "redirects to the islands list" do
      island = Island.create! valid_attributes
      delete island_url(island)
      expect(response).to redirect_to(islands_url)
    end
  end
end
