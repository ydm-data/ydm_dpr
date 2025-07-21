# The name of this view in Looker is "Zocial Eye Message"

view: zocial_eye_message {

  sql_table_name: `rda_analytics.Zocial_eye_message` ;;

  parameter: date_drill_down {
    label: "Select Date Type"
    type: string
    allowed_value: { value: "Day" }
    allowed_value: { value: "Week" }
    allowed_value: { value: "Month" }
    allowed_value: { value: "Year" }
  }

  # parameter: iphone_group {
  #   label: "Select Phone group"
  #   type: string
  #   allowed_value: { value: "Iphone 16"}
  #   allowed_value: { value: "Samsung S24"}
  # }

  dimension: dynamic_date {
    label_from_parameter: date_drill_down
    sql:
    {% if date_drill_down._parameter_value == "'Day'" %}
      ${date}
    {% elsif date_drill_down._parameter_value == "'Week'" %}
      ${week}
    {% elsif date_drill_down._parameter_value == "'Month'" %}
      ${month}
    {% elsif date_drill_down._parameter_value == "'Year'" %}
      ${year}
    {% else %}
      ${date}
    {% endif %} ;;
  }

  dimension: iphone_group {
    label: "Phone model"
    type: string
    sql:
    CASE
      WHEN LOWER(${zocial_eye_message.text}) LIKE "%iphone%16%"
        OR LOWER(${zocial_eye_message.text}) LIKE "%ไอโฟน%16%" THEN "iPhone 16"
      WHEN LOWER(${zocial_eye_message.text}) LIKE "%s 24%"
        OR LOWER(${zocial_eye_message.text}) LIKE "%s24%"
        OR LOWER(${zocial_eye_message.text}) LIKE "%เอส%24%" THEN "Samsung S24"
      WHEN LOWER(${zocial_eye_message.text}) LIKE "%s 25%"
        OR LOWER(${zocial_eye_message.text}) LIKE "%s25%"
        OR LOWER(${zocial_eye_message.text}) LIKE "%เอส%25%" THEN "Samsung S25"
      WHEN ${zocial_eye_message.text} LIKE "%#GalaxyA15%" THEN "Samsung A15"

      WHEN ${zocial_eye_message.text} LIKE "%#GalaxyA23%" THEN "Samsung A23"

      WHEN ${zocial_eye_message.text} LIKE "%#GalaxyA25%" THEN "Samsung A25"

      WHEN ${zocial_eye_message.text} LIKE "%#GalaxyA35%" THEN "Samsung A35"
      WHEN ${zocial_eye_message.text} LIKE "%#a35%" THEN "Samsung A35"

      WHEN ${zocial_eye_message.text} LIKE "%#GalaxyA55%" THEN "Samsung A55"
      WHEN ${zocial_eye_message.text} LIKE "%#แคปยังไงก็คม%" THEN "Samsung A55"
      WHEN ${zocial_eye_message.text} LIKE "%#ครอปยังไงก็คม%" THEN "Samsung A55"
      WHEN ${zocial_eye_message.text} LIKE "%#Galaxyx4EVE%" THEN "Samsung A55"
      WHEN ${zocial_eye_message.text} LIKE "%#VDO4KByGalaxyA55%" THEN "Samsung A55"
      WHEN ${zocial_eye_message.text} LIKE "%#แล้วชีวิตของคุณจะคมกว่าที่เคย%" THEN "Samsung A55"
      WHEN ${zocial_eye_message.text} LIKE "%#galaxya55vdo4kคม%" THEN "Samsung A55"

      WHEN ${zocial_eye_message.text} LIKE "%#samsungfinanceplus%" THEN "Samsung A06"
      WHEN ${zocial_eye_message.text} LIKE "%#AutoBlocker%" THEN "Samsung A06"
      WHEN ${zocial_eye_message.text} LIKE "%#A06%" THEN "Samsung A06"
      WHEN ${zocial_eye_message.text} LIKE "%#galaxya06%" THEN "Samsung A06"

      WHEN ${zocial_eye_message.text} LIKE "%#Reno13SeriesTH%" THEN "Oppo Reno 13"
      WHEN ${zocial_eye_message.text} LIKE "%#Reno13F %" THEN "Oppo Reno 13"
      WHEN ${zocial_eye_message.text} LIKE "%#OPPOaiphone%" THEN "Oppo Reno 13"
      WHEN ${zocial_eye_message.text} LIKE "%#ดีไซน์สุดเทรนดี้กับReno %" THEN "Oppo Reno 13"
      WHEN ${zocial_eye_message.text} LIKE "%#ผีเสื้อคู่ใจ%" THEN "Oppo Reno 13"
      WHEN ${zocial_eye_message.text} LIKE "%#Reno13SeriesxNamtanFilm%" THEN "Oppo Reno 13"
      WHEN ${zocial_eye_message.text} LIKE "%#Reno13SeriesxBella%" THEN "Oppo Reno 13"
      WHEN ${zocial_eye_message.text} LIKE "%#OPPOAILivephoto%" THEN "Oppo Reno 13"
      WHEN ${zocial_eye_message.text} LIKE "%#สวยงามทั้งภาพเคลื่อนไหวและภาพนิ่ง%" THEN "Oppo Reno 13"
      WHEN ${zocial_eye_message.text} LIKE "%#OPPOTH%" THEN "Oppo Reno 13"
      WHEN ${zocial_eye_message.text} LIKE "%#AIซ่อมภาพพังให้ปัง%" THEN "Oppo Reno 13"
      WHEN ${zocial_eye_message.text} LIKE "%#opporeno13f5g%" THEN "Oppo Reno 13"
      ELSE Null
      END;;
  }

  dimension: hyundai_group {
    label: "HYUNDAI Group"
    type: string
    sql:
    CASE
      WHEN LOWER(${zocial_eye_message.text}) LIKE "%mazda%cx-8%"
        OR LOWER(${zocial_eye_message.text}) LIKE "%mercedes%benz%gla%"
        OR LOWER(${zocial_eye_message.text}) LIKE "%mercedes%benz%glc%"
        OR LOWER(${zocial_eye_message.text}) LIKE "%mercedes%benz%gle%"
        OR LOWER(${zocial_eye_message.text}) LIKE "%bmw%x1%"
        OR LOWER(${zocial_eye_message.text}) LIKE "%bmw%x3%"
        OR LOWER(${zocial_eye_message.text}) LIKE "%bmw%x5%"
        OR LOWER(${zocial_eye_message.text}) LIKE "%bmw%x7%"
        OR LOWER(${zocial_eye_message.text}) LIKE "%volvo%xc90%"
        OR LOWER(${zocial_eye_message.text}) LIKE "%kia%carnival%"
        THEN "HYUNDAI PALISADE"
      WHEN LOWER(${zocial_eye_message.text}) LIKE "%honda%cr-v%"
        OR LOWER(${zocial_eye_message.text}) LIKE "%toyota%fortuner%"
        OR LOWER(${zocial_eye_message.text}) LIKE "%kia%sorento%"
        OR LOWER(${zocial_eye_message.text}) LIKE "%mazda%cx-5%"
        OR LOWER(${zocial_eye_message.text}) LIKE "%haval%h6%"
        THEN "HYUNDAI SANTA FE"
      WHEN LOWER(${zocial_eye_message.text}) LIKE "%tesla%"
        OR LOWER(${zocial_eye_message.text}) LIKE "%evs of volvo%"
        THEN "HYUNDAI IONIQ 5 N"
    ELSE Null
    END;;
  }


  dimension: date_join {
    type: string
    sql: CONCAT(${brand_competitor}, ${product_competitor}, FORMAT_DATE('%Y-%m-%d', PARSE_DATE('%Y-%m-%d', SUBSTR(${TABLE}.post_time_human, 1, 10)))) ;;
  }

  dimension: voice {
    description: "Classifies the voice of a post as Consumer Voice, Influencer Voice, or Brand Voice based on the type of post, the account label, and the content of the text."
    type: string
    sql:
    CASE
    -- Consumer Voice
      WHEN ${TABLE}.meta_type LIKE "%comment%" AND ${TABLE}.meta_type != "page_comment" AND ${TABLE}.meta_type != "page_reply_comment"
        AND (${account_label_type_new} = "Customer" AND ${TABLE}.text NOT LIKE "%โปร%" AND ${TABLE}.text NOT LIKE "%http%")
        THEN "Consumer Voice"

      -- Influencer Voice
      WHEN ${TABLE}.meta_type LIKE "%post%"
      AND (${account_label_type_new} = "Public Figure" AND ${TABLE}.text NOT LIKE "%โปร%" AND ${TABLE}.text NOT LIKE "%http%")
      THEN "Influencer Voice"

      -- Brand Voice
      WHEN ${TABLE}.meta_type LIKE "%post%" AND ${account_label_type_new} = "Brand"
      THEN "Brand Voice"
      ELSE "-"
      END ;;
  }


  dimension: primary_key {
    type: string
    sql: CONCAT(${TABLE}.campaign_id, ${TABLE}.channel) ;;
    primary_key: yes
  }

  dimension: primary_key_kpi {
    type: string
    sql: CONCAT(${TABLE}.user_name,"_", ${TABLE}.channel) ;;
  }

  dimension: _id {
    type: string
    sql: ${TABLE}._id ;;
  }

  dimension: kol_channel_key {
    type: string
    sql:  CONCAT(${TABLE}.user_name, "_" , ${TABLE}.channel);;
  }

  dimension: brand_competitor {
    type: string
    sql:
    CASE
      WHEN ${zocial_eye_message.text} LIKE "%เกมโอเวอร์จบทุกเกมจุดด่างดำ%" THEN "L’Oreal"
      WHEN ${zocial_eye_message.text} LIKE "%Rojukiss%" THEN "Rojukiss"
      WHEN ${zocial_eye_message.text} LIKE "%Garnier%" OR ${zocial_eye_message.text} LIKE "%garnier%" THEN "Garnier"
      WHEN ${zocial_eye_message.text} LIKE "%Hada Labo%" OR ${zocial_eye_message.text} LIKE "%hada labo%" THEN "Hada Labo"
      WHEN ${zocial_eye_message.text} LIKE "%AXE%" OR ${zocial_eye_message.text} LIKE "%axe%" THEN "AXE"
      WHEN ${zocial_eye_message.text} LIKE "%TROS%" OR ${zocial_eye_message.text} LIKE "%tros%" THEN "TROS"
      WHEN ${zocial_eye_message.text} LIKE "%Srichand%" OR ${zocial_eye_message.text} LIKE "%srichand%" THEN "Srichand"
      WHEN ${zocial_eye_message.text} LIKE ANY ("%#โฟมล้างหน้าดรมนตรี%", "%#ลดความมันเพิ่มความสวย%", "%#ลดความมันป้องกันสิว%", "%#โฟมดรมนตรี%") THEN "Dr.Montrti"
      WHEN ${zocial_eye_message.text} LIKE ANY ("%#ดูโอ้สยบสิวผิวไชน์ไบรท์%", "%#garnierantiacnecleansingfoam%", "%#ganierantiacne%", "%#BusFriendsofGarnier%", "%#GarnierThailand%") THEN "Garnier"
      WHEN ${zocial_eye_message.text} LIKE ANY ("%#SENKAThailand%", "%#SENKAPerfectFriend%", "%#เซนกะเพื่อนรักผิวใส%", "%#เซนกะซิก้าเฟรนลี่ดี๊ดีต่อผิว%", "%#SENKAPerfectWhipLowpHCica%", "%#SENKAPerfectWhipAcneCare%", "%#SENKAPerfectWhip%") THEN "SENKA"
      WHEN ${zocial_eye_message.text} LIKE ANY ("%ปกป้องดูแลฟีลแฟน48ชั่วโมง%", "%CoolMentholเย็นสดชื่นตลอดวัน%", "%HeadandshouldersTH%", "%HeadandShouldersAppleFresh%", "%ผมสวยโนแคแบบไม่ต้องเลือก%", "%Headandshoulders2in1%", "%Haircheck2in1%", "%สูตรสยบความคัน%", "%เฮดแอนด์โชว์เดอร์%", "%รังแคisgone%", "%HSเย็นลบห้า%", "%มั่นใจลาขาดจากรังแค%", "%สูตรเย็นจับใจดับไฟหัวร้อน%") THEN "HEADANDSHOULDERS"
      WHEN ${zocial_eye_message.text} LIKE ANY ("%Clearท้าพิสูจน์หยุดรังแค%", "%CLEARThailand%", "%Clearnewgeneration%", "%Clear3in1ทำถึงกว่าในขวดเดียว%", "%ชาร์จพลังความมั่นใจผมใช้ClearMen%", "%ClearMenThailand%", "%#Clear100ใครเกาเสียล้าน%", "%#CLEAR100SS2%", "%เคลียร์ท้าคิดชื่อไทยให้หนังใหม่ฮาแลนด์%", "%Clearพลังเซราไมด์ฟื้นบำรุงหนังศีรษะแพ้ง่าย%", "%Clearผมร่วงหยุดหัวล้าน%", "%Clearผมร่วงล็อคผมถึงราก%", "%ผมหอมนุ่มพร้อมเคลียร์ทุกสไตล์%") THEN "CLEAR"
      WHEN ${zocial_eye_message.text} LIKE ANY ("%RejoiceThailand%", "%รีจอยส์3อิน1%", "%rejoice3in1%", "%#รีจอยส์3คุณค่าใน1เดียว%", "%RealHairRealJoy%", "%มั่นใจในผมที่จอย%", "%รีจอยส์ขจัดรังแค%", "%น้องจอยส์จอย%", "%RejoicePerfumeCollection%", "%ผมนุ่มลื่นพลิ้วสวยเบาสบาย%", "%ผมสวยสยบจบดราม่า%", "%รีจอยส์ดราม่าควีน%", "%รีจอยส์ผมนุ่มลื่นพลิ้วสลวยหอมนานถึง24ชม%", "%RejoicePerfumeSmooth%") THEN "REJOICE"
      WHEN ${zocial_eye_message.text} LIKE ANY ("%VichyDercos%", "%DercosTH%", "%VichyTH%", "%ScalpandHairAcademy%", "%meVSdandruff%", "%VoicesOfVichy%", "%VichyDercosxPondPhuwin%", "%VichyDercosxJamesSu%", "%VichyDercosxFirstKhaotung%", "%VichyDercosxEarthMix%", "%VichyDercosxTayTawan%", "%DensiSolutions%", "%DercosDensiSolutions%", "%Vichy Dercos%") THEN "VICHY DERCOS"
      WHEN ${zocial_eye_message.text} LIKE ANY ("%Nizoral%", "%NizoralDermaDaily%", "%ทรงพลังแต่อ่อนโยน%", "%ScalpDermaCenter%") THEN "NIZORAL"
      WHEN ${zocial_eye_message.text} LIKE ANY ("%switchselsunblue%", "%เปลี่ยนมาใช้เซลซั่นบลู%","%จบรังแคซ้ำซากใน2สัปดาห์%","% selsunblue%","%เซลซั่นบลู%","%ฝาแดง%","%แชมพูเซลซั่น%","%selsun%","%เซลซั่นแชมพู%") THEN "Selsun Blue"
      WHEN ${zocial_eye_message.text} LIKE ANY ("%garnier%","%ล้างคสอเกลี้ยง%","%คลีนซิ่งที่ถูกต้อง%","%การ์นิเย่ไมเซล่า%","%เช็ดเครื่องสำอางหมดจด%","%ไม่แสบผิว%","%#GarnierThailand%","%#ไมเซล่าการ์นิเย่%","%#หน้าไหนก็ชนะ%","%#คลีนซิ่งการ์นิเย่%","%#GarnierMoment%", "%จุดด่างดำลดลง%", "%ขจัดสิ่งสกปรกหมดจด%", "%มาสคาร่ากันน้ำ%","%คลีนซิ่ง BHA สำหรับคนเป็นสิว%","%การ์นิเย่ลดสิว%", "%คลีนซิ่งสีฟ้ากานิเย่%","%การดูแลผิวหน้ากับคลีนซิ่ง%","%วิธีเลือกคลีนซิ่งสำหรับสิว%","%แผ่นเดียวเอาอยู่%","%ดูดเมคอัพออกหมด%", "%อายไลเนอร์กันน้ำ%","%มาสคาร่ากันน้ำ%") AND ${zocial_eye_message.text} LIKE ANY (
        "%GARNIER%",
        "%Garnier%",
        "%garnier%",
        "%GANIER%",
        "%Ganier%",
        "%ganier%",
        "%การ์นิเย%",
        "%กานิเย%"
      ) THEN 'GARNIER'
      WHEN ${zocial_eye_message.text} LIKE ANY (
        "%#NIVEA%",
        "%#niveaไมเซล่าลดสิว%",
        "%#ไมเซล่าnivea%",
        "%#คลีนซิ่งนีเวีย%",
        "%#คลีนซิ่งนีเวียสูตรเขียว%",
        "%#พักหน้า%",
        "%#NIVEAAcneCareMicellar%",
        "%#ไมเซล่าขายดีอันดับ1ของนีเวีย%",
        "%ไมเซล่าขวดม่วง%",
        "%ผิวหายใจได้%",
        "%#NIVEATHAILAND%",
        "%#NIVEASUPERBRANDDAY%",
        "%#นีเวียช้อปมันไม่มีสะดุด%",
        "%#เช็ดเครื่องสําอาง%",
        "%#makeupremover%",
        "%#ไมเซล่าวอเตอร์%",
        "%ลดการอุดตัน%",
        "%ลดการเกิดสิว%",
        "%อ่อนโยนต่อผิว%",
        "%ปาดเดียวอยู่%",
        "%คลีนซิ่งดูดเมคอัพแบบแม่เหล็ก%",
        "%เช็ดเมคอัพออกเกลี้ยง%",
        "%เติมออกซิเจนให้ผิว%",
        "%ไม่แสบผิว%",
        "%#นีเวีย%",
        "%คลีนซิ่งที่ช่วยจัดการปัญหาสิว%",
        "%คลีนซิ่งนีเวียลดสิว%",
        "%ไมเซล่าวอเตอร์นีเวีย%",
        "%วิธีลดสิวด้วยคลีนซิ่ง%",
        "%รีวิวคลีนซิ่งลดสิว%",
        "%คลีนซิ่งเพื่อคนแต่งหน้า%",
        "%#NIVEAAcneCareMicellar%",
        "%#tiktoklooks%",
        "%#เมคอัพเปลี่ยนลุค%",
        "%#สอนแต่งหน้า%",
        "%#แต่งหน้า%",
        "%เช็ดเดียวปิดจ๊อบสิว%",
        "%อัพผิวสวย%",
        "%เช็ดเมคอัพหมดจด%",
        "%ออกซิเจนบูสต์เทคโนโลยี%",
        "%ไม่แห้งตึง ไม่มันเยิ้ม%",
        "%ผิวแพ้ง่ายใช้ได้%",
        "%personal color%",
        "%เช็ดเดียวก็สะอาด%"
      )  AND ${zocial_eye_message.text} LIKE ANY (
        "%NIVEA%",
        "%Nivea%",
        "%nivea%",
        "%NEVIA%",
        "%Nevia%",
        "%nevia%",
        "%นีเวีย%",
        "%นิเวีย%"
      ) THEN 'NIVEA'
      WHEN ${zocial_eye_message.text} LIKE ANY (
        "%#บิเฟสต้า%",
        "%#PerfectGlow%",
        "%#เช็ดปุ๊ปโกลว์ปั๊ป%",
        "%ล็อคความชุ่มชื่น%",
        "%ผสมสารสกัดจากส้มยูซุญี่ปุ่นและวิตามินซี%",
        "%เมคอัพติดทน%",
        "%เมคอัพกันน้ำ%",
        "%Bifesta Micellar Cleasing Water Perfect Glow%",
        "%คลีนซิ่งที่ต้องตุนติดบ้านไว้ตลอด%",
        "%#bifestathailand%",
        "%#bifesta%",
        "%คลีนซิ่งบีเฟสต้าสูตรสีเขียว%",
        "%#คลีนซิ่งบีเฟสต้า%",
        "%คลีนซิ่งบีเฟสต้าสูตรแอคเน่แคร์สำหรับผิวแพ้ง่าย%",
        "%รีวิวสูตรคลีนซิ่ง Bifesta%",
        "%คลีนเมคอัพก่อนนอน%",
        "%#ติดฝนรีวิว%",
        "%#tiktokคนบันเทิง%",
        "%สูตรสีเขียวใช้ดีมาก%",
        "%คลีนซิ่งไมเซล่าแบบน้ำ%",
        "%#ไมเซล่าเคลนซิ่งวอเตอร์%",
        "%รีวิวบิเฟสต้าไมเซล่า%",
        "%ทริคเช็ดกันแดด%",
        "%เห็นผลพร้อมกล้องยูวี%",
        "%ผลิตภัณฑ์คลีนซิ่งเพื่อผิวใส%",
        "%เช็ดหน้าให้เกลี้ยงเกลี้ยง%"
      ) AND ${zocial_eye_message.text} LIKE ANY (
        "%BIFESTA%",
        "%Bifesta%",
        "%bifesta%",
        "%บิเฟสต้า%",
        "%บีเฟสต้า%",
        "%บิเฟซต้า%",
        "%บีเฟซต้า%",
        "%บิเฟสตา%",
        "%บีเฟสตา%",
        "%บิเฟซตา%",
        "%บีเฟซตา%"
      ) THEN 'Bifesta'
      WHEN ${zocial_eye_message.text} LIKE ANY ("%#TaobaoThailand%", "%#GetTaobaoGetmore%", "%#Taobao1212%", "%#Taobaofreshfinds%") THEN "Taobao"
      WHEN ${zocial_eye_message.text} LIKE ANY ("%#TemuThailand%", "%#temuhaul%", "%#temustyle%", "%#temufinds%") THEN "Temu"
      WHEN ${zocial_eye_message.text} LIKE ANY ("%#Sheinstyleth%", "%#SHEINblackfriday%", "%#sheinbigsalesday%", "%#SHEIN1212sale%", "%#SHEINGoodFinds%", "%#SHEINforAll%", "%#sheinth%", "%#sheintrendsth%") THEN "Shein"
      WHEN ${zocial_eye_message.text} LIKE ANY ("%#shopeeแฟชั่นบิวตี้%", "%#ShopeeTH%") THEN "Shopee"
      WHEN ${zocial_eye_message.text} LIKE ANY ("%#LazadaPayday%", "%#ดีลช้อปทุกวันยันสิ้นเดือน", "%#จะเลิกเปรียบเทียบกี่โมง%", "%#lazadath%") THEN "Lazada"
    END ;;
  }


  dimension: product_competitor {
    type: string
    sql:
    CASE
      WHEN ${zocial_eye_message.text} LIKE "%เกมโอเวอร์จบทุกเกมจุดด่างดำ%" THEN "Glycolic Bright Melasyl Serum"
      WHEN ${zocial_eye_message.text} LIKE ANY ("%#เซนกะซิก้าเฟรนลี่ดี๊ดีต่อผิว%", "%#SENKAPerfectWhipLowpHCica%") THEN "SENKA Perfect Whip Low pH Calming Cica (สีเขียวเข้ม)"
      WHEN ${zocial_eye_message.text} LIKE ANY ("%#SENKAPerfectWhipAcneCare%") THEN "SENKA Perfect Whip Acne Care (สีเขียวอ่อน)"
      WHEN ${zocial_eye_message.text} LIKE ANY ("%#SENKAPerfectWhip%") THEN "SENKA Perfect Whip (สีฟ้า)"
      WHEN ${zocial_eye_message.text} LIKE ANY ("%กันแดด%ลาโรช%ม่วง","%#กันแดดลดฝ้ากู้ผิวใส%","%#กันแดดanthelios%","%#กันแดดหล่อมาก%","%#กันแดดอันดับ1ในเอเชีย%") THEN "La Roche-Posay Anthelios UVMune 400 Anti-Dark Spots Fluid"
      WHEN ${zocial_eye_message.text} LIKE ANY ("%#ANESSAUltimatePrevention%","%#ANESSABeautySuncare%","%#ANESSAThailand​%") THEN "Anessa"
      WHEN ${zocial_eye_message.text} LIKE ANY ("%#herhynessกันแดดของหลิง%") THEN "HER HYNESS UV ADAPT WATERY SUNSCREEN SPF50+ PA++++"
      WHEN ${zocial_eye_message.text} LIKE ANY ("%#herhynessno1sunscreen%") THEN "HER HYNESS HY’4 WATER SUNSCREEN SPF50+ PA++++"
      WHEN ${zocial_eye_message.text} LIKE ANY ("%#SunUltra100ที่สุดกันแดดสำหรับผิวทำเลเซอร์%", "%#EucerinThailand%","%#EucerinSunUltra100%", "%#กันแดดหลังทำหัตถการ%") THEN "Eucerin"
      WHEN ${zocial_eye_message.text} LIKE ANY ("%กันแดด%นูโทรจีนา%","%กันแดด%นูโทจีนา%","%กันแดด%Neutroฃgena%") THEN "Neutrogena"
    ELSE Null
    END;;
  }

  dimension: brand_group {
    type: string
    sql:
    CASE
      WHEN ${zocial_eye_message__category.zocial_eye_message__category} IN ("mizumi","anessa", "sunplay", "ka", "l'oreal","vaseline", "bhaesaj","citra", "garnier", "nivea") THEN "Beauty brand"
    ELSE "-"
    END;;
  }

  dimension: brand_category {
    type: string
    sql:
    CASE
      WHEN ${zocial_eye_message__category.zocial_eye_message__category} IN ("mizumi", "l'oreal", "garnier", "nivea") THEN "Skincare and Beauty"
      WHEN ${zocial_eye_message__category.zocial_eye_message__category} IN ("anessa", "sunplay", "ka") THEN "Sun Protection"
      WHEN ${zocial_eye_message__category.zocial_eye_message__category} IN ("vaseline", "bhaesaj","citra") THEN "General Personal Care"
    ELSE "-"
    END;;
  }

    dimension: gatsby_brand_keyword_label {
      label: "Gatsby Brand Keyword Label"
      type: string
      sql: CASE
          WHEN ${zocial_eye_message.text} LIKE ANY ("%Gatsby%") THEN "Brand KWs"

        WHEN ${zocial_eye_message.text} LIKE ANY (
        "%schwarzkopf taft%",
        "%schwarzkopf got2b%"
        ) THEN "Competitors KWs"

        WHEN ${zocial_eye_message.text} LIKE ANY (
        "%เช็ทผม%",
        "%เซ็ทผมผู้ชาย%",
        "%เซ็ตผม%",
        "%เซทผม%",
        "%จัดแต่งทรงผม%",
        "%ไอเท็มผู้ชาย%",
        "%ทรงผมผู้ชาย%",
        "%ทรงผมทอม%"
        ) THEN "Generic KWs"

        ELSE NULL
        END ;;
    }

    dimension: gatsby_product_keyword_label {
      label: "Gatsby Product Keyword Label"
      type: string
      sql: CASE

              WHEN ${zocial_eye_message.text} LIKE ANY (
              "%แป้งเซ็ทผม%",
              "%แป้งเซทผม%",
              "%แป้งยกโคนผม%",
              "%แป้งเซ็ทโคนผม%",
              "%แป้งโรยโคนผม%",
              "%แป้งเซ็ทผมผู้ชาย%"
              ) THEN "แป้ง"

        WHEN ${zocial_eye_message.text} LIKE ANY (
        "%แว็กซ์ผมผู้ชาย%",
        "%แว็กซ์เซตผม%",
        "%แว็กซ์เซ็ทผมลดสิว%",
        "%แว็กซ์เซ็ทผมแบบแป้ง%",
        "%แว๊กซ์ผมสูตรลดสิว%",
        "%แว๊กเซ็ตผม%",
        "%แว๊กเซ็ทผม%",
        "%รีวิวแว็กซ์%",
        "%แว็กซ์จัดแต่งทรงผม%"
        ) THEN "wax"

        WHEN ${zocial_eye_message.text} LIKE ANY (
        "%สเปรย์เพิ่มวอลลุ่ม%",
        "%สเปรย์ฉีดผม%",
        "%สเปรย์เซ็ตผม%",
        "%สเปรย์เซ็ตผมผู้ชาย%",
        "%สเปรย์ยกโคนผม%",
        "%สเปรย์ล็อคผมผู้ชาย%",
        "%สเปรย์ล็อกผม%"
        ) THEN "Spray"

        ELSE NULL
        END ;;
    }

  dimension: post_comment_fillter {
    type: string
    sql:
    CASE
      WHEN zocial_eye_message.meta_type LIKE '%post%' AND zocial_eye_message.channel = "facebook" THEN
        IF(ARRAY_LENGTH(SPLIT(${TABLE}._id, '_')) >= 1, SPLIT(${TABLE}._id, '_')[OFFSET(1)], NULL)
      WHEN zocial_eye_message.meta_type LIKE '%comment%'  AND zocial_eye_message.channel = "facebook" THEN
        IF(ARRAY_LENGTH(SPLIT(${TABLE}._id, '_')) >= 1, SPLIT(${TABLE}._id, '_')[OFFSET(0)], NULL)
      WHEN zocial_eye_message.channel = "instagram" THEN
        IF(ARRAY_LENGTH(SPLIT(${TABLE}._id, '_')) >= 1, SPLIT(${TABLE}._id, '_')[OFFSET(1)], NULL)
      ELSE ${TABLE}._id
    END ;;
  }

  dimension: account_label_age {
    type: number
    sql: ${TABLE}.account_label_age ;;
  }

  dimension: account_label_audience_size {
    type: string
    sql: ${TABLE}.account_label_audience_size ;;
  }

  dimension: account_label_brand_involvement {
    type: string
    sql: ${TABLE}.account_label_brand_involvement ;;
  }

  dimension: account_label_categories {
    hidden: yes
    sql: ${TABLE}.account_label_categories ;;
  }

  dimension: account_label_gender {
    type: string
    sql: ${TABLE}.account_label_gender ;;
  }

  dimension: account_label_type {
    type: string
    sql: ${TABLE}.account_label_type ;;
  }

  dimension: account_label_type_new {
    type: string
    sql:
    CASE
      WHEN ${TABLE}.account_label_type = "" THEN "Customer"
      ELSE ${TABLE}.account_label_type
    END;;
  }

  dimension: account_label_tza {
    hidden: yes
    sql: ${TABLE}.account_label_tza ;;
  }

  dimension: campaign_id {
    type: number
    sql: ${TABLE}.campaign_id ;;
  }

  dimension: campaign_name {
    type: string
    sql: CASE WHEN ${TABLE}.campaign_name IN ("samsung","new_samsung") THEN "samsung" ELSE ${TABLE}.campaign_name END ;;
  }

  dimension: category {
    hidden: yes
    sql: ${TABLE}.category ;;
  }

  dimension: channel {
    description: "Channel of social media, for example Facebook ,TikTok, Instagram, X"
    type: string
    sql: ${TABLE}.channel ;;
  }

  dimension: channel_viz {
    label: "Channel"
    description: "Channel of social media, for example Facebook ,TikTok, Instagram, X"
    type: string
    sql: ${channel} ;;
    html: {% if value == 'tiktok' %}
          <div style="display: flex; justify-content: center; align-items: center;">
          <p><img src="https://cdn.pixabay.com/photo/2021/01/30/06/42/tiktok-5962992_1280.png" height=20 width=20></p>
          </div>
          {% elsif value == 'facebook' %}
          <p><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Facebook_Logo_%282019%29.png/480px-Facebook_Logo_%282019%29.png" height=20 width=20></p>
          {% elsif value == 'x' %}
          <p><img src="https://logos-world.net/wp-content/uploads/2023/08/X-Logo.png" height=20 width=20></p>
          {% elsif value == 'instagram' %}
          <p><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/9/95/Instagram_logo_2022.svg/1024px-Instagram_logo_2022.svg.png" height=20 width=20></p>
          {% elsif value == 'youtube' %}
          <p><img src="https://static.vecteezy.com/system/resources/previews/023/986/480/original/youtube-logo-youtube-logo-transparent-youtube-icon-transparent-free-free-png.png" height=20 width=20></p>
          {% elsif value == 'forum' %}
          <p><img src="https://medias.thansettakij.com/uploads/images/contents/w1024/2023/10/XBKTZ1drI8n8EkH99kHC.webp?x-image-process=style/lg-webp" height=20 width=20></p>
          {% else %}
          <p>{{ rendered_value }}</p>
          {% endif %}
          ;;
  }

  dimension: collected_at {
    type: string
    sql: ${TABLE}.collected_at ;;
  }

  dimension: country_code {
    type: string
    sql: ${TABLE}.country_code ;;
  }

  dimension: delete {
    type: number
    sql: ${TABLE}.delete ;;
  }

  dimension: deleted_category {
    hidden: yes
    sql: ${TABLE}.deleted_category ;;
  }

  dimension: engagement {
    type: number
    sql: ${TABLE}.engagement ;;
  }

  dimension: exclude_keywords {
    hidden: yes
    sql: ${TABLE}.exclude_keywords ;;
  }

  dimension: hashtags {
    hidden: yes
    sql: ${TABLE}.hashtags ;;
  }

  dimension: keywords {
    hidden: yes
    sql: ${TABLE}.keywords ;;
  }

  dimension: links {
    hidden: yes
    sql: ${TABLE}.links ;;
  }

  dimension: links_for_search {
    hidden: yes
    sql: ${TABLE}.links_for_search ;;
  }

  dimension: logo_detections {
    hidden: yes
    sql: ${TABLE}.logo_detections ;;
  }

  dimension: matched_by_keyword {
    type: number
    sql: ${TABLE}.matched_by_keyword ;;
  }

  dimension: matched_by_logo_detection {
    type: number
    sql: ${TABLE}.matched_by_logo_detection ;;
  }

  dimension: matched_by_ocr {
    type: number
    sql: ${TABLE}.matched_by_ocr ;;
  }

  dimension: matched_by_track_account {
    type: number
    sql: ${TABLE}.matched_by_track_account ;;
  }

  dimension: matched_by_track_news_section {
    type: number
    sql: ${TABLE}.matched_by_track_news_section ;;
  }

  dimension: matched_by_track_post {
    type: number
    sql: ${TABLE}.matched_by_track_post ;;
  }

  dimension: meta_account_id {
    type: string
    sql: ${TABLE}.meta_account_id ;;
  }

  dimension: meta_album_id {
    type: string
    sql: ${TABLE}.meta_album_id ;;
  }

  dimension: meta_angry_count {
    type: number
    sql: ${TABLE}.meta_angry_count ;;
  }

  dimension: meta_application {
    type: string
    sql: ${TABLE}.meta_application ;;
  }

  dimension: meta_blog_detail {
    type: string
    sql: ${TABLE}.meta_blog_detail ;;
  }

  dimension: meta_blog_id {
    type: string
    sql: ${TABLE}.meta_blog_id ;;
  }

  dimension: meta_blog_name {
    type: string
    sql: ${TABLE}.meta_blog_name ;;
  }

  dimension: meta_comment_count {
    type: number
    sql: ${TABLE}.meta_comment_count ;;
  }

  dimension: meta_comment_id {
    type: string
    sql: ${TABLE}.meta_comment_id ;;
  }

  dimension: meta_detail {
    type: string
    sql: ${TABLE}.meta_detail ;;
  }

  dimension: meta_dislike_count {
    type: number
    sql: ${TABLE}.meta_dislike_count ;;
  }

  dimension: meta_duration {
    type: number
    sql: ${TABLE}.meta_duration ;;
  }

  measure: total_meta_duration {
    type: sum
    sql: ${meta_duration} ;;  }
  measure: average_meta_duration {
    type: average
    sql: ${meta_duration} ;;  }

  dimension: meta_facebook_share {
    type: number
    sql: ${TABLE}.meta_facebook_share ;;
  }

  dimension: meta_favorite_count {
    type: number
    sql: ${TABLE}.meta_favorite_count ;;
  }

  dimension: meta_filter {
    type: string
    sql: ${TABLE}.meta_filter ;;
  }

  dimension: meta_follower_count {
    type: number
    sql:COALESCE(${TABLE}.meta_follower_count, 0) ;;
  }

  dimension: meta_forum {
    type: string
    sql: ${TABLE}.meta_forum ;;
  }

  dimension: meta_group_id {
    type: string
    sql: ${TABLE}.meta_group_id ;;
  }

  dimension: meta_group_name {
    type: string
    sql: ${TABLE}.meta_group_name ;;
  }

  dimension: meta_haha_count {
    type: number
    sql: ${TABLE}.meta_haha_count ;;
  }

  dimension: meta_heart_count {
    type: number
    sql: ${TABLE}.meta_heart_count ;;
  }

  dimension: meta_impress_count {
    type: number
    sql: ${TABLE}.meta_impress_count ;;
  }

  dimension: meta_laugh_count {
    type: number
    sql: ${TABLE}.meta_laugh_count ;;
  }

  dimension: meta_like_count {
    type: number
    sql: ${TABLE}.meta_like_count ;;
  }

  dimension: meta_location_lat {
    type: number
    sql: ${TABLE}.meta_location_lat ;;
  }

  dimension: meta_location_lon {
    type: number
    sql: ${TABLE}.meta_location_lon ;;
  }

  dimension: location {
    label: "Location"
    type: location
    sql_latitude:${meta_location_lat} ;;
    sql_longitude:${meta_location_lon} ;;
  }

  dimension: meta_love_count {
    type: number
    sql: ${TABLE}.meta_love_count ;;
  }

  dimension: meta_news_detail {
    type: string
    sql: ${TABLE}.meta_news_detail ;;
  }

  dimension: meta_news_id {
    type: string
    sql: ${TABLE}.meta_news_id ;;
  }

  dimension: meta_news_name {
    type: string
    sql: ${TABLE}.meta_news_name ;;
  }

  dimension: meta_news_sections {
    hidden: yes
    sql: ${TABLE}.meta_news_sections ;;
  }

  dimension: meta_page_id {
    type: string
    sql: ${TABLE}.meta_page_id ;;
  }

  dimension: meta_page_name {
    type: string
    sql: ${TABLE}.meta_page_name ;;
    link: {
      label: "KOL Profile dashboard"
      url: "https://ydmlooker.cloud.looker.com/dashboards/44?User+Name={{value}}"
    }
  }

  dimension: meta_parent_account_id {
    type: string
    sql: ${TABLE}.meta_parent_account_id ;;
  }

  dimension: meta_parent_comment_id {
    type: string
    sql: ${TABLE}.meta_parent_comment_id ;;
  }

  dimension: meta_parent_post_id {
    type: string
    sql: ${TABLE}.meta_parent_post_id ;;
  }

  dimension: meta_play_count {
    type: number
    sql: ${TABLE}.meta_play_count ;;
  }

  dimension: meta_point_count {
    type: number
    sql: ${TABLE}.meta_point_count ;;
  }

  dimension: meta_post_type {
    type: string
    sql: ${TABLE}.meta_post_type ;;
  }

  dimension: post_type {
    type: string
    sql: CASE
          WHEN ${TABLE}.channel = 'tiktok'   THEN 'video'
          WHEN ${TABLE}.channel = 'x' THEN 'tweet'
          WHEN ${TABLE}.meta_post_type = '' THEN 'post'
          WHEN ${TABLE}.channel in ("blog", "news", "forum") THEN 'blog post'
      ELSE ${TABLE}.meta_post_type
      END ;;
  }

  dimension: meta_province {
    hidden: yes
    sql: ${TABLE}.meta_province ;;
  }

  dimension: meta_quote_count {
    type: number
    sql: ${TABLE}.meta_quote_count ;;
  }

  dimension: meta_reaction_count {
    type: number
    sql: ${TABLE}.meta_reaction_count ;;
  }

  dimension: meta_reply_count {
    type: number
    sql: ${TABLE}.meta_reply_count ;;
  }

  dimension: meta_reply_to_statusid {
    type: string
    sql: ${TABLE}.meta_reply_to_statusid ;;
  }

  dimension: meta_reply_to_userid {
    type: string
    sql: ${TABLE}.meta_reply_to_userid ;;
  }

  dimension: meta_repost_count {
    type: number
    sql: ${TABLE}.meta_repost_count ;;
  }

  dimension: meta_sad_count {
    type: number
    sql: ${TABLE}.meta_sad_count ;;
  }

  dimension: meta_scary_count {
    type: number
    sql: ${TABLE}.meta_scary_count ;;
  }

  dimension: meta_share_count {
    type: number
    sql: ${TABLE}.meta_share_count ;;
  }

  dimension: meta_source {
    type: string
    sql: ${TABLE}.meta_source ;;
  }

  dimension: meta_source_name {
    type: string
    sql: ${TABLE}.meta_source_name ;;
  }

  dimension: meta_specific {
    type: number
    sql: ${TABLE}.meta_specific ;;
  }

  dimension: meta_tags {
    hidden: yes
    sql: ${TABLE}.meta_tags ;;
  }

  dimension: meta_topic_detail {
    type: string
    sql: ${TABLE}.meta_topic_detail ;;
  }

  dimension: meta_topic_id {
    type: string
    sql: ${TABLE}.meta_topic_id ;;
  }

  dimension: meta_topic_name {
    type: string
    sql: ${TABLE}.meta_topic_name ;;
  }

  dimension: meta_type {
    label: "Post category"
    type: string
    sql:
    CASE
      WHEN ${TABLE}.channel = 'x' THEN 'post'
    ELSE ${TABLE}.meta_type
    END;;
  }

  dimension: meta_user_mention {
    hidden: yes
    sql: ${TABLE}.meta_user_mention ;;
  }

  dimension: meta_video_category {
    type: string
    sql: ${TABLE}.meta_video_category ;;
  }

  dimension: meta_video_id {
    type: string
    sql: ${TABLE}.meta_video_id ;;
  }

  dimension: meta_view_count {
    type: number
    sql: ${TABLE}.meta_view_count ;;
  }

  dimension: meta_wow_count {
    type: number
    sql: ${TABLE}.meta_wow_count ;;
  }

  dimension: note {
    type: string
    sql: ${TABLE}.note ;;
  }

  dimension: ocr_text {
    type: string
    sql: ${TABLE}.ocr_text ;;
  }

  dimension: permalink {
    type: string
    sql: ${TABLE}.permalink ;;
    description: "URL of social media post, for exploer KOL post on social media"
    # html: <iframe width='320' height='440' src='https://www.ydmthailand.com/'></iframe> ;;
  }

  dimension: photos {
    type: string
    sql: ${TABLE}.photos ;;
  }

  dimension: post_id {
    type: string
    sql: ${TABLE}.post_id ;;
  }

  dimension_group: post_time_human {
    type: time
    timeframes: [raw,second ,minute, minute2,date, week, month, quarter, year]
    datatype: datetime
    sql: DATETIME(TIMESTAMP(${TABLE}.post_time_human), 'Asia/Bangkok') ;;
  }

  dimension_group: date {
    description: "Date of social media post"
    type: time
    timeframes: [date, week, month, quarter, year]
    datatype: date
    sql: ${post_time_human_date} ;;
  }

  dimension: date {
    type: date
    sql: PARSE_DATE('%Y-%m-%d', SUBSTR(${TABLE}.post_time_human, 1, 10)) ;;
  }

  dimension: week {
    type: date_week
    sql: PARSE_DATE('%Y-%m-%d', SUBSTR(${TABLE}.post_time_human, 1, 10)) ;;
  }

  dimension: month {
    type: date_month
    sql: PARSE_DATE('%Y-%m-%d', SUBSTR(${TABLE}.post_time_human, 1, 10)) ;;
  }

  dimension: year {
    type: date_year
    sql: PARSE_DATE('%Y-%m-%d', SUBSTR(${TABLE}.post_time_human, 1, 10)) ;;
  }

  dimension: date_primary {
    type: string
    sql:  PARSE_DATE('%Y-%m-%d', SUBSTR(${TABLE}.post_time_human, 1, 10)) ;;
  }

  dimension_group: post_time_unix {
    type: time
    timeframes: [minute, date, week, month, quarter, year]
    sql: DATE(TIMESTAMP_SECONDS(${TABLE}.post_time_unix),'Asia/Bangkok') ;;
  }

  dimension: poster_label_audience_size {
    type: string
    sql: ${TABLE}.poster_label_audience_size ;;
  }

  dimension: poster_label_brand_involvement {
    type: string
    sql: ${TABLE}.poster_label_brand_involvement ;;
  }

  dimension: poster_label_categories {
    hidden: yes
    sql: ${TABLE}.poster_label_categories ;;
  }

  dimension: poster_label_type {
    type: string
    sql: ${TABLE}.poster_label_type ;;
  }

  dimension: poster_label_tza {
    hidden: yes
    sql: ${TABLE}.poster_label_tza ;;
  }

  dimension: sentiment {
    type: number
    sql: ${TABLE}.sentiment ;;
  }

  dimension: sentiment_changed {
    type: number
    sql: ${TABLE}.sentiment_changed ;;
  }

  dimension: sentiment_value {
    description: "Sentiment label from user message"
    type: string
    sql: CASE
          WHEN ${TABLE}.sentiment = 1   THEN 'Positive'
          WHEN ${TABLE}.sentiment = 0   THEN 'Neutral'
          WHEN ${TABLE}.sentiment = -1  THEN 'Negative'
      ELSE null
      END ;;
  }

  dimension: sub_keywords {
    hidden: yes
    sql: ${TABLE}.sub_keywords ;;
  }

  dimension: system_label_image {
    hidden: yes
    sql: ${TABLE}.system_label_image ;;
  }

  dimension: system_label_text {
    hidden: yes
    sql: ${TABLE}.system_label_text ;;
  }

  dimension: text {
    description: "Message on post"
    type: string
    sql: ${TABLE}.text ;;

    link: {
      label: "Post Analysts dashboard"
      url: "https://ydmlooker.cloud.looker.com/dashboards/56?Post+Comment+Fillter={{post_comment_fillter}}"
      icon_url: "https://cdn-icons-png.flaticon.com/512/4712/4712803.png"
    }

    link: {
      label: "See post on social media"
      url: "{{permalink}}"
      icon_url: "https://cdn-icons-png.flaticon.com/512/4712/4712803.png"
    }
  }

  dimension: text_for_search {
    hidden: yes
    sql: ${TABLE}.text_for_search ;;
  }

  dimension: track_account {
    type: number
    sql: ${TABLE}.track_account ;;
  }

  dimension: track_news_section {
    type: number
    sql: ${TABLE}.track_news_section ;;
  }

  dimension: track_post {
    type: number
    sql: ${TABLE}.track_post ;;
  }

  dimension: updated_at {
    type: string
    sql: ${TABLE}.updated_at ;;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}.user_id ;;
  }
  dimension: user_name {
    description: "Title name of social media account"
    type: string
    sql: ${TABLE}.user_name ;;
    link: {
      label: "KOL Profile dashboard"
      icon_url: "https://cdn3.iconfinder.com/data/icons/signs-symbols-5/126/slice330-512.png"
      url: "https://ydmlooker.cloud.looker.com/embed/dashboards/44?User+Name={{value}}"
    }
    link: {
      label: "KOL Social media"
      url: "{{contact_link}}"
      icon_url: "https://cdn-icons-png.flaticon.com/512/1968/1968666.png"
    }
  }


  dimension: user_name_instagram {
    type: string
    sql: ${TABLE}.user_name ;;

    link: {
      label: "Instagram profile"
      url: "https://www.instagram.com/{{value}}"
      icon_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a5/Instagram_icon.png/2048px-Instagram_icon.png"
    }
  }

  dimension: user_name_facebook {
    type: string
    sql: ${TABLE}.user_name;;
    link: {
      label: "Facebook profile"
      url: "https://www.facebook.com/{{user_id}}"
      icon_url: "https://upload.wikimedia.org/wikipedia/commons/b/b9/2023_Facebook_icon.svg"
    }
  }

  dimension: user_name_x {
    type: string
    sql: ${TABLE}.user_name;;
    link: {
      label: "X profile"
      url: "https://www.x.com/{{value}}"
      icon_url: "https://freepnglogo.com/images/all_img/1707222563twitter-logo-png.png"
    }
  }

  dimension: user_profile_image_url {
    type: string
    sql: ${TABLE}.user_profile_image_url ;;
    html:<img src="{{value}}"  height="300"> ;;

    link: {
      label: "Contact Link"
      url: "{{contact_link}}"
      icon_url: "https://cdn-icons-png.flaticon.com/512/1968/1968666.png"
    }

    link: {
      label: "See Content"
      url: "{{permalink}}"
      icon_url: "https://cdn-icons-png.flaticon.com/512/1968/1968666.png"
    }
  }

  dimension: social_trend_profile {
    type: string
    sql: ${TABLE}.user_profile_image_url ;;
    html:
    <div>
    <img src="{{value}}" height="300" alt="User Image" />
    <br>
    <p></p>
    <a href="{{contact_link}}" target="_blank">
    <button style="padding: 10px 20px; background-color: #4CAF50; color: white; border: none; border-radius: 5px; cursor: pointer;">
    Contact Link
    </button>
    </a>
    <a href="{{permalink}}" target="_blank">
    <button style="padding: 10px 20px; background-color: #008CBA; color: white; border: none; border-radius: 5px; cursor: pointer; margin-left: 10px;">
    See Content
    </button>
    </a>
    </div> ;;
  }

  dimension: user_real_name {
    description: "Alise name of social media account"
    type: string
    sql: ${TABLE}.user_real_name ;;
  }

  #Nivea
  dimension: kol_cost {
    description: "Tier of KOL based on follower and socialmedia channel"
    type: number
    sql: CASE
          WHEN ${TABLE}.channel = 'facebook' AND ${max_follower} >= 5000000                               THEN 500000
          WHEN ${TABLE}.channel = 'facebook' AND ${max_follower} >= 1000000 AND ${max_follower} <5000000  THEN 300000
          WHEN ${TABLE}.channel = 'facebook' AND ${max_follower} >= 500000  AND ${max_follower} <1000000  THEN 200000
          WHEN ${TABLE}.channel = 'facebook' AND ${max_follower} >= 50000   AND ${max_follower} <500000   THEN 50000
          WHEN ${TABLE}.channel = 'facebook' AND ${max_follower} >= 10000   AND ${max_follower} <50000    THEN 150000
          WHEN ${TABLE}.channel = 'facebook' AND ${max_follower} >= 1       AND ${max_follower} <10000    THEN 5000

      WHEN ${TABLE}.channel = 'instagram' AND ${max_follower} >= 5000000                               THEN 500000
      WHEN ${TABLE}.channel = 'instagram' AND ${max_follower} >= 1000000 AND ${max_follower} <5000000  THEN 300000
      WHEN ${TABLE}.channel = 'instagram' AND ${max_follower} >= 500000  AND ${max_follower} <1000000  THEN 200000
      WHEN ${TABLE}.channel = 'instagram' AND ${max_follower} >= 50000   AND ${max_follower} <500000   THEN 50000
      WHEN ${TABLE}.channel = 'instagram' AND ${max_follower} >= 10000   AND ${max_follower} <50000    THEN 150000
      WHEN ${TABLE}.channel = 'instagram' AND ${max_follower} >= 1       AND ${max_follower} <10000    THEN 10000

      WHEN ${TABLE}.channel = 'tiktok' AND ${max_follower} >= 5000000                               THEN 400000
      WHEN ${TABLE}.channel = 'tiktok' AND ${max_follower} >= 1000000 AND ${max_follower} <5000000  THEN 250000
      WHEN ${TABLE}.channel = 'tiktok' AND ${max_follower} >= 500000  AND ${max_follower} <1000000  THEN 150000
      WHEN ${TABLE}.channel = 'tiktok' AND ${max_follower} >= 50000   AND ${max_follower} <500000   THEN 100000
      WHEN ${TABLE}.channel = 'tiktok' AND ${max_follower} >= 10000   AND ${max_follower} <50000    THEN 30000
      WHEN ${TABLE}.channel = 'tiktok' AND ${max_follower} >= 1       AND ${max_follower} <10000    THEN 5000

      WHEN ${TABLE}.channel = 'youtube' AND ${max_follower} >= 5000000                               THEN 600000
      WHEN ${TABLE}.channel = 'youtube' AND ${max_follower} >= 1000000 AND ${max_follower} <5000000  THEN 400000
      WHEN ${TABLE}.channel = 'youtube' AND ${max_follower} >= 500000  AND ${max_follower} <1000000  THEN 300000
      WHEN ${TABLE}.channel = 'youtube' AND ${max_follower} >= 50000   AND ${max_follower} <500000   THEN 200000
      WHEN ${TABLE}.channel = 'youtube' AND ${max_follower} >= 10000   AND ${max_follower} <50000    THEN 50000
      WHEN ${TABLE}.channel = 'youtube' AND ${max_follower} >= 1       AND ${max_follower} <10000    THEN 5000

      WHEN ${TABLE}.channel = 'x' AND ${max_follower} >= 5000000                               THEN 400000
      WHEN ${TABLE}.channel = 'x' AND ${max_follower} >= 1000000 AND ${max_follower} <5000000  THEN 100000
      WHEN ${TABLE}.channel = 'x' AND ${max_follower} >= 500000  AND ${max_follower} <1000000  THEN 100000
      WHEN ${TABLE}.channel = 'x' AND ${max_follower} >= 50000   AND ${max_follower} <500000   THEN 50000
      WHEN ${TABLE}.channel = 'x' AND ${max_follower} >= 10000   AND ${max_follower} <50000    THEN 30000
      WHEN ${TABLE}.channel = 'x' AND ${max_follower} >= 1       AND ${max_follower} <10000    THEN 5000

      ELSE 0
      END ;;
  }

  dimension: kol_tier {
    type: string
    description: "Cost of KOL based on follower and socialmedia channel"
    sql: CASE
          WHEN ${TABLE}.channel = 'facebook' AND ${max_follower} >= 5000000                               THEN "Celebrity / Social Stars"
          WHEN ${TABLE}.channel = 'facebook' AND ${max_follower} >= 1000000 AND ${max_follower} <5000000  THEN "Mega"
          WHEN ${TABLE}.channel = 'facebook' AND ${max_follower} >= 500000  AND ${max_follower} <1000000  THEN "Macro"
          WHEN ${TABLE}.channel = 'facebook' AND ${max_follower} >= 50000   AND ${max_follower} <500000   THEN "Mid-Tier"
          WHEN ${TABLE}.channel = 'facebook' AND ${max_follower} >= 10000   AND ${max_follower} <50000    THEN "Micro"
          WHEN ${TABLE}.channel = 'facebook' AND ${max_follower} >= 1       AND ${max_follower} <10000    THEN "Nano"

      WHEN ${TABLE}.channel = 'instagram' AND ${max_follower} >= 5000000                               THEN "Celebrity / Social Stars"
      WHEN ${TABLE}.channel = 'instagram' AND ${max_follower} >= 1000000 AND ${max_follower} <5000000  THEN "Mega"
      WHEN ${TABLE}.channel = 'instagram' AND ${max_follower} >= 500000  AND ${max_follower} <1000000  THEN "Macro"
      WHEN ${TABLE}.channel = 'instagram' AND ${max_follower} >= 50000   AND ${max_follower} <500000   THEN "Mid-Tier"
      WHEN ${TABLE}.channel = 'instagram' AND ${max_follower} >= 10000   AND ${max_follower} <50000    THEN "Micro"
      WHEN ${TABLE}.channel = 'instagram' AND ${max_follower} >= 1       AND ${max_follower} <10000    THEN "Nano"

      WHEN ${TABLE}.channel = 'tiktok' AND ${max_follower} >= 5000000                               THEN "Celebrity / Social Stars"
      WHEN ${TABLE}.channel = 'tiktok' AND ${max_follower} >= 1000000 AND ${max_follower} <5000000  THEN "Mega"
      WHEN ${TABLE}.channel = 'tiktok' AND ${max_follower} >= 500000  AND ${max_follower} <1000000  THEN "Macro"
      WHEN ${TABLE}.channel = 'tiktok' AND ${max_follower} >= 50000   AND ${max_follower} <500000   THEN "Mid-Tier"
      WHEN ${TABLE}.channel = 'tiktok' AND ${max_follower} >= 10000   AND ${max_follower} <50000    THEN "Micro"
      WHEN ${TABLE}.channel = 'tiktok' AND ${max_follower} >= 1       AND ${max_follower} <10000    THEN "Nano"

      WHEN ${TABLE}.channel = 'youtube' AND ${max_follower} >= 5000000                               THEN "Celebrity / Social Stars"
      WHEN ${TABLE}.channel = 'youtube' AND ${max_follower} >= 1000000 AND ${max_follower} <5000000  THEN "Mega"
      WHEN ${TABLE}.channel = 'youtube' AND ${max_follower} >= 500000  AND ${max_follower} <1000000  THEN "Macro"
      WHEN ${TABLE}.channel = 'youtube' AND ${max_follower} >= 50000   AND ${max_follower} <500000   THEN "Mid-Tier"
      WHEN ${TABLE}.channel = 'youtube' AND ${max_follower} >= 10000   AND ${max_follower} <50000    THEN "Micro"
      WHEN ${TABLE}.channel = 'youtube' AND ${max_follower} >= 1       AND ${max_follower} <10000    THEN "Nano"

      WHEN ${TABLE}.channel = 'x' AND ${max_follower} >= 5000000                               THEN "Celebrity / Social Stars"
      WHEN ${TABLE}.channel = 'x' AND ${max_follower} >= 1000000 AND ${max_follower} <5000000  THEN "Mega"
      WHEN ${TABLE}.channel = 'x' AND ${max_follower} >= 500000  AND ${max_follower} <1000000  THEN "Macro"
      WHEN ${TABLE}.channel = 'x' AND ${max_follower} >= 50000   AND ${max_follower} <500000   THEN "Mid-Tier"
      WHEN ${TABLE}.channel = 'x' AND ${max_follower} >= 10000   AND ${max_follower} <50000    THEN "Micro"
      WHEN ${TABLE}.channel = 'x' AND ${max_follower} >= 1       AND ${max_follower} <10000    THEN "Nano"

      ELSE "Nano"
      END ;;
  }

  dimension: contact_link {
    description: "KOL Contact URL link"
    sql: CASE
          WHEN ${zocial_eye_message.channel} = 'tiktok' THEN CONCAT('https://www.tiktok.com/@', ${zocial_eye_message.user_name})
          WHEN ${zocial_eye_message.channel} = 'facebook' THEN CONCAT('https://www.facebook.com/', ${zocial_eye_message.user_id})
          WHEN ${zocial_eye_message.channel} = 'instagram' THEN CONCAT('https://www.instagram.com/', ${zocial_eye_message.user_name})
          WHEN ${zocial_eye_message.channel} = 'x' THEN CONCAT('https://x.com/', ${zocial_eye_message.user_name})
          WHEN ${zocial_eye_message.channel} = 'youtube' THEN CONCAT('https://www.youtube.com/@', ${zocial_eye_message.user_name})
          ELSE NULL
        END ;;
  }


  dimension: kol_budget_dpr {
    type: number
    sql: CASE
          WHEN ${dpr_kol_budget.budget_status} = 'DPR' THEN ${dpr_kol_budget.budget}
          ELSE ${kol_cost}
    END ;;
  }

  measure: estimate_kol_budget {
    type:  max
    filters: [account_label_type: "-Brand"]
    sql: ${kol_budget_dpr} ;;
  }

  measure: estimate_kol_budget_all {
    type:  sum
    filters: [account_label_type: "-Brand"]
    sql: ${kol_budget_dpr} ;;
  }


  measure: kol_budget {
    type: sum
    description: "Total budget of KOL"
    sql: ${kol_cost} ;;
  }

  measure: avg_kol_budget {
    type: average
    description: "Average budget of KOL"
    sql: ${kol_cost} ;;
    value_format: "#,##0"
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: total_engagement {
    description: "Total post engagement"
    type: sum
    sql:  ${TABLE}.engagement;;
  }

  measure: avg_engagement_per_post {
    description: "Average engagement per post"
    sql:  ${total_engagement} /${post_count};;
  }

  dimension: max_follower {
    description: "Total follower base on social media channel"
    type: number
    sql:  ${TABLE}.meta_follower_count;;
  }

  measure: follower {
    description: "Total follower base on social media channel"
    type: max
    sql: COALESCE(${TABLE}.meta_follower_count, 0);;
  }

  measure: sum_of_meta_play_count {
    description: "Sum of TikTok Video view"
    type: sum
    sql:  ${TABLE}.meta_play_count;;
  }

  measure: sum_of_meta_view_count {
    description: "Sum of Youtube Video view"
    type: sum
    sql:  ${TABLE}.meta_view_count;;
  }

  measure: engagement_rate {
    description: "Engagement rete, percentage of engagement of total follower"
    type: average
    sql: ${TABLE}.engagement / NULLIF(${TABLE}.meta_follower_count, 0) ;;
    value_format: "0.00%"
  }

  measure: post_count {
    label: "Post count"
    description: "Total count of social media post"
    type: count_distinct
    sql: ${TABLE}.post_id ;;
  }

  measure: kol_count {
    description: "Total KOLs in campaign marketing"
    type: count_distinct
    sql: ${TABLE}.user_name ;;
  }

  measure: post_per_kol {
    description: "Average number of posts per KOL"
    type: number
    sql: ${post_count} / NULLIF(${kol_count}, 0) ;;
    value_format_name: "decimal_2"
  }

  measure: total_like {
    type: sum
    description: "Total post like"
    sql: ${TABLE}.meta_like_count ;;
  }

  measure: total_share {
    type: sum
    description: "Total post share"
    sql: ${TABLE}.meta_share_count ;;
  }

  measure: total_comment {
    type: sum
    description: "Total comment on KOL's post"
    sql: ${TABLE}.meta_comment_count ;;
  }

  measure: consumer_voice {
    type: count_distinct
    filters: [account_label_type: "-Brand,-Public Figure"]
    description: "Count of customer voice"
    sql: ${TABLE}._id ;;
  }

  measure: rank_text {
    type: count_distinct
    sql: ${TABLE}.text ;;
  }


  measure: rank_of_row_engagement {
    type: running_total
    sql: ${total_engagement} ;;
  }



  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      meta_group_name,
      user_name,
      meta_source_name,
      meta_topic_name,
      meta_page_name,
      user_real_name,
      meta_news_name,
      campaign_name,
      meta_blog_name
    ]
  }

}

