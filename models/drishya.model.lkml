connection: "looker-dcl-data"

include: "/views/*.view.lkml"                # include all views in the views/ folder in this project

explore: order_items {
  join: users {
    type: left_outer
    sql_on: ${users.created_date}=${order_items.returned_date} ;;
    relationship: many_to_many
  }
}
