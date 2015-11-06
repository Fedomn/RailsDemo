class TodosController < ApplicationController

  def show_all_todos
    # @todos = Todo.find_by_user_id(params[:id])
    @todos = Todo.where(user_id: params[:id])

    respond_to do |format|
      format.html
    end
  end

  # GET todos
  def index
    @id = params[:id]
    @todos = Todo.all

    respond_to do |format|
      format.html
      format.json { render json: @todos }
    end
  end

  # GET /todos/show/1
  def show
    @todo = Todo.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @todo }
    end
  end

  # GET /todos/new
  def new
    @todo = Todo.new

    respond_to do |format|
      format.html
      format.json { render json: @todo }
    end
  end

  # GET /todos/1/edit
  def edit
    @todo = Todo.find(params[:id])
  end

  # POST /todos
  def create
    @todo = Todo.new(todo_params)

    respond_to do |format|
      if @todo.save
        format.html { redirect_to @todo, :notice => 'create todo success' }
        format.json { render :json => @todo, :status => :created, :location => @todo }
      else
        format.html { render :action => 'new' }
        format.json { render :json => @todo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /todos/1
  def update
    @todo = Todo.find(params[:id])

    respond_to do |format|
      if @todo.update_attributes(todo_params)
        format.html { redirect_to @todo, :notice => 'update todo success' }
        format.json { head :no_content }
      else
        format.html { render :action => 'edit' }
        format.json { render :json => @todo, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /todos/1
  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy

    respond_to do |format|
      format.html { redirect_to todos_path }
      format.json { head :no_content }
    end
  end

  private
  def todo_params
    params.require(:todo).permit(:title, :completed)
  end
end