# The name of this view in Looker is "Zocial Eye Message Links"
view: zocial_eye_message__links {

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Zocial Eye Message Links" in Explore.

  dimension: zocial_eye_message__links {
    type: string
    sql: zocial_eye_message__links ;;
  }
}

# The name of this view in Looker is "Zocial Eye Message Keywords"
view: zocial_eye_message__keywords {

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Zocial Eye Message Keywords" in Explore.

  dimension: zocial_eye_message__keywords {
    label: "Keywords"
    description: "Main keywords from social listening campaign"
    type: string
    sql: zocial_eye_message__keywords ;;
  }
}

# The name of this view in Looker is "Zocial Eye Message Hashtags"
view: zocial_eye_message__hashtags {

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Zocial Eye Message Hashtags" in Explore.

  dimension: zocial_eye_message__hashtags {
    label: "Hashtag"
    type: string
    sql: zocial_eye_message__hashtags ;;
    link: {
      label: "Facebbok: Hashtag explore"
      url: "https://www.facebook.com/hashtag/{{value}}"
      icon_url: "https://upload.wikimedia.org/wikipedia/commons/b/b9/2023_Facebook_icon.svg"
    }
    link: {
      label: "Instagram: Hashtag explore"
      url: "https://www.instagram.com/explore/tags/{{value}}"
      icon_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a5/Instagram_icon.png/2048px-Instagram_icon.png"
    }
    link: {
      label: "TikTok: Hashtag explore"
      url: "https://www.tiktok.com/tag/{{value}}"
      icon_url: "https://static-00.iconduck.com/assets.00/tik-tok-icon-1024x1024-zwq641op.png"
    }
  }
}

# The name of this view in Looker is "Zocial Eye Message Category"
view: zocial_eye_message__category {

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Zocial Eye Message Category" in Explore.

  dimension: zocial_eye_message__category {
    type: string
    sql: zocial_eye_message__category ;;
  }
}

# The name of this view in Looker is "Zocial Eye Message Meta Tags"
view: zocial_eye_message__meta_tags {

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Zocial Eye Message Meta Tags" in Explore.

  dimension: zocial_eye_message__meta_tags {
    type: string
    sql: zocial_eye_message__meta_tags ;;
  }
}

# The name of this view in Looker is "Zocial Eye Message Sub Keywords"
view: zocial_eye_message__sub_keywords {

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Zocial Eye Message Sub Keywords" in Explore.

  dimension: zocial_eye_message__sub_keywords {
    type: string
    sql: zocial_eye_message__sub_keywords ;;
  }
}

# The name of this view in Looker is "Zocial Eye Message Meta Province"
view: zocial_eye_message__meta_province {

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Zocial Eye Message Meta Province" in Explore.

  dimension: zocial_eye_message__meta_province {
    type: string
    sql: zocial_eye_message__meta_province ;;
  }
}

# The name of this view in Looker is "Zocial Eye Message Text for Search"
view: zocial_eye_message__text_for_search {

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Zocial Eye Message Text for Search" in Explore.

  dimension: zocial_eye_message__text_for_search {
    type: string
    sql: zocial_eye_message__text_for_search ;;
  }
}

