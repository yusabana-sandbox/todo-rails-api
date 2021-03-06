class TodosController < ApplicationController
  before_action :authenticate_user
  before_action :set_todo, only: [:show, :update, :destroy]

  validates :create do
    string :title, required: true, strong: true
    string :body, strong: true
  end

  validates :update do
    string :title, strong: true
    string :body, strong: true
  end

  # GET /todos
  def index
    @todos = current_user.todos
    render json: @todos
  end

  # GET /todos/1
  def show
    render json: @todo
  end

  # POST /todos
  def create
    @todo = Todo.new(permitted_params)
    @todo.user = current_user

    if @todo.save
      render json: @todo, status: :created, location: @todo
    else
      render json: @todo.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /todos/1
  def update
    if @todo.update(permitted_params)
      render json: @todo
    else
      render json: @todo.errors, status: :unprocessable_entity
    end
  end

  # DELETE /todos/1
  def destroy
    @todo.destroy
  end

  private
  def set_todo
    @todo = Todo.where(user_id: current_user.id).find(params[:id])
  end
end
