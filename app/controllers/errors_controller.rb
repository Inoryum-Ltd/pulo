class ErrorsController < ApplicationController
	
	layout "error"

  def not_found
    render status: 404
    @page_title = "Oops! This Page Could Not Be Found"
  end

  def unacceptable
    render status: 422
    @page_title = "422 Something went wrong"
  end

  def internal_server_error
    render status: 500
    @page_title = "500 Internal server error"
  end

end