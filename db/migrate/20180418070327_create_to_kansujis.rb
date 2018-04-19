class CreateToKansujis < ActiveRecord::Migration[5.1]
  def change
    create_table :to_kansujis do |t|

      t.timestamps
    end
  end
end
