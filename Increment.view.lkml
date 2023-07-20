view: increment {
  derived_table: {
    indexes: ["id"]
    increment_key: "created_date"
    increment_offset: 3
    datagroup_trigger: 0_vysakh_thelook_default_datagroup
    explore_source: users {
      column: age {}
      column: id {}
      column: city {}
      column: first_name {}
      column: count {}
      column: created_date {}
    }
  }
  dimension: age {
    description: ""
    type: number
  }

  dimension: id {
    type: number
  }
  dimension: city {
    description: ""
  }
  dimension: first_name {
    description: ""
  }
  dimension: count {
    description: ""
    type: number
  }
  dimension: created_date {
    description: ""
    type: date
  }
}
