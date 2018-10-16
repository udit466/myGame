class RecipeesController <ApplicationController
	before_action :set_recipee, only: [:show, :edit,:update]
	def index
		@recipees = Recipee.paginate(page: params[:page], per_page: 5)
	end
	def show
	end
	def new
		@recipee= Recipee.new
	end
	def create
		@recipee= Recipee.new(recipee_params)
		@recipee.chef= Chef.first
		if @recipee.save
			flash[:success]= "Recipee was created successfully"
			redirect_to recipee_path(@recipee)
		else
			render 'new'
		end
	end
	def edit
	end

	def update
		if @recipee.update(recipee_params)
			flash[:success] ="Recipee was updated successfully"
			redirect_to recipee_path(@recipee)
		else
			render "edit"
		end
	end

	def destroy
  		Recipee.find(params[:id]).destroy
  		flash[:success] = "Recipee deleted successfully"
  		redirect_to recipees_path
	end

	private 
	def set_recipee
		@recipee=Recipee.find(params[:id])
	end
	def recipee_params
		params.require(:recipee).permit(:name, :description)

	end
end