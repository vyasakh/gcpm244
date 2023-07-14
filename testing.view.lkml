view: testing {

  derived_table: {
    sql: select * from demo_db.order_items ;;
  }


  dimension_group: returned {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year,
      day_of_week,
      month_name,
      month_num]

    sql: ${TABLE}.returned_at ;;
  }

  dimension: phone {
    type: string
    sql: ${TABLE}.phone ;;
  }
  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension: mtd {
    type: yesno
    sql: ${phone} ;;
  }
 }
