class Api::V1::SchoolsController < Api::ApiController

  def index
    render json: {success: true}
  end

end
