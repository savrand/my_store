module Spree
  class Comment < Spree::Base
    belongs_to :product, touch: true
    belongs_to :user
  end
end
