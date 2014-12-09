Deface::Override.new(:virtual_path => "spree/products/show",
                     :name => "add_comments_to_product",
                     :insert_before => "[data-hook='product_properties']",
                     :partial => "spree/overrides/frontend/product_comments" )