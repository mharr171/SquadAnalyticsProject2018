class SquadsController < ApplicationController
  before_action :set_squad, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  helper_method :sort_column, :sort_direction  

  # GET /squads
  # GET /squads.json
  def index
    @squads = Squad.all.where(user_id: current_user.id)
  end

  # GET /squads/1
  # GET /squads/1.json
  def show
    @squad_datum = @user.squad_datum
    @players = @squad.players.order("#{sort_column} #{sort_direction}")

    @squad_dna = SquadDna.where(squad_id: @squad.id)
  end

  # GET /squads/new
  def new
    @squad = Squad.new
    @user = current_user
  end

  # GET /squads/1/edit
  def edit
  end

  # POST /squads
  # POST /squads.json
  def create
    @squad = Squad.new(squad_params)

    respond_to do |format|
      if @squad.save
        format.html { redirect_to @squad, notice: 'Squad was successfully created.' }
        format.json { render :show, status: :created, location: @squad }
      else
        format.html { render :new }
        format.json { render json: @squad.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /squads/1
  # PATCH/PUT /squads/1.json
  def update
    respond_to do |format|
      if @squad.update(squad_params)
        format.html { redirect_to @squad, notice: 'Squad was successfully updated.' }
        format.json { render :show, status: :ok, location: @squad }
      else
        format.html { render :edit }
        format.json { render json: @squad.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /squads/1
  # DELETE /squads/1.json
  def destroy
    @squad.destroy
    respond_to do |format|
      format.html { redirect_to squads_url, notice: 'Squad was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def delete_squad_datum
    squad = Squad.find(params[:squad_id])
    players = Player.where(squad_id: squad.id)

    players.delete_all

    redirect_to squad_path(squad)
  end

  def import_squad_datum
    logger.debug(params[:squad_id])
    logger.debug(params[:id])

    squad = Squad.find(params[:squad_id])
    puts "[ ~~~ -- . SQUAD . -- ~~~ ]"
    puts squad
    puts squad.team_name
    user = User.find(squad.user_id)
    puts "[ ~~~ -- . USER . -- ~~~ ]"
    puts user
    puts user.email
    squad_datum = SquadDatum.where(user_id: user.id).first

    squad_datum.load_squad_data.each_line("\n").with_index(0) do |row, line_num|
      columns = row.split(';')

      unless (line_num == 0)
        player = Player.new()
        player.squad = squad
        player.uid = columns[0]
        player.name = columns[1]
        player.squad_status = columns[2]
        player.age = columns[3]
        player.height = columns[4]
        player.weight = columns[5]
        player.position = columns[6]
        player.second_position = columns[7]
        player.strength = columns[8]
        player.weakness = columns[9]
        player.condition = columns[10]
        player.mtc_shp = columns[11]
        player.g_mis = columns[12]
        player.overall_risk = columns[13]
        player.injury = columns[14]
        player.time_out = columns[15]
        player.cor = columns[16].to_i
        player.cro = columns[17].to_i
        player.dri = columns[18].to_i
        player.fin = columns[19].to_i
        player.fir = columns[20].to_i
        player.fre = columns[21].to_i
        player.hea = columns[22].to_i
        player.lon = columns[23].to_i
        player.lth = columns[24].to_i
        player.mar = columns[25].to_i
        player.pas = columns[26].to_i
        player.pen = columns[27].to_i
        player.tck = columns[28].to_i
        player.tec = columns[29].to_i
        player.agg = columns[30].to_i
        player.ant = columns[31].to_i
        player.bra = columns[32].to_i
        player.cmp = columns[33].to_i
        player.cnt = columns[34].to_i
        player.dec = columns[35].to_i
        player.det = columns[36].to_i
        player.fla = columns[37].to_i
        player.ldr = columns[38].to_i
        player.otb = columns[39].to_i
        player.pos = columns[40].to_i
        player.tea = columns[41].to_i
        player.vis = columns[42].to_i
        player.wor = columns[43].to_i
        player.acc = columns[44].to_i
        player.agi = columns[45].to_i
        player.bal = columns[46].to_i
        player.jum = columns[47].to_i
        player.nat = columns[48].to_i
        player.pac = columns[49].to_i
        player.sta = columns[50].to_i
        player.str = columns[51].to_i
        player.aer = columns[52].to_i
        player.cmd = columns[53].to_i
        player.com = columns[54].to_i
        player.ecc = columns[55].to_i
        player.han = columns[56].to_i
        player.kic = columns[57].to_i
        player.onevone = columns[58].to_i
        player.ref = columns[59].to_i
        player.rus = columns[60].to_i
        player.pun = columns[61].to_i
        player.thr = columns[62].to_i

        player.sqd_rat = 0
        player.mtc_rat = 0
        
        player.pos_st = 0
        player.pos_aml = 0
        player.pos_amc = 0
        player.pos_amr = 0
        player.pos_ml = 0
        player.pos_mc = 0
        player.pos_mr = 0
        player.pos_dm = 0
        player.pos_wbl = 0
        player.pos_wbr = 0
        player.pos_dl = 0
        player.pos_dc = 0
        player.pos_dr = 0
        player.pos_sw = 0
        player.pos_gk = 0

        pos0 = player.position.split(', ')
        sec_pos0 = player.second_position.split(', ')
        pos0.each do |t|
          temp = t.split(' (')
          positions = temp[0].split('/')
          sides = temp[1][0..-2] if temp[1] != nil

          positions.each do |pos|
            case pos
            when "ST"
              player.pos_st += 1
            when "AM"
              player.pos_amr += 1 if sides.include? "R"
              player.pos_amc += 1 if sides.include? "C"
              player.pos_aml += 1 if sides.include? "L"
            when "M"
              player.pos_mr += 1 if sides.include? "R"
              player.pos_mc += 1 if sides.include? "C"
              player.pos_ml += 1 if sides.include? "L"
            when "DM"
              player.pos_dm += 1
            when "WB"
              player.pos_wbr += 1 if sides.include? "R"
              player.pos_wbl += 1 if sides.include? "L"
            when "D"
              player.pos_dr += 1 if sides.include? "R"
              player.pos_dc += 1 if sides.include? "C"
              player.pos_dl += 1 if sides.include? "L"
            when "SW"
              player.pos_dm += 1
            when "GK"
              player.pos_gk += 1
            end
          end
        end

        sec_pos0.each do |t|
          temp = t.split(' (')
          positions = temp[0].split('/')
          sides = temp[1][0..-2] if temp[1] != nil

          positions.each do |pos|
            case pos
            when "ST"
              player.pos_st += 1
            when "AM"
              player.pos_amr += 1 if sides.include? "R"
              player.pos_amc += 1 if sides.include? "C"
              player.pos_aml += 1 if sides.include? "L"
            when "M"
              player.pos_mr += 1 if sides.include? "R"
              player.pos_mc += 1 if sides.include? "C"
              player.pos_ml += 1 if sides.include? "L"
            when "DM"
              player.pos_dm += 1
            when "WB"
              player.pos_wbr += 1 if sides.include? "R"
              player.pos_wbl += 1 if sides.include? "L"
            when "D"
              player.pos_dr += 1 if sides.include? "R"
              player.pos_dc += 1 if sides.include? "C"
              player.pos_dl += 1 if sides.include? "L"
            when "SW"
              player.pos_dm += 1
            when "GK"
              player.pos_gk += 1
            end
          end
        end

        player.save
      end

    end

    redirect_to squad_path(squad)
  end

  def calculate_ratings
    squad = Squad.find(params[:squad_id])
    players = Player.where(squad_id: squad.id)
    squad_dna = SquadDna.where(squad_id: squad.id).first


    players.each do |player|
      if player.position == "GK"
        dna_rating = (player.fre * squad_dna.fre_m)+(player.pen * squad_dna.pen_m)+(player.tec * squad_dna.tec_m)+(player.agg * squad_dna.agg_m)+(player.ant * squad_dna.ant_m)+(player.bra * squad_dna.bra_m)+(player.cmp * squad_dna.cmp_m)+(player.cnt * squad_dna.cnt_m)+(player.dec * squad_dna.dec_m)+(player.det * squad_dna.det_m)+(player.fla * squad_dna.fla_m)+(player.ldr * squad_dna.ldr_m)+(player.otb * squad_dna.otb_m)+(player.pos * squad_dna.pos_m)+(player.tea * squad_dna.tea_m)+(player.vis * squad_dna.vis_m)+(player.wor * squad_dna.wor_m)+(player.acc * squad_dna.acc_m)+(player.agi * squad_dna.agi_m)+(player.bal * squad_dna.bal_m)+(player.jum * squad_dna.jum_m)+(player.nat * squad_dna.nat_m)+(player.pac * squad_dna.pac_m)+(player.sta * squad_dna.sta_m)+(player.str * squad_dna.str_m)+(player.aer * squad_dna.aer_m)+(player.cmd * squad_dna.cmd_m)+(player.com * squad_dna.com_m)+(player.ecc * squad_dna.ecc_m)+(player.han * squad_dna.han_m)+(player.kic * squad_dna.kic_m)+(player.onevone * squad_dna.onevone_m)+(player.ref * squad_dna.ref_m)+(player.rus * squad_dna.rus_m)+(player.pun * squad_dna.pun_m)+(player.thr * squad_dna.thr_m)
      else
        dna_rating = (player.cor * squad_dna.cor_m)+(player.cro * squad_dna.cro_m)+(player.dri * squad_dna.dri_m)+(player.fin * squad_dna.fin_m)+(player.fir * squad_dna.fir_m)+(player.fre * squad_dna.fre_m)+(player.hea * squad_dna.hea_m)+(player.lon * squad_dna.lon_m)+(player.lth * squad_dna.lth_m)+(player.mar * squad_dna.mar_m)+(player.pas * squad_dna.pas_m)+(player.pen * squad_dna.pen_m)+(player.tck * squad_dna.tck_m)+(player.tec * squad_dna.tec_m)+(player.agg * squad_dna.agg_m)+(player.ant * squad_dna.ant_m)+(player.bra * squad_dna.bra_m)+(player.cmp * squad_dna.cmp_m)+(player.cnt * squad_dna.cnt_m)+(player.dec * squad_dna.dec_m)+(player.det * squad_dna.det_m)+(player.fla * squad_dna.fla_m)+(player.ldr * squad_dna.ldr_m)+(player.otb * squad_dna.otb_m)+(player.pos * squad_dna.pos_m)+(player.tea * squad_dna.tea_m)+(player.vis * squad_dna.vis_m)+(player.wor * squad_dna.wor_m)+(player.acc * squad_dna.acc_m)+(player.agi * squad_dna.agi_m)+(player.bal * squad_dna.bal_m)+(player.jum * squad_dna.jum_m)+(player.nat * squad_dna.nat_m)+(player.pac * squad_dna.pac_m)+(player.sta * squad_dna.sta_m)+(player.str * squad_dna.str_m)
      end

      sharp = (100 - player.mtc_shp)/5

      player.sqd_rat = dna_rating

      if player.squad_status == "Key Player"
        player.mtc_rat = (dna_rating + (dna_rating*(squad_dna.key_g_mis_h*player.g_mis)/100) + (dna_rating*(squad_dna.key_shp_h*sharp)/100))
      elsif player.squad_status == "First Team"
        player.mtc_rat = (dna_rating + (dna_rating*(squad_dna.fir_g_mis_h*player.g_mis)/100) + (dna_rating*(squad_dna.fir_shp_h*sharp)/100))
      elsif player.squad_status == "Rotation"
        player.mtc_rat = (dna_rating + (dna_rating*(squad_dna.rot_g_mis_h*player.g_mis)/100) + (dna_rating*(squad_dna.rot_shp_h*sharp)/100))
      elsif player.squad_status == "Backup"
        player.mtc_rat = (dna_rating + (dna_rating*(squad_dna.bac_g_mis_h*player.g_mis)/100) + (dna_rating*(squad_dna.bac_shp_h*sharp)/100))
      elsif player.squad_status == "Hot Prospect"
        player.mtc_rat = (dna_rating + (dna_rating*(squad_dna.hot_g_mis_h*player.g_mis)/100) + (dna_rating*(squad_dna.hot_shp_h*sharp)/100))
      elsif player.squad_status == "Youngster"
        player.mtc_rat = (dna_rating + (dna_rating*(squad_dna.you_g_mis_h*player.g_mis)/100) + (dna_rating*(squad_dna.you_shp_h*sharp)/100))
      elsif player.squad_status == "Not Needed"
        player.mtc_rat = (dna_rating + (dna_rating*(squad_dna.you_g_mis_h*player.g_mis)/100) + (dna_rating*(squad_dna.you_shp_h*sharp)/100))
      else
        player.mtc_rat = (dna_rating + (dna_rating*(squad_dna.you_g_mis_h*player.g_mis)/100) + (dna_rating*(squad_dna.you_shp_h*sharp)/100))
      end


      if player.overall_risk == "Low injury risk"
        player.mtc_rat = player.mtc_rat * (player.condition + squad_dna.low_ris_h)/100
      elsif player.overall_risk == "Normal injury risk"
        player.mtc_rat = player.mtc_rat * (player.condition + squad_dna.nor_ris_h)/100
      elsif player.overall_risk == "Increased injury risk"
        player.mtc_rat = player.mtc_rat * (player.condition + squad_dna.inc_ris_h)/100
      elsif player.overall_risk == "High injury risk"
        player.mtc_rat = player.mtc_rat * (player.condition + squad_dna.hig_ris_h)/100
      elsif player.overall_risk == "Very high injury risk"
        player.mtc_rat = player.mtc_rat * (player.condition + squad_dna.ver_ris_h)/100
      else
        player.mtc_rat = player.mtc_rat * (player.condition + squad_dna.low_ris_h)/100
      end

      player.mtc_rat = 0 if player.injury.length > 3 || player.time_out.length > 3
      
      player.save

    end
    redirect_to squad_path(squad)
  end

  def ratings
    players = Player.all
    players.each do |player|

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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_squad
      @squad = Squad.find(params[:id])
    end

    def set_user
      @user = User.find(@squad.user_id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def squad_params
      params.require(:squad).permit(:user_id,:team_name)
    end

    def sortable_columns
      ["uid", "name", "sqd_rat", "mtc_rat", "squad_status", "age", "height", "weight", "position", "secondary_position", "strength", "weakness", "condition", "mtc_shp", "g_mis", "overall_risk", "injury", "time_out", "cor", "cro", "dri", "fin", "fir", "fre", "hea", "lon", "lth", "mar", "pas", "pen", "tck", "tec", "agg", "ant", "bra", "cmp", "con", "dec", "det", "fla", "ldr", "otb", "pos", "tea", "vis", "wor", "acc", "agi", "bal", "jum", "nat", "pac", "sta", "str", "aer", "cmd", "com", "ecc", "han", "kic", "onevone", "ref", "rus", "pun", "thr"]
    end

    def sort_column
      sortable_columns.include?(params[:column]) ? params[:column] : "UID"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end

    
end
