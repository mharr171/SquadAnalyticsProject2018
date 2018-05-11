class AddSquadToPlayer < ActiveRecord::Migration[5.1]
  def change
    add_reference :players, :squad, foreign_key: true
  end
end
