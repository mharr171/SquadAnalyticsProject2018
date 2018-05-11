require 'test_helper'

class SquadDnasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @squad_dna = squad_dnas(:one)
  end

  test "should get index" do
    get squad_dnas_url
    assert_response :success
  end

  test "should get new" do
    get new_squad_dna_url
    assert_response :success
  end

  test "should create squad_dna" do
    assert_difference('SquadDna.count') do
      post squad_dnas_url, params: { squad_dna: { acc_m: @squad_dna.acc_m, aer_m: @squad_dna.aer_m, agg_m: @squad_dna.agg_m, agi_m: @squad_dna.agi_m, ant_m: @squad_dna.ant_m, bac_g_mis_h: @squad_dna.bac_g_mis_h, bac_shp_h: @squad_dna.bac_shp_h, bal_m: @squad_dna.bal_m, bra_m: @squad_dna.bra_m, cmd_m: @squad_dna.cmd_m, cmp_m: @squad_dna.cmp_m, cnt_m: @squad_dna.cnt_m, com_m: @squad_dna.com_m, cor_m: @squad_dna.cor_m, cro_m: @squad_dna.cro_m, dec_m: @squad_dna.dec_m, det_m: @squad_dna.det_m, dri_m: @squad_dna.dri_m, ecc_m: @squad_dna.ecc_m, fin_m: @squad_dna.fin_m, fir_g_mis_h: @squad_dna.fir_g_mis_h, fir_m: @squad_dna.fir_m, fir_shp_h: @squad_dna.fir_shp_h, fla_m: @squad_dna.fla_m, fre_m: @squad_dna.fre_m, han_m: @squad_dna.han_m, hea_m: @squad_dna.hea_m, hig_ris_h: @squad_dna.hig_ris_h, hot_g_mis_h: @squad_dna.hot_g_mis_h, hot_shp_h: @squad_dna.hot_shp_h, inc_ris_h: @squad_dna.inc_ris_h, jum_m: @squad_dna.jum_m, key_g_mis_h: @squad_dna.key_g_mis_h, key_shp_h: @squad_dna.key_shp_h, kic_m: @squad_dna.kic_m, ldr_m: @squad_dna.ldr_m, lon_m: @squad_dna.lon_m, low_ris_h: @squad_dna.low_ris_h, lth_m: @squad_dna.lth_m, mar_m: @squad_dna.mar_m, nat_m: @squad_dna.nat_m, nor_ris_h: @squad_dna.nor_ris_h, onevone_m: @squad_dna.onevone_m, otb_m: @squad_dna.otb_m, pac_m: @squad_dna.pac_m, pas_m: @squad_dna.pas_m, pen_m: @squad_dna.pen_m, pos_m: @squad_dna.pos_m, pun_m: @squad_dna.pun_m, ref_m: @squad_dna.ref_m, rot_g_mis_h: @squad_dna.rot_g_mis_h, rot_shp_h: @squad_dna.rot_shp_h, rus_m: @squad_dna.rus_m, squad_id: @squad_dna.squad_id, sta_m: @squad_dna.sta_m, str_m: @squad_dna.str_m, tck_m: @squad_dna.tck_m, tea_m: @squad_dna.tea_m, tec_m: @squad_dna.tec_m, thr_m: @squad_dna.thr_m, ver_ris_h: @squad_dna.ver_ris_h, vis_m: @squad_dna.vis_m, wor_m: @squad_dna.wor_m, you_g_mis_h: @squad_dna.you_g_mis_h, you_shp_h: @squad_dna.you_shp_h } }
    end

    assert_redirected_to squad_dna_url(SquadDna.last)
  end

  test "should show squad_dna" do
    get squad_dna_url(@squad_dna)
    assert_response :success
  end

  test "should get edit" do
    get edit_squad_dna_url(@squad_dna)
    assert_response :success
  end

  test "should update squad_dna" do
    patch squad_dna_url(@squad_dna), params: { squad_dna: { acc_m: @squad_dna.acc_m, aer_m: @squad_dna.aer_m, agg_m: @squad_dna.agg_m, agi_m: @squad_dna.agi_m, ant_m: @squad_dna.ant_m, bac_g_mis_h: @squad_dna.bac_g_mis_h, bac_shp_h: @squad_dna.bac_shp_h, bal_m: @squad_dna.bal_m, bra_m: @squad_dna.bra_m, cmd_m: @squad_dna.cmd_m, cmp_m: @squad_dna.cmp_m, cnt_m: @squad_dna.cnt_m, com_m: @squad_dna.com_m, cor_m: @squad_dna.cor_m, cro_m: @squad_dna.cro_m, dec_m: @squad_dna.dec_m, det_m: @squad_dna.det_m, dri_m: @squad_dna.dri_m, ecc_m: @squad_dna.ecc_m, fin_m: @squad_dna.fin_m, fir_g_mis_h: @squad_dna.fir_g_mis_h, fir_m: @squad_dna.fir_m, fir_shp_h: @squad_dna.fir_shp_h, fla_m: @squad_dna.fla_m, fre_m: @squad_dna.fre_m, han_m: @squad_dna.han_m, hea_m: @squad_dna.hea_m, hig_ris_h: @squad_dna.hig_ris_h, hot_g_mis_h: @squad_dna.hot_g_mis_h, hot_shp_h: @squad_dna.hot_shp_h, inc_ris_h: @squad_dna.inc_ris_h, jum_m: @squad_dna.jum_m, key_g_mis_h: @squad_dna.key_g_mis_h, key_shp_h: @squad_dna.key_shp_h, kic_m: @squad_dna.kic_m, ldr_m: @squad_dna.ldr_m, lon_m: @squad_dna.lon_m, low_ris_h: @squad_dna.low_ris_h, lth_m: @squad_dna.lth_m, mar_m: @squad_dna.mar_m, nat_m: @squad_dna.nat_m, nor_ris_h: @squad_dna.nor_ris_h, onevone_m: @squad_dna.onevone_m, otb_m: @squad_dna.otb_m, pac_m: @squad_dna.pac_m, pas_m: @squad_dna.pas_m, pen_m: @squad_dna.pen_m, pos_m: @squad_dna.pos_m, pun_m: @squad_dna.pun_m, ref_m: @squad_dna.ref_m, rot_g_mis_h: @squad_dna.rot_g_mis_h, rot_shp_h: @squad_dna.rot_shp_h, rus_m: @squad_dna.rus_m, squad_id: @squad_dna.squad_id, sta_m: @squad_dna.sta_m, str_m: @squad_dna.str_m, tck_m: @squad_dna.tck_m, tea_m: @squad_dna.tea_m, tec_m: @squad_dna.tec_m, thr_m: @squad_dna.thr_m, ver_ris_h: @squad_dna.ver_ris_h, vis_m: @squad_dna.vis_m, wor_m: @squad_dna.wor_m, you_g_mis_h: @squad_dna.you_g_mis_h, you_shp_h: @squad_dna.you_shp_h } }
    assert_redirected_to squad_dna_url(@squad_dna)
  end

  test "should destroy squad_dna" do
    assert_difference('SquadDna.count', -1) do
      delete squad_dna_url(@squad_dna)
    end

    assert_redirected_to squad_dnas_url
  end
end