# The name of this view in Looker is "Zocial Eye Message Logo Detections"
view: zocial_eye_message__logo_detections {

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Zocial Eye Message Logo Detections" in Explore.

  dimension: zocial_eye_message__logo_detections {
    type: string
    sql: zocial_eye_message__logo_detections ;;
  }
}

# The name of this view in Looker is "Zocial Eye Message Poster Label Tza"
view: zocial_eye_message__poster_label_tza {

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Zocial Eye Message Poster Label Tza" in Explore.

  dimension: zocial_eye_message__poster_label_tza {
    type: string
    sql: zocial_eye_message__poster_label_tza ;;
  }
}

# The name of this view in Looker is "Zocial Eye Message Links for Search"
view: zocial_eye_message__links_for_search {

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Zocial Eye Message Links for Search" in Explore.

  dimension: zocial_eye_message__links_for_search {
    type: string
    sql: zocial_eye_message__links_for_search ;;
  }
}

# The name of this view in Looker is "Zocial Eye Message Exclude Keywords"
view: zocial_eye_message__exclude_keywords {

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Zocial Eye Message Exclude Keywords" in Explore.

  dimension: zocial_eye_message__exclude_keywords {
    type: string
    sql: zocial_eye_message__exclude_keywords ;;
  }
}

# The name of this view in Looker is "Zocial Eye Message Deleted Category"
view: zocial_eye_message__deleted_category {

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Zocial Eye Message Deleted Category" in Explore.

  dimension: zocial_eye_message__deleted_category {
    type: number
    sql: zocial_eye_message__deleted_category ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_zocial_eye_message__deleted_category {
    type: sum
    sql: ${zocial_eye_message__deleted_category} ;;  }
  measure: average_zocial_eye_message__deleted_category {
    type: average
    sql: ${zocial_eye_message__deleted_category} ;;  }
}

# The name of this view in Looker is "Zocial Eye Message Account Label Tza"
view: zocial_eye_message__account_label_tza {

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Zocial Eye Message Account Label Tza" in Explore.

  dimension: zocial_eye_message__account_label_tza {
    type: string
    sql: zocial_eye_message__account_label_tza ;;
  }
}

# The name of this view in Looker is "Zocial Eye Message System Label Text"
view: zocial_eye_message__system_label_text {

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Zocial Eye Message System Label Text" in Explore.

  dimension: zocial_eye_message__system_label_text {
    type: number
    sql: zocial_eye_message__system_label_text ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_zocial_eye_message__system_label_text {
    type: sum
    sql: ${zocial_eye_message__system_label_text} ;;  }
  measure: average_zocial_eye_message__system_label_text {
    type: average
    sql: ${zocial_eye_message__system_label_text} ;;  }
}

# The name of this view in Looker is "Zocial Eye Message Meta User Mention"
view: zocial_eye_message__meta_user_mention {

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Zocial Eye Message Meta User Mention" in Explore.

  dimension: zocial_eye_message__meta_user_mention {
    type: string
    sql: zocial_eye_message__meta_user_mention ;;
  }
}

# The name of this view in Looker is "Zocial Eye Message Meta News Sections"
view: zocial_eye_message__meta_news_sections {

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Zocial Eye Message Meta News Sections" in Explore.

  dimension: zocial_eye_message__meta_news_sections {
    type: string
    sql: zocial_eye_message__meta_news_sections ;;
  }
}

# The name of this view in Looker is "Zocial Eye Message System Label Image"
view: zocial_eye_message__system_label_image {

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Zocial Eye Message System Label Image" in Explore.

  dimension: zocial_eye_message__system_label_image {
    type: string
    sql: zocial_eye_message__system_label_image ;;
  }
}

# The name of this view in Looker is "Zocial Eye Message Poster Label Categories"
view: zocial_eye_message__poster_label_categories {

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Zocial Eye Message Poster Label Categories" in Explore.

  dimension: zocial_eye_message__poster_label_categories {
    type: string
    sql: zocial_eye_message__poster_label_categories ;;
  }
}

# The name of this view in Looker is "Zocial Eye Message Account Label Categories"
view: zocial_eye_message__account_label_categories {

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Zocial Eye Message Account Label Categories" in Explore.

  dimension: zocial_eye_message__account_label_categories {
    type: string
    sql: zocial_eye_message__account_label_categories ;;
  }
}
