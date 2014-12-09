module Spree
  class Comment < Spree::Base
    belongs_to :product
    belongs_to :user
  end
end
