class TodosController < ApplicationController
	def index 
		@todos = Todo.all
	end

	def create 
		@todo = Todo.new(todo_params)
			if @todo.save 
				render json: @todo
			else
				render json: @todo.errors, status: :unprocessable_entitiy
			end

	end



	def destroy 
		@todo = Todo.find(params[:id])
		@todo.destroy
		render json: {head: :no_content}
	end


	private 
	def todo_params 
		params.require(:todo).permit(:description)
	end


end
