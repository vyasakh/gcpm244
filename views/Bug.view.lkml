#X# Conversion failed: failed to parse YAML.  Check for pipes on newlines


  view: sql_runner_query {
    derived_table: {
      sql: select current_date() ;;
    }

    measure: count {
      type: count
      drill_fields: [detail*]
    }

    dimension: current_date {
      type: date
      sql: ${TABLE}.`current_date()` ;;
    }

    set: detail {
      fields: [
        current_date
      ]
    }
  }
