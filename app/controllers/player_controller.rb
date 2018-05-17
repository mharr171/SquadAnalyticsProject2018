require 'date'

class PlayerController < ApplicationController
  before_action :authenticate_user!
  protect_from_forgery with: :null_session
  
  def index
    @user = current_user

    @players = Player.where(user:current_user)
  end

  def indexsort
    @players = Player.all.sort_by {|p| -p.mtc_rat}
  end
  
  def indexdnasort
    @players = Player.all.sort_by {|p| -p.sqd_rat}
  end

  def show
    @player = Player.find(params[:id])
    @squad = Squad.find(params[:squad_id])
  end

  def deletesquad
    @players = Player.where(user:current_user)

    @players.delete_all

    redirect_to player_index_path
  end

  def updatefiles
    line_count = File.readlines("app/assets/csv/updatesquad.csv").size
    File.open("app/assets/csv/updatesquad.csv").each_line("\n").with_index(0) do |row, line_num|
      columns = row.split(";")

      unless (line_num == 0)
        # puts columns[0]
        player = Player.where(uid:columns[0]).first
        # puts player.name
        # player.condition = columns[2].to_i
        # player.mtc_shp = columns[3].to_i
        # player.overall_risk = columns[4]
        # player.injury = columns[5]
        # player.save
        puts columns
        player.update(
          condition: columns[2],
          mtc_shp: columns[3],
          overall_risk: columns[4],
          injury: columns[5],
          time_out: columns[6],
          squad_status: columns[7],
          g_mis: columns[8]
        )
      end
    end

    redirect_to player_index_path
  end

  def loadfiles
    line_count = File.readlines("app/assets/csv/SAP1.csv").size
    File.open("app/assets/csv/SAP1.csv").each_line("\n").with_index(0) do |row, line_num|

      columns = row.split(';')
      puts columns

      unless (line_num == 0)
        player = Player.new()
        player.uid = columns[0]
        player.name = columns[1]
        player.f_pt = columns[2]
        player.contract_type = columns[3]
        salary = 0
        salary = columns[4] if (columns[4] != "N/A")
        player.salary = salary
        player.appearance_fee = columns[5][1..-1].to_i
        player.unused_sub_fee = columns[6][1..-1].to_i
        expires = "1/1/1990".to_date
        player.expires = expires
        player.expires = Date.strptime(columns[7], '%m/%d/%Y') unless columns[7] == "-"
        player.offer_status = columns[8]
        player.new_wage = columns[9][1..-1].to_i
        new_date = "1/1/1990".to_date
        player.new_date = new_date
        player.new_date = Date.strptime(columns[10], '%m/%d/%Y') unless columns[10] == "-"
        player.waclg = columns[11][1..-1].to_i
        player.waclg_num = columns[12].to_i
        loan_expires = "1/1/1990".to_date
        player.loan_expires = loan_expires
        player.loan_expires = Date.strptime(columns[13], '%m/%d/%Y') unless columns[13] == "-"
        injured_on = "1/1/1990".to_date
        player.injured_on = injured_on
        player.injured_on = Date.strptime(columns[14], '%m/%d/%Y') unless columns[14] == "-"
        player.injury = columns[15]
        player.time_out = columns[16]
        player.condition = columns[17]
        player.mtc_shp = columns[18]
        player.sharpness = columns[19]
        player.player_status = columns[20]
        # dob = "1/1/1990".to_date
        # player.dob = dob
        puts columns[21]
        puts Date.strptime(columns[21][0..-16], '%m/%d/%Y')
        player.dob = Date.strptime(columns[21][0..-16], '%m/%d/%Y')
        # player.nat = columns[22].to_s
        # player.second_nat = columns[23].to_s
        # player.second_nat = "-" if columns[23] == nil
        # height = columns[24]
        # height = height[1..-3].split("'")
        # player.height = (height[0].to_i*12) + (height[1].to_i)
        puts columns[22]
        puts columns[22][0..-4].to_i
        player.height = columns[22][0..-4].to_i
        puts columns[23]
        puts columns[23][0..-5].to_i
        player.weight = columns[23][0..-5].to_i
        player.position = columns[24]
        player.second_position = columns[25]
        player.personality = columns[26]
        player.media_handling = columns[27]
        player.preferred_foot = columns[28]
        player.left_foot = columns[29]
        player.right_foot = columns[30]
        player.morale = columns[31]
        player.match_load = columns[32]
        player.training_load = columns[33]
        player.injury_susceptibility = columns[34]
        player.overall_risk = columns[35]
        player.workload = columns[36]
        player.training_happiness = columns[37]
        player.training_happiness_details = columns[38]
        player.position_role = columns[39]
        player.additional_focus = columns[40]
        player.loan_status = columns[41]
        player.on_loan_from = columns[42]
        player.squad_status = columns[43]
        player.transfer_status = columns[44]
        if columns[45][-1] == 'M'
          player.value = columns[45][1..-2].to_i*1000000
        elsif columns[45][-1] == 'K'
          player.value = columns[45][1..-2].to_i*1000
        else
          player.value = columns[45][1..-1].to_i
        end
        player.save
      end
    end
    File.open("app/assets/csv/SAP2.csv").each_line("\n").with_index(0) do |row, line_num|
      columns = row.split(";")

      unless (line_num == 0)
        player = Player.where(uid:columns[0]).first
        player.cor = columns[2].to_i
        player.cro = columns[3].to_i
        player.dri = columns[4].to_i
        player.fin = columns[5].to_i
        player.fir = columns[6].to_i
        player.fre = columns[7].to_i
        player.hea = columns[8].to_i
        player.lon = columns[9].to_i
        player.lth = columns[10].to_i
        player.mar = columns[11].to_i
        player.pas = columns[12].to_i
        player.pen = columns[13].to_i
        player.tck = columns[14].to_i
        player.tec = columns[15].to_i
        player.agg = columns[16].to_i
        player.ant = columns[17].to_i
        player.bra = columns[18].to_i
        player.cmp = columns[19].to_i
        player.cnt = columns[20].to_i
        player.dec = columns[21].to_i
        player.det = columns[22].to_i
        player.fla = columns[23].to_i
        player.ldr = columns[24].to_i
        player.otb = columns[25].to_i
        player.pos = columns[26].to_i
        player.tea = columns[27].to_i
        player.vis = columns[28].to_i
        player.wor = columns[29].to_i
        player.acc = columns[30].to_i
        player.agi = columns[31].to_i
        player.bal = columns[32].to_i
        player.jum = columns[33].to_i
        player.nat = columns[34].to_i
        player.pac = columns[35].to_i
        player.sta = columns[36].to_i
        player.str = columns[37].to_i
        player.aer = columns[38].to_i
        player.cmd = columns[39].to_i
        player.com = columns[40].to_i
        player.ecc = columns[41].to_i
        player.han = columns[42].to_i
        player.kic = columns[43].to_i
        player.onevone = columns[44].to_i
        player.ref = columns[45].to_i
        player.rus = columns[46].to_i
        player.pun = columns[47].to_i
        player.thr = columns[48].to_i
        player.save
      end
    end

    File.open("app/assets/csv/SAP3.csv").each_line("\n").with_index(0) do |row, line_num|
      columns = row.split(";")

      unless (line_num == 0)
        player = Player.where(uid:columns[0]).first
        player.ca = columns[2].to_i
        player.pa = columns[3].to_i
        player.yel = columns[4].to_i
        player.tgls_90 = columns[5].to_f
        player.tcon_90 = columns[6].to_f
        player.tck = columns[7].to_i
        player.tck_r = columns[8].to_f
        player.starts = columns[9].to_i
        player.shutouts = columns[10].to_i
        player.shot_90 = columns[11].to_f
        player.sht_90 = columns[12].to_f
        player.svt = columns[13].to_i
        player.svp = columns[14].to_i
        player.svh = columns[15].to_i
        player.red = columns[16].to_i
        player.pom = columns[17].to_i
        player.pts_gm = columns[18].to_f
        player.pen_r = columns[19].to_f
        player.pas_perc = columns[20].to_i
        player.ps_a_90 = columns[21].to_f
        player.off = columns[22].to_i
        player.mstks = columns[23].to_i
        player.gl_mst = columns[24].to_i
        player.last_gl = columns[25].to_i
        player.last_c = columns[26].to_i
        player.mins_gm = columns[27].to_i
        player.mins = columns[28].to_i
        player.last_5_games = columns[29].to_f
        player.k_tck = columns[30].to_i
        player.k_ps_90 = columns[31].to_f
        player.k_pas = columns[32].to_i
        player.k_hdrs = columns[33].to_i
        player.int_90 = columns[34].to_f
        player.hdr_perc = columns[35].to_i
        player.hdrs_w_90 = columns[36].to_f
        player.gls_90 = columns[37].to_f
        player.all_90 = columns[38].to_f
        player.conc = columns[39].to_i
        player.gls = columns[40].to_i
        player.g_mis = columns[41].to_i
        player.won = columns[42].to_i
        player.lost = columns[43].to_i
        player.d = columns[44].to_i
        player.gwin = columns[45].to_i
        player.fa = columns[46].to_i
        player.fls = columns[47].to_i
        player.drbpg = columns[48].to_i
        player.dist_90 = columns[49].to_f
        player.cr_c_a = columns[50].to_f
        player.ch_c_90 = columns[51].to_f
        player.av_rat = columns[52].to_f
        player.mins_gl = columns[53].to_i
        player.asts_90 = columns[54].to_f
        player.ast = columns[55].to_i
        player.apps = columns[56].to_i
        player.ps_c_90 = columns[57].to_f
        player.sqd_rat = 0
        player.mtc_rat = 0
        player.save
      end
    end

    redirect_to player_index_path
  end

  def ratings
    players = Player.all
    players.each do |player|
      cor = 0.5
      cro = 2.0
      dri = 1.5
      fin = 1.5
      fir = 1.5
      fre = 0.5
      hea = 1.0
      lon = 1.0
      lth = 0.5
      mar = 1.0
      pas = 2.0
      pen = 0.5
      tck = 1.0
      tec = 1.5
      agg = 0.25
      ant = 1.25
      bra = 1.0
      cmp = 1.5
      cnt = 1.5
      dec = 2.0
      det = 2.0
      fla = 0.25
      ldr = 0.25
      otb = 1.5
      pos = 1.5
      tea = 2.0
      vis = 1.25
      wor = 2.5
      acc = 2.0
      agi = 1.0
      bal = 1.0
      jum = 1.0
      nat = 1.5
      pac = 2.0
      sta = 1.5
      str = 1.0
      aer = 1.0
      cmd = 1.0
      com = 1.25
      ecc = 0.25
      han = 1.25
      kic = 1.5
      onevone = 1.0
      ref = 1.5
      rus = 1.0
      pun = 0.25
      thr = 1.5

      dna_rating = (player.cor * cor)+(player.cro * cro)+(player.dri * dri)+(player.fin * fin)+(player.fir * fir)+(player.fre * fre)+(player.hea * hea)+(player.lon * lon)+(player.lth * lth)+(player.mar * mar)+(player.pas * pas)+(player.pen * pen)+(player.tck * tck)+(player.tec * tec)+(player.agg * agg)+(player.ant * ant)+(player.bra * bra)+(player.cmp * cmp)+(player.cnt * cnt)+(player.dec * dec)+(player.det * det)+(player.fla * fla)+(player.ldr * ldr)+(player.otb * otb)+(player.pos * pos)+(player.tea * tea)+(player.vis * vis)+(player.wor * wor)+(player.acc * acc)+(player.agi * agi)+(player.bal * bal)+(player.jum * jum)+(player.nat * nat)+(player.pac * pac)+(player.sta * sta)+(player.str * str)+(player.aer * aer)+(player.cmd * cmd)+(player.com * com)+(player.ecc * ecc)+(player.han * han)+(player.kic * kic)+(player.onevone * onevone)+(player.ref * ref)+(player.rus * rus)+(player.pun * pun)+(player.thr * thr)

      if player.squad_status == "Shortlisted"
        player.sqd_rat = dna_rating
        player.mtc_rat = dna_rating

        player.save
      else
        # condition
      # mtc_shp
      # overall_risk
      # injury
      # g_mis
      # squad_status

      risk = 1.00
      if player.overall_risk == "Low injury risk"
        risk = 1.10
      elsif player.overall_risk == "Normal injury risk"
        risk = 1.00
      elsif player.overall_risk == "Increased injury risk"
        risk = 0.8
      elsif player.overall_risk == "High injury risk"
        risk = 0.5
      elsif player.overall_risk == "Very high injury risk"
        risk = 0.25
      else
        risk = 0.0
      end

      injury = 1
      injury = 0 if player.injury.length > 3 || player.time_out.length > 3

      sqd_sts = 1.00
      missed = 0.05
      if player.squad_status == "Key Player"
        sqd_sts = 1.25
        missed = 0.24
      elsif player.squad_status == "First Team"
        sqd_sts = 1.15
        missed = 0.18
      elsif player.squad_status == "Rotation"
        sqd_sts = 1.00
        missed = 0.12
      elsif player.squad_status == "Backup"
        sqd_sts = 0.80
        missed = 0.06
      elsif player.squad_status == "Hot Prospect"
        sqd_sts = 0.75
        missed = 0.04
      elsif player.squad_status == "Youngster"
        sqd_sts = 0.70
        missed = 0.02
      elsif player.squad_status == "Not Needed"
        sqd_sts = 0.10
        missed = 0.005
      else
        sqd_sts = 0.70
        missed = 0.02
      end
      
      

      sqd_sts = sqd_sts + (player.g_mis*missed) if player.g_mis != '-'

      player.sqd_rat = dna_rating
      player.mtc_rat = dna_rating * (player.condition.to_f / 100) * sqd_sts * injury * risk

      player.save
      end 
    end

    redirect_to player_indexsort_path
  end

  def checkplayerratings
    File.open("app/assets/csv/tmp1.csv").each_line("\n").with_index(0) do |row, line_num|
      columns = row.split(";")

      unless (line_num == 0)
        player = Player.new
        player.name = columns[0]
        player.cor = columns[2].to_i
        player.cro = columns[3].to_i
        player.dri = columns[4].to_i
        player.fin = columns[5].to_i
        player.fir = columns[6].to_i
        player.fre = columns[7].to_i
        player.hea = columns[8].to_i
        player.lon = columns[9].to_i
        player.lth = columns[10].to_i
        player.mar = columns[11].to_i
        player.pas = columns[12].to_i
        player.pen = columns[13].to_i
        player.tck = columns[14].to_i
        player.tec = columns[15].to_i
        player.agg = columns[16].to_i
        player.ant = columns[17].to_i
        player.bra = columns[18].to_i
        player.cmp = columns[19].to_i
        player.cnt = columns[20].to_i
        player.dec = columns[21].to_i
        player.det = columns[22].to_i
        player.fla = columns[23].to_i
        player.ldr = columns[24].to_i
        player.otb = columns[25].to_i
        player.pos = columns[26].to_i
        player.tea = columns[27].to_i
        player.vis = columns[28].to_i
        player.wor = columns[29].to_i
        player.acc = columns[30].to_i
        player.agi = columns[31].to_i
        player.bal = columns[32].to_i
        player.jum = columns[33].to_i
        player.nat = columns[34].to_i
        player.pac = columns[35].to_i
        player.sta = columns[36].to_i
        player.str = columns[37].to_i
        player.aer = columns[38].to_i
        player.cmd = columns[39].to_i
        player.com = columns[40].to_i
        player.ecc = columns[41].to_i
        player.han = columns[42].to_i
        player.kic = columns[43].to_i
        player.onevone = columns[44].to_i
        player.ref = columns[45].to_i
        player.rus = columns[46].to_i
        player.pun = columns[47].to_i
        player.thr = columns[48].to_i
        player.squad_status = "Shortlisted"
        player.sqd_rat = 0
        player.mtc_rat = 0
        player.save
      end
    end

    redirect_to player_index_path
  end

  def user_load_squad

  end

end
