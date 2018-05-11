class CreateSquadDnas < ActiveRecord::Migration[5.1]
  def change
    create_table :squad_dnas do |t|
      t.references :squad, foreign_key: true
      t.float :cor_m
      t.float :cro_m
      t.float :dri_m
      t.float :fin_m
      t.float :fir_m
      t.float :fre_m
      t.float :hea_m
      t.float :lon_m
      t.float :lth_m
      t.float :mar_m
      t.float :pas_m
      t.float :pen_m
      t.float :tck_m
      t.float :tec_m
      t.float :agg_m
      t.float :ant_m
      t.float :bra_m
      t.float :cmp_m
      t.float :cnt_m
      t.float :dec_m
      t.float :det_m
      t.float :fla_m
      t.float :ldr_m
      t.float :otb_m
      t.float :pos_m
      t.float :tea_m
      t.float :vis_m
      t.float :wor_m
      t.float :acc_m
      t.float :agi_m
      t.float :bal_m
      t.float :jum_m
      t.float :nat_m
      t.float :pac_m
      t.float :sta_m
      t.float :str_m
      t.float :aer_m
      t.float :cmd_m
      t.float :com_m
      t.float :ecc_m
      t.float :han_m
      t.float :kic_m
      t.float :onevone_m
      t.float :ref_m
      t.float :rus_m
      t.float :pun_m
      t.float :thr_m
      t.float :key_g_mis_h
      t.float :key_shp_h
      t.float :fir_g_mis_h
      t.float :fir_shp_h
      t.float :rot_g_mis_h
      t.float :rot_shp_h
      t.float :bac_g_mis_h
      t.float :bac_shp_h
      t.float :hot_g_mis_h
      t.float :hot_shp_h
      t.float :you_g_mis_h
      t.float :you_shp_h
      t.float :low_ris_h
      t.float :nor_ris_h
      t.float :inc_ris_h
      t.float :hig_ris_h
      t.float :ver_ris_h

      t.timestamps
    end
  end
end
