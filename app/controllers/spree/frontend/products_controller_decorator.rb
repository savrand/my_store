Spree::ProductsController.class_eval do
  before_action :initialize_comment, only: :show
  private
  def initialize_comment
    @comment = Spree::Comment.new
    @comments = @product.comments.preload(:user)
  end
end