# If necessary, uncomment the line below to include explore_source.
# include: "0_vysakh_thelook.model.lkml"

view: agg {
  derived_table: {
    explore_source: orders {
      column: id {}
      column: status {}
      column: sum {}
      # filters: {
      #   field: orders.filter
      #   value: "complete"
      # }
      # filters: {
      #   field: orders.method
      #   #value: "sum"

      # }

    }
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


  dimension: id {
    description: ""
    type: number
  }
  dimension: status {
    description: ""
  }
  dimension: sum {
    description: ""
    type: number
  }
  measure: aggregate {
      sql:
      {% if method._parameter_value == 'sum' %}
        sum(  ${sum} )
      {% elsif method._parameter_value == 'median' %}
        avg(${sum}  )
      {% else %}
        ${id}
      {% endif %};;
    }

}
