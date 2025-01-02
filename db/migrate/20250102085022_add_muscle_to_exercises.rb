class AddMuscleToExercises < ActiveRecord::Migration[7.1]
  def change
    add_column :exercises, :muscle, :integer, default: 0
  end
end
