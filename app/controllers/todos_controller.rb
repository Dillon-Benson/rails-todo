class TodosController < ApplicationController
  before_action :authenticate_user!

  def index
    @todos = current_user.todos.all
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)
    @todo.user = current_user
    if @todo.save
      redirect_to action: 'index'
    else
      render "new"
    end
  end

  private

  def todo_params
    params.require(:todo).permit(:todo_title, :todo_text)
  end
end
