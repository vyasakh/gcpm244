view: orders {
  sql_table_name: demo_db.orders ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;


  }

  dimension: idtest {

    type: number
    sql: ${TABLE}.id ;;
    html:

    <a href="https://gcpl236.cloud.looker.com/dashboards/168?ID={{_filters['id']}}">{{rendered_value}} <a/>;;

  }
  dimension: idtestdupe {

    type: number
    sql: ${TABLE}.id ;;
    drill_fields: [id,drill_test,test]
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

  parameter: param {
    type: string
    allowed_value: {
      value: "Drishya"
    }
    allowed_value: {
      value: "Vinay"
    }
    allowed_value: {
      value: "Vysakh"
    }
  }

  dimension: title_test {
    label: "Title_Test"
    sql: 1 ;;
    type: string
    html: <h1>{% case param._parameter_value %}
          {% when "'Drishya'" %}DRISHYA
          {% when "'Vinay'" %}VINAY
          {% when "'Vysakh'" %}VYSAKH
          {% else %}End Case
        {% endcase %} by Pokemon</h1>;;
  }

  parameter: param2 {
    type: unquoted
    # allowed_value: {
    #   value: "Drishya"
    # }
    # allowed_value: {
    #   value: "Vinay"
    # }
    # allowed_value: {
    #   value: "Vysakh"
    # }
  }

  dimension: title_test_dupe {
    label: "Title_Test_dupe"
    sql: 1 ;;
    type: string
    html: <h1>{% case param2._parameter_value %}
          {% when 'Drishya' %}DRISHYA
          {% when 'Vinay' %}VINAY
          {% when 'Vysakh' %}VYSAKH
          {% else %}End Case
        {% endcase %} by Pokemon</h1>;;
  }

  dimension: title_test2 {
    label: "Title_Test2"
    sql: 1 ;;
    type: string

    html: {% if param._parameter_value=='Drishya' %}
          <h1>DRISHYA</h1>
          {% elsif param._parameter_value=='Vinay' %}VINAY
          {%  elsif param._parameter_value=='Vysakh' %}VYSAKH
          {% else %}<h1>End Case</h1>
        {% endif %} <h1>by Pokemon</h1>;;
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
measure: drill_test {
  type: sum_distinct
  value_format_name: eur
  sql: id-200000000 ;;
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
    drill_fields: [id,drill_test,test]
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



  measure: list {
    type: list
    list_field: status
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
