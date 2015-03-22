class CreatePrecipProbabilities < ActiveRecord::Migration
  def change
    create_table :precip_probabilities do |t|
      t.string :postal_code
      t.date :date
      t.integer :pop
      t.float :qpf
      t.integer :high
      t.integer :low

      t.timestamps null: false
    end

    add_index :precip_probabilities, :postal_code
  end
end
