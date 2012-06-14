module Roles
  module Buyer
    def purchase(purchasable, data = {}, purchase_class = Purchase)
      new_purchase = purchase_class.new(:buyer => self,
          :purchasable => purchasable)
      new_purchase.update_attributes(data) 
      purchases << new_purchase
      new_purchase
    end

    def has_purchased?(purchasable)
      purchases.map(&:purchasable).include?(purchasable)
    end
  end
end