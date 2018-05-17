class AddPositionsToPlayer < ActiveRecord::Migration[5.1]
  def change
    add_column :players, :pos_st, :integer
    add_column :players, :pos_aml, :integer
    add_column :players, :pos_amc, :integer
    add_column :players, :pos_amr, :integer
    add_column :players, :pos_ml, :integer
    add_column :players, :pos_mc, :integer
    add_column :players, :pos_mr, :integer
    add_column :players, :pos_wbl, :integer
    add_column :players, :pos_dm, :integer
    add_column :players, :pos_wbr, :integer
    add_column :players, :pos_dl, :integer
    add_column :players, :pos_dc, :integer
    add_column :players, :pos_dr, :integer
    add_column :players, :pos_sw, :integer
    add_column :players, :pos_gk, :integer
  end
end
