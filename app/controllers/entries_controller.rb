class EntriesController < ApplicationController
	def new
		@entry = Entry.new
	end
	def create

		@entry = Entry.new(entry_params)
		if @entry.save
			flash[:notice]= "Entry was successfully discovered."
	  	redirect_to entry_path(@entry)
	  else
	 		render 'new'

	 	end
	end
	def show
		@entry = Entry.find(params[:id])
	end
	def edit
		@entry = Entry.find(params[:id])

	end
	def update
		@entry = Entry.find(params[:id])
if @entry.update(entry_params)
			flash[:notice]= "Entry was successfully rediscovered."
	  	redirect_to entry_path(@entry)
	  else
	 		render 'edit'

	 	end
end

	private
	def entry_params
		params.require(:entry).permit(:name, :description)
	end
end