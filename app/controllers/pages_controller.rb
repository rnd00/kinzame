class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @tagline = ["Don't get bitten... Borrow locally!",
                "Snap-up a cheap loan!",
                "Take a bite out of debt!",
                "Afraid not-you’re a-loan in this endeavor!",
                "Get your head above water!"]
  end
end
