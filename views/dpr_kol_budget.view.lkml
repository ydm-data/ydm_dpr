view: dpr_kol_budget {
  sql_table_name: `DPR.dpr_kol_budget` ;;

  dimension: primary_key_kpi {
    type: string
    sql: CONCAT(${user_name},"_",${channel}) ;;
  }

  dimension: budget {
    type: number
    sql: COALESCE(${TABLE}.budget, 0) ;;
  }


  dimension: budget_status {
    type: string
    sql: ${TABLE}.budget_status ;;
  }


  dimension: user_name {
    type: string
    sql: ${TABLE}.user_name ;;
  }

  dimension: kol_channel_key {
    type: string
    sql: ${TABLE}.kol_channel_key ;;
    primary_key: yes
  }
  dimension: channel {
    type: string
    sql: ${TABLE}.channel ;;
  }
  measure: count {
    type: count
    drill_fields: [kol_channel_key]
  }

  measure: total_budget {
    type: sum
    sql: ${TABLE}.budget ;;
  }
}
