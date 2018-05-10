connection: "thelook"

datagroup: dg_pv_00 {
  sql_trigger: SELECT MAX(created_at) FROM demo_db.orders;;
  max_cache_age: "12 hours"
}
