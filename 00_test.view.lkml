view: 00_test {

derived_table: {
  sql: SELECT
  DATE(orders.created_at ) AS created_date,
  orders.id  AS id,
  orders.status  AS status,
  orders.user_id  AS user_id
FROM demo_db.orders  AS orders

ORDER BY DATE(orders.created_at ) DESC
LIMIT 500 ;;
datagroup_trigger: dg_pv_00
#new
indexes: ["id"]
}

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created_at ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id, users.first_name, users.last_name, users.id, order_items.count]
  }
  }
