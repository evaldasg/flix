class CreateMoviegenres < ActiveRecord::Migration
  def change
    create_table :moviegenres do |t|
      t.references :movie, index: true
      t.references :genre, index: true

      t.timestamps
    end
  end
end
