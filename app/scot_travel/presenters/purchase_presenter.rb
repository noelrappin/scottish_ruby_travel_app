module Presenters
  class PurchasePresenter < SimpleDelegator
    include ActionView::Helpers::NumberHelper
    attr_accessor :purchase, :buyer

    def initialize(purchase)
      super(purchase)  
      @purchase = purchase
      @buyer = purchase.buyer.extend(Roles::Buyer)
    end

    def buyer_name
      "#{buyer.first_name} #{buyer.last_name}"
    end

    def hotel
      @hotel ||= begin
        @purchase.purchase_extras.select { |pe| pe.extra_type == "Hotel"}[0]
      end
    end

    def extras
      @extras ||= begin
        @purchase.purchase_extras.reject { |pe| pe.extra_type == "Hotel"}
      end
    end

    def hotel_name
      hotel.extra.name
    end

    def hotel_price
      number_to_currency(hotel.extended_price)
    end

    def hotel_price_display
      "#{hotel.unit_count} nights at #{number_to_currency(hotel.unit_price)} = #{hotel_price}"
    end

    def extras_display
      extras.map { |e| "#{e.extra.name} (#{number_to_currency(e.extended_price)})" }
    end

    def total_price_display
      number_to_currency(@purchase.total_price)
    end

  end
end