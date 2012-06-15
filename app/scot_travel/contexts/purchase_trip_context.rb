module Contexts
  class PurchaseTripContext
    attr_accessor :params, :buyer

    def initialize(params, current_user)
      @params = params
      @buyer = current_user.extend(Roles::Buyer)
    end

    def call
      trip_id = params.delete(:purchasable_id)
      hotel_id = params.delete(:lodging)
      extra_ids = params.delete(:extras)
      result = buyer.purchase(Trip.find(trip_id), params)
      extra_ids.each do |extra_id|
        buyer.add_to_purchase(result, Extra.find(extra_id), 1)
      end
      buyer.add_to_purchase(result, Hotel.find(hotel_id), params[:length_of_stay])
      result.save
      result
    end

  end
end