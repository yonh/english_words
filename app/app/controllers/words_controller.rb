class WordsController < ApplicationController
	def index
		@words = Word.all
	end
	def new
		  @word = Word.new
		  @word.meanings.build
		  puts @word
	end
	def create
		@word = Word.create(word_params)

		if @word.save
			redirect_to @word
		else
			render 'new'
		end
	end
	def show
		@word = Word.find(params[:id])
	end
	def edit
		@word = Word.find(params[:id])
	end
	def update
  		@word = Word.find(params[:id])
 
  		if @word.update(word_params)
    		redirect_to @word
  		else
    		render 'edit'
  		end
	end
	def destroy
		@word = Word.find(params[:id])
		@word.destroy
		 
		redirect_to words_path
	end
    private
    	def word_params
		   	params.require(:word).permit(:word, meanings_attributes: [ :id, :cn])
		end

end
