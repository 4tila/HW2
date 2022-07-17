class CreateAllRatings < ActiveRecord::Migration[5.0]
  def change
    create_table :all_ratings do |t|

      t.timestamps
    end
  end
end
