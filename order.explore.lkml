include: "/testing.view.lkml"
include: "/views/order_items.view.lkml"

explore: testing{

 conditionally_filter: {
   filters: [testing.returned_year: "18 years"]
  unless: [id,mtd]
 }

}
