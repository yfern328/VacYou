class ErrorsController < ApplicationController
  def error_400
    byebug
    render status: :bad_request
  end

  def error_404
    render status: '404'
  end
end
