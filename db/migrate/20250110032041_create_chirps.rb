class CreateChirps < ActiveRecord::Migration[8.0]
  def change
    create_table :chirps do |t|
      t.string :message

      t.timestamps
    end
  end
end
