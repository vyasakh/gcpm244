view: pagination {



  derived_table: {

    sql: select id,status from demo_db.orders
         LIMIT {{number_per_page._parameter_value}}

      OFFSET {{ number_per_page._parameter_value | times: page._parameter_value | minus: number_per_page._parameter_value }}

      ;;

  }



  parameter: page {

    type: number

    default_value: "1"

  }



  parameter: number_per_page {

    default_value: "50"

    type: number

  }

  dimension: status {
    label: "Orders status"
    description: ""
  }
  dimension: id {
    description: ""
    type: number
  }





}
