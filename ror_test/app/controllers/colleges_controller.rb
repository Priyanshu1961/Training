class CollegesController < ApplicationController
    def new
        @college = College.new
    end

    def index
        if params[:search]
            @colleges = College.where('name LIKE ?', "%#{params[:search]}%")
        else
            @colleges = College.all
        end
     end

    def edit
        @college = College.find(params[:id])
    end

    def show
        @college = College.find(params[:id])
        @students = Student.select('name', 'id').where('college_name LIKE ?', "%#{@college.name}%")
    end

    def create
        @college = College.new(college_params)
        if @college.save
            redirect_to @college
        else
            render 'new'
        end
     end

    def update
        @college = College.find(params[:id])
        if @college.update(college_params)
            redirect_to @college
        else
            render 'edit'
        end
     end

    def destroy
        @college = College.find(params[:id])
        Student.where(college_name: @college.name.to_s).destroy_all
        @college.destroy
        redirect_to colleges_path
      end

    private

    def college_params
        params.require(:college).permit(:name, :extended_year)
    end
end
