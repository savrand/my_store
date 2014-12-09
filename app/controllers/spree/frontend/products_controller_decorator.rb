Spree::ProductsController.class_eval do
  before_action :initialize_comment, only: :show
  private
  def initialize_comment
    expire_fragment( [I18n.locale, current_currency, @product])
    @comment = Spree::Comment.new
    @comments = @product.comments.preload(:user)
  end
end