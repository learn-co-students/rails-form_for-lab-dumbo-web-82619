class SchoolClassesController < ApplicationController

    def index
    end

    def new
        @school_class = SchoolClass.new
    end

    def create
        school_class = SchoolClass.create(required_params(:title, :room_number))
        redirect_to school_class_path(school_class)
    end

    def show
        # byebug
        @school_class = SchoolClass.find(params.permit(:id)[:id])
    end

    def edit
        @school_class = SchoolClass.find(params.permit(:id)[:id])
    end

    def update
        school_class = SchoolClass.find(params.permit(:id)[:id])
        school_class.update(required_params(:title, :room_number))
        redirect_to school_class_path(school_class)
    end

    private

    def required_params(*args)
        params.require(:school_class).permit(:title, :room_number)
    end

end
