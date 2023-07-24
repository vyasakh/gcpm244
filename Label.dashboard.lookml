- dashboard: label_test
  title: Label test
  layout: newspaper
  preferred_viewer: dashboards-next
  preferred_slug: sNYX3TscoJAvc0Lgo4yY7r
  elements:
  - title: Label disappear
    name: Label disappear
    model: 0_vysakh_thelook
    explore: order_items
    type: looker_column
    fields: [users.age, users.first_name, users.count, users.hyper]
    filters: {}
    sorts: [users.count desc 0]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    x_axis_zoom: true
    y_axis_zoom: true
    series_labels:
      users.count: Hello
      users.hyper: Hii
    hidden_pivots: {}
    defaults_version: 1
    listen:
      Returned Year: order_items.returned_year
    row: 0
    col: 0
    width: 24
    height: 12
  filters:
  - name: Returned Year
    title: Returned Year
    type: field_filter
    default_value: 18 years
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: 0_vysakh_thelook
    explore: order_items
    listens_to_filters: []
    field: order_items.returned_year
