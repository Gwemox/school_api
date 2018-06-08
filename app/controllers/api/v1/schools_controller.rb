class Api::V1::SchoolsController < Api::ApiController
  before_action :get_school, only: [:show, :update, :destroy]

  # DOC GENERATED AUTOMATICALLY: REMOVE THIS LINE TO PREVENT REGENERATING NEXT TIME
  api :GET, '/v1/schools', 'List schools'
  param :status, :undef
  error code: 401
  def index
    @schools = School.filter(params)
  end

  # DOC GENERATED AUTOMATICALLY: REMOVE THIS LINE TO PREVENT REGENERATING NEXT TIME
  api :GET, '/v1/schools/:id', 'Show a school'
  def show
  end

  # DOC GENERATED AUTOMATICALLY: REMOVE THIS LINE TO PREVENT REGENERATING NEXT TIME
  api :DELETE, '/v1/schools/:id', 'Destroy a school'
  def destroy
    @success = false
    if (@school)
      @school.destroy
      @success = true
    end
  end

  # DOC GENERATED AUTOMATICALLY: REMOVE THIS LINE TO PREVENT REGENERATING NEXT TIME
  api :POST, '/v1/schools', 'Create a school'
  error code: 400
  def create
    @school = School.create(school_params)

    if @school.errors.any?
      render json: {errors: @school.errors.messages, success: false}, status: 400
    else
      render template: '/api/v1/schools/show', status: 201
    end
  end

  # DOC GENERATED AUTOMATICALLY: REMOVE THIS LINE TO PREVENT REGENERATING NEXT TIME
  api :PATCH, '/v1/schools/:id', 'Update a school'
  api :PUT, '/v1/schools/:id', 'Update a school'
  def update
    if @school.update(school_params)
      render template: '/api/v1/schools/show', status: 200
    end
  end

  private

  def get_school
    @school = nil
    begin
      @school = School.find(params[:id])
    rescue RecordNotFound => ex
      render json: {errors: ["Element with id = #{params[:id]} not found"], success: false}, status: 404
    end
  end

  def school_params
    params.require(:school).permit(
      :name,
      :address,
      :zip_code,
      :city,
      :latitude,
      :longitude,
      :student_number,
      :status,
      :opening_hours,
      :phone_number,
      :email
    )
  end

end
