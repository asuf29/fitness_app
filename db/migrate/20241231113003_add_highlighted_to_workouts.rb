class AddHighlightedToWorkouts < ActiveRecord::Migration[7.1]
  def change
    add_column :workouts, :highlighted, :boolean, default: false
  end
end
