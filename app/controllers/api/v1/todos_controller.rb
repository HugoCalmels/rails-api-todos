class Api::V1::TodosController < ApplicationController

  def index
    @todos = Todo.all
    render json: @todos
  end

  def show
    @todo = Todo.find(params[:id])
    render json: @todo
  end

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      render json: @todo
    else
      render error: { error: 'Unable to create User.'}, status: 400
    end
  end


   private

   def todo_params
    params.require(:todo).permit(:title, :content)
   end
end