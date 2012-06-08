class HomeController < ApplicationController
  def index
    @trips = Presenters::TripPresenter.present_trips(Trip.all)
  end
end
