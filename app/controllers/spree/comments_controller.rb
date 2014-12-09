class Spree::CommentsController < Spree::BaseController
  def create
    comment = spree_current_user.comments.build(comment_params)
    if comment.save
      redirect_to :back
    end
  end

  private
  def comment_params
    product = Spree::Product.find_by_slug(params[:product_id])
    params[:comment].merge(product_id:  product.id).permit(:product_id, :message)
  end
end