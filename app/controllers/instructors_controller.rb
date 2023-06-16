class InstructorsController < ApplicationController

rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_error
rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_error

    def index
        instructors = Instructor.all
        render json: instructors
    end

    def destroy
        instructor = Instructor.find(params[:id])
        instructor.destroy
        render json: instructor
    end

    def update 
        instructor = Instructor.find(params[:id])
        instructor.update!(instructor_params)
        render json: instructor
    end

    def create
        instructor = Instructor.create!(instructor_params)
        render json: instructor, status: :created
    end

    private

    def instructor_params
        params.permit(:name)
    end

    def render_not_found_error
        render json: {error: "Instructor not found"}, status: :not_found
    end

    def render_unprocessable_entity_error(invalid)
        render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end
end
