require 'spec_helper'

describe FavoritesController do
  let(:favorite_attrs)     {{ :format => :json, :favorite => attributes_for(:favorite) }}
  let(:bad_favorite_attrs) {{ :format => :json, :favorite => { :name => nil } }}
  subject  { response }

  context "existing favorite" do
    let!(:favorite)      { create :favorite }
    let(:favorite_attrs) { { :id => favorite.id, :format => :json, :favorite => { :name => "Sirloin tips", :meal => "Meat Soup" } } }

    describe "GET 'show'" do
      before(:each) { get :show, :id => favorite.id, :format => :json }

      its(:body)    { should_not be_empty }
      its(:status)  { should be 200}

      context "with an unknown favorite" do
        before(:each) { get :show, :id => 9999, :format => :json }

        its("body.strip") { should be_empty }
        its(:status)      { should be 404 }
      end #/context "with an unknown favorite"
    end #/describe "GET 'show'"

    describe "PUT 'update'" do
      before(:each) { put :update, favorite_attrs }

      its("body.strip") { should be_empty }
      its(:status)      { should be 204 }

      it "updates the favorite" do
        Favorite.find(favorite.id).name.should eq favorite_attrs[:favorite][:name]
      end

      context "with bad params" do
        before(:each) { put :update, { :id => favorite.id, :favorite => { :meal => nil }, :format => :json } }

        its(:body)    { should_not be_empty }
        its(:status)  { should be 422 }
      end #/context "with bad params"
    end #/describe "PUT 'update'"
  end #/context "existing favorite"
end #/describe FavoritesController
