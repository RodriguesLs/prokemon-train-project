class ApplicationController < ActionController::API
  def health
    render json: { message: 'API is running successfully' }
  end
end
