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

    def add_to_purchase(purchase, extra, unit_count, purchase_extra_class = PurchaseExtra)
      purchase_extra = purchase_extra_class.new(
          :purchase => purchase, :extra => extra, :unit_count => unit_count,
          :unit_price => extra.price)
      purchase.purchase_extras << purchase_extra
      purchase_extra  
    end
  end
end