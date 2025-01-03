class Api::ExercisesController < Api::ApplicationController
  def index
    exercises = Exercise.all

    if params[:search].present?
      exercises = exercises.where("name LIKE ?", "%#{params[:search]}%")
    end

    if params[:muscle].present?
      exercises = exercises.where(muscle: params[:muscle])
    end

    render json: exercises.map { |exercise| { id: exercise.id, name: exercise.name, muscle: exercise.muscle } }
  end

  def show
    exercise = Exercise.find_by(id: params[:id])

    if exercise
      render json: {
        id: exercise.id,
        name: exercise.name,
        muscle: exercise.muscle,
        content: exercise.content&.body,
        image: url_for(exercise.image)
      }, status: :ok
    else 
      render json: { error: "User not found" }, status: :not_found
    end
  end
end
