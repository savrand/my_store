class CreateSpreeComments < ActiveRecord::Migration
  def change
    create_table :spree_comments do |t|
      t.text :message
      t.references :product
      t.references :user
      t.timestamps
    end
  end
end
