class StudentsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_error
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_error

    def index
        students = Student.all
        render json: students
    end

    def destroy
        student = Student.find(params[:id])
        student.destroy
        render json: student
    end

    def update 
        student = Student.find(params[:id])
        student.update!(student_params)
        render json: student
    end

    def create
        student = Student.create!(student_params)
        render json: student, status: :created
    end

    private

    def student_params
        params.permit(:name, :major, :age, :instructor_id)
    end

    def render_not_found_error
        render json: {error: "Student not found"}, status: :not_found
    end

    def render_unprocessable_entity_error(invalid)
        render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end
end
