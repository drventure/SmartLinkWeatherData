class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.string :postal_code

      t.timestamps null: false
    end
  end
end
