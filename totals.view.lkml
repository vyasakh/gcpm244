view: totals {

  derived_table: {
    explore_source: orders {
      column: field1 {field:orders.sum}
      derived_column: totalcalc {
        sql: SUM(field1) OVER() ;;
      }
    }
  }
  }
