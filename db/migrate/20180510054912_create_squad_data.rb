class CreateSquadData < ActiveRecord::Migration[5.1]
  def change
    create_table :squad_data do |t|
      t.text :load_squad_data
      t.text :update_squad_data
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
