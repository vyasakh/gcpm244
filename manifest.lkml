project_name: "0_vysakh_thelook"

constant: vis_id {
  value: "default_id"
  export: override_optional
}
constant: vis_label {
  value: "default_label"
  export: override_optional
}
visualization: {
  id: "@{vis_id}"
  label: "@{vis_label}"
  url: "https://github.com/looker-open-source/viz-collapsible_tree-marketplace/blob/master/webpack.config.js"
  #sri_hash: "my_sri_hash"
  dependencies: []
}
