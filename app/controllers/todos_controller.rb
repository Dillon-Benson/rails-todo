class TodosController < ApplicationController
  before_action :authenticate_user!

  def index
    @todos = current_user.todos.all.reverse
  end

  def new
    @todo = Todo.new
  end

  def view
    unless @todo = current_user.todos.find_by(id: params[:id])
      render :status => 404
    end
    @todo
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
