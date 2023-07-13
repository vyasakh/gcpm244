view: orders {
  sql_table_name: demo_db.orders ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;

    link: {
      label: "dashboard link"
      #url: "https://gcpl236.cloud.looker.com/dashboards/168?orders.id={{ value }}"
      url: "https://gcpl2310.cloud.looker.com/dashboards/112"

    }
    #html:
    # <p style="background-color:powderblue;"> {{ value }} </p>;;
    html:{% if value > 20 %}
          <a style="color: green">{{rendered_value}}▲</a>
          {% elsif value < 20 %}
          <a style="color: red">{{rendered_value}}▼</a>
          {% else %}
          <a style="color: black">{{rendered_value}}</a>
          {% endif %} ;;
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
  measure: htmllink {
    type: number
    sql: ${id}/4 ;;
    link: {
      label: "dashboard link"
      #url: "https://gcpl236.cloud.looker.com/dashboards/168?orders.id={{ value }}"
      url: "https://gcpl2310.cloud.looker.com/dashboards/112"

    }
    #html:
    # <p style="background-color:powderblue;"> {{ value }} </p>;;
    html:{% if value > 20 %}
          <a style="color: green">{{rendered_value}}▲</a>
          {% elsif value < 20 %}
          <a style="color: red">{{rendered_value}}▼</a>
          {% else %}
          <a style="color: black">{{rendered_value}}</a>
          {% endif %} ;;
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
