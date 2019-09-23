class StudentsController < ApplicationController

    def index
    end

    def new
        @student = Student.new
    end

    def create
        @student = Student.create(required_params(:title, :room_number))
        redirect_to student_path(@student)
    end

    def show
        @student = Student.find(params.permit(:id)[:id])
    end

    def edit
        @student = Student.find(params.permit(:id)[:id])
    end

    def update
        student = Student.find(params.permit(:id)[:id])
        student.update(required_params(:first_name, :last_name))
        redirect_to student_path(student)
    end

    private

    def required_params(*args)
        params.require(:student).permit(:first_name, :last_name)
    end

end
