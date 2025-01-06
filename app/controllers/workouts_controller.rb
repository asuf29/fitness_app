class WorkoutsController < ApplicationController
  before_action :set_workout, only: [:edit, :update, :destroy]
  before_action :find_workout, only: [:show]

  def index
    @workouts = current_user.workouts
  end

  def show
    @exercises = @workout.workout_exercises
  end

  def new
    @workout = current_user.workouts.new
  end

  def create
    @workout = current_user.workouts.new(filtered_workout_params)
    if @workout.save
      redirect_to workouts_path, notice: "Workout created successfully!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @workout.update(filtered_workout_params)
      redirect_to @workout, notice: "Workout updated successfully!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @workout.destroy
    redirect_to workouts_path, notice: "Workout deleted successfully!", status: :see_other
  end

  def filtered_workout_params
    if current_user.admin?
      params.require(:workout).permit(:name, :c_image, :highlighted, workout_exercises_attributes: [:id, :exercise_id, :set, :rep, :duration, :_destroy])
    else
      params.require(:workout).permit(:name, :c_image, workout_exercises_attributes: [:id, :exercise_id, :set, :rep, :duration, :_destroy])
    end
  end

  def set_workout
    @workout = current_user.workouts.find_by(id: params[:id])
    unless @workout
      flash[:alert] = "Workout not found or you are not authorized to access it."
      redirect_to workouts_path
    end
  end

  def find_workout
    @workout = Workout.find_by(id: params[:id])
    unless @workout
      flash[:alert] = "Workout not found."
      redirect_to root_path
    end
  end
end
