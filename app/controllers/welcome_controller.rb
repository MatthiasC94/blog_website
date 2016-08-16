class WelcomeController < ApplicationController
	def index
		@posts = Post.all.order("created_at desc")
	end
before_action :find_project, only: [:show, :edit, :update, :destroy]
		before_action :authenticate_usermodel!, except: [:index, :show]


	def index 
		@projects = Project.all.order("created_at desc").paginate(:page => params[:page], :per_page => 3)
	end

	def show
	end

	private

	def find_project
		@project = Project.friendly.find(params[:id])
	end

	def project_params
		params.require(:project).permit(:title, :description, :slug, :image)
	end

end