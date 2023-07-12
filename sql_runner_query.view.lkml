#X# Conversion failed: failed to parse YAML.  Check for pipes on newlines


view: sql_runner_query {
  derived_table: {
    sql: SELECT
          id AS `agg.id`,
          status AS `agg.status`,
          SUM((select id from orders where id= "{% parameter filter %}" )
            ) AS `agg.sum`
      FROM demo_db.orders ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: agg_id {
    type: number
    sql: ${TABLE}.`agg.id` ;;
  }

  dimension: agg_status {
    type: string
    sql: ${TABLE}.`agg.status` ;;
  }

  dimension: agg_sum {
    type: number
    sql: ${TABLE}.`agg.sum` ;;
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
    type: number
    }


  measure: aggregate {
    type: number
    sql:
      {% if method._parameter_value == 'sum' %}
        sum(${agg_sum})
      {% elsif method._parameter_value == 'median' %}
        avg(${agg_sum})
      {% else %}
        ${agg_id}
      {% endif %};;
  }set: detail {
    fields: [
        agg_id,
  agg_status,
  agg_sum
    ]
  }
}
