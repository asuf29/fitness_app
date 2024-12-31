class WorkoutsController < ApplicationController
  before_action :set_workout, only: [:show, :edit, :update, :destroy]

  def index
    @workouts = current_user.workouts
  end

  def show
    @exercises = @workout_exercises
  end

  def new
    @workout = current_user.workouts.new
  end

  def create
    @workout = current_user.workouts.new(workout_params)
    if @workout.save
      redirect_to workouts_path, notice: "Workout created successfully!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @workout.update(workout_params)
      redirect_to @workout, notice: "Workout updated successfully!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @workout.destroy
    redirect_to workouts_path, notice: "Workout deleted successfully!", status: :see_other
  end

  def workout_params
    params.require(:workout).permit(:name, :c_image, :highlighted, workout_exercises_attributes: [:id, :exercise_id, :set, :rep, :duration, :_destroy])
  end

  def set_workout
    @workout = current_user.workouts.find_by(id: params[:id])
    unless @workout
      flash[:alert] = "Workout not found or you are not authorized to access it."
      redirect_to workouts_path
    end
  end
end
