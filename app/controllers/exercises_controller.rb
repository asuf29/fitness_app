class ExercisesController < ApplicationController
  before_action :set_exercise, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!, only: [:new, :create, :edit, :update, :destroy]

  def index
    if params[:query].present?
      query = "%#{params[:query]}%"
      @exercises = Exercise.where("name ILIKE ?", query)
    else
      @exercises = Exercise.all
    end
  end

  def show
  end

  def new
    @exercise = Exercise.new
  end

  def create
    @exercise = Exercise.new(exercise_params)
    if @exercise.save
      redirect_to @exercise
    else 
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @exercise.update(exercise_params)
      redirect_to @exercise
    else
      render :edit, status: :unprocessable_entity
    end
  end
  
  def destroy
    @exercise.destroy
    redirect_to exercises_path, status: :see_other
  end

  private
  def exercise_params
    params.require(:exercise).permit(:name, :content, :image)
  end

  def set_exercise
    @exercise = Exercise.find(params[:id])
  end

  def authenticate_admin!
    unless current_user.admin?
      flash[:alert] = "You are not autorized to perform this action."
      redirect_to root_path
    end
  end
end
