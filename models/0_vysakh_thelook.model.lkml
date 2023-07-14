connection: "thelook"

# include all the views
include: "/views/**/*.view.lkml"
#include: "/sql_runner_query.view.lkml"
datagroup: 0_vysakh_thelook_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}
explore: sql_runner_query {}
#test2



access_grant: One {
  user_attribute: grant
  allowed_values: ["1"]
}
access_grant: two {
  user_attribute: grant
  allowed_values: ["2"]
}
access_grant: Three {
  user_attribute: grant
  allowed_values: ["3"]
}

access_grant: four {
  user_attribute: grant
  allowed_values: ["4"]
}
  #Hello Ragha

# datagroup: new_schedule_check2 {
#   sql_trigger: SELECT *,
#   (CASE
#   WHEN current_date < '2023-07-04' THEN "hi"
#   ELSE
#   CASE
#   WHEN EXTRACT(HOUR FROM CURRENT_TIMESTAMP) ='10' THEN  "ho"
#   ELSE "hi"
#   END
#   END);;
# }

persist_with: 0_vysakh_thelook_default_datagroup

explore: account {}

explore: employees {}

explore: events {
  join: users {
    type: left_outer
    sql_on: ${events.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

explore: pagination {}

explore: flights {
  always_filter: {
    filters: [flights.arr_date: ""]
  }
}



explore: inventory_items {
  join: products {
    type: left_outer
    sql_on: ${inventory_items.product_id} = ${products.id} ;;
    relationship: many_to_one
  }
}

explore: orders {
  join: users {
    type: left_outer
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

explore: order_items {
  conditionally_filter: {

    unless: [order_items.mtd]


  }
  join: orders {
    type: left_outer
    sql_on: ${order_items.order_id} = ${orders.id} ;;
    relationship: many_to_one
  }

  join: inventory_items {
    type: left_outer
    sql_on: ${order_items.inventory_item_id} = ${inventory_items.id} ;;
    relationship: many_to_one
  }

  join: users {
    type: left_outer
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: many_to_one
  }

  join: products {
    type: left_outer
    sql_on: ${inventory_items.product_id} = ${products.id} ;;
    relationship: many_to_one
  }
}


explore: persons {}


explore: products {}

explore: salary {
  join: dept {
    type: left_outer
    sql_on: ${salary.dept_id} = ${dept.dept_id} ;;
    relationship: many_to_one
  }
}


explore: users {}
