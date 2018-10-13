class RecipeesController <ApplicationController
	def index
		@recipees = Recipee.all
	end
	def show
		@recipee= Recipee.find(params[:id])
	end
	def new
		@recipee= Recipee.new
	end
	def create
		@recipee = Recipee.new(recipee_params)
		@recipee.chef= Chef.first
		if @recipee.save
			flash[:success]= "Recipee was created successfully"
			redirect_to recipee_path(@recipee)
		else
			render 'new'
		end
	end
	def edit
		@recipee= Recipee.find(params[:id])
	end

	def update
		@recipee= Recipee.find(params[:id])
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
	def recipee_params
		params.require(:recipee).permit(:name, :description)

	end
end