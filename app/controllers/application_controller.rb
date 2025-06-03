class ApplicationController < ActionController::API
  before_action :set_cors_headers

  private

  def set_cors_headers
    response.headers['Access-Control-Allow-Origin'] = request.headers['Origin'] || '*'
    response.headers['Access-Control-Allow-Methods'] = 'GET, POST, PUT, PATCH, DELETE, OPTIONS'
    response.headers['Access-Control-Allow-Headers'] = 'Origin, Content-Type, Accept, Authorization, Token, X-Requested-With'
    response.headers['Access-Control-Allow-Credentials'] = 'true'
    response.headers['Access-Control-Max-Age'] = '86400'
  end

  # Handle preflight OPTIONS requests
  def options
    head :ok
  end
end
