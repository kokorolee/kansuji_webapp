class CreateToNumbers < ActiveRecord::Migration[5.1]
  def change
    create_table :to_numbers do |t|

      t.timestamps
    end
  end
end
