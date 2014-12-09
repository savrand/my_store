Spree::User.class_eval do
  has_many :comments, :class_name => 'Spree::Comment'
end