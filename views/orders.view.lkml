view: orders {
  sql_table_name: demo_db.orders ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw,time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
  }
  dimension: test {
    type: date_hour
    sql: ${TABLE}.created_at ;;
  }
  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  parameter: method {
    type: unquoted
    allowed_value: {

      value: "sum"
    }
    allowed_value: {

      value: "median"
    }
  }

  parameter: filter {
    type: unquoted
    allowed_value: {
      value: "complete"
    }
    allowed_value: {
      value: "pending"
    }
      }
 measure: sum {
  type:sum
   sql:   ${id};;
 }
  # measure: aggregate {
  #   sql:
  #   {% if method._parameter_value == 'sum' %}
  #     sum(  ${sum} )
  #   {% elsif method._parameter_value == 'median' %}
  #     avg(${sum}  )
  #   {% else %}
  #     ${id}
  #   {% endif %};;
  # }


  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }
  measure: count {
    type: count
    filters: [status: "cancelled"]
    drill_fields: [detail*]
  }

  measure: count_of_users{
    type: count_distinct
    sql: ${id} ;;
  }

  measure: count_of_all_users {
    type: count_distinct
    sql: ${id} ;;
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
  id,
  users.id,
  users.first_name,
  users.last_name,
  billion_orders.count,
  fakeorders.count,
  hundred_million_orders.count,
  hundred_million_orders_wide.count,
  order_items.count,
  order_items_vijaya.count,
  ten_million_orders.count
  ]
  }

}
