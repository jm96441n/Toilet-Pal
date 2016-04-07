class ToiletsTable < ActiveRecord::Migration
  def change
    create_table :toilets do |t|
    	t.string :name, null: false
    	t.string :location, null: false
    	t.string :description, null: false
      t.string :zip_code
      t.string :neighborhood
      t.string :sublocality
      t.string :latitude
      t.string :longitude

      t.timestamps null: false
    end
  end
end
