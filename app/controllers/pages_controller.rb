class PagesController < ApplicationController
	def home
		redirect_to recipees_path if logged_in?
	end
end