require 'spec_helper'
describe Spree::CommentsController, :type => :controller do
  stub_authorization!
  before(:each) {
    @routes = Spree::Core::Engine.routes
    Spree::Product.destroy_all
    request.env["HTTP_REFERER"] = "it's redirect_to back"
  }
  let(:user) { create(:user) }
  let(:product) { create(:product) }
  before do
    allow(controller).to receive_messages :spree_current_user => user
    user.spree_roles.clear
  end


  describe "#create" do
    it "can create message" do
      post :create, :product_id => product.slug, :comment => {:message => "Test Message"}
      response.should redirect_to "it's redirect_to back"
    end
  end
end