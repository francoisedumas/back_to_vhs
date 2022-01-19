class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :contact, :send_contact_mail]
  before_action :set_contact_form, only: %i[contact]

  def home
    @movies = Movie.all

    @movies_selection = @movies.select{ |movie| movie.release_year.between?(1990,1999)}.first(6)

    @markers = @movies.geocoded.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude
      }
    end
  end

  def contact
  end

  def send_contact_mail
    @contact_form = Form.new(contact_params)
    if @contact_form.valid?
      ContactMailer.contact_email(@contact_form).deliver_now
      redirect_to root_path
    else
      flash[:alert] = "Something wrong!"

      render 'contact'
    end
  end

  private

  def set_contact_form
    @contact_form = Form.new
  end

  def contact_params
    params.require(:form).permit(:first_name, :last_name, :email, :message, :role, :workshop)
  end
end
