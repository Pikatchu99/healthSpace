class HomepageController < ApplicationController
  def index
  if current_user
      redirect_to pharmacies_path
    end
  end
end
