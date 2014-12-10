Spree::ProductsController.class_eval do
  before_action :initialize_comment, only: :show
  private
  def initialize_comment
    #add comments to product show view
    @comment = Spree::Comment.new
    @comments = @product.comments.preload(:user)
  end
end