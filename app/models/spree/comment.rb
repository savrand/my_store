module Spree
  class Comment < Spree::Base
    belongs_to :product, touch: true #use touch for update cache on product show
    belongs_to :user
  end
end
