class TodosController < ApplicationController
  before_action :set_todo, only: [:show, :edit, :update, :destroy, :complete]

  def index
    @todos = Todo.all
  end

  def list
    @todos = Todo.all
  end

  def show

  end

  def new
    @todo = Todo.new
  end

  def create
    raise
    @todo = Todo.new(todo_params)
    @todo.save
    redirect_to todos_path
  end

  def edit

  end

  def update
    @todo.update(todo_params)
    redirect_to todos_path
  end

  def destroy
    @todo.destroy
    respond_to do |format|
      format.html { redirect_to todos_url, notice: 'Student was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def complete
    @todo.completed = true
    @todo.save
    redirect_to todos_path
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todo
      @todo = Todo.find(params[:id])
    end

  def todo_params
    params.require(:todo).permit(:description, :completed)

  end
end
