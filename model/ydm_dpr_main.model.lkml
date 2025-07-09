connection: "rda_analytics"
include: "/views/*.view.lkml"

datagroup: ydm_kol_default_datagroup {
  # interval_trigger: "12 hours"
  max_cache_age: "24 hour"
}

access_grant: project_area {
  user_attribute: project_area
  allowed_values: ["kol", "social", "all", "samsung"]
}

persist_with: ydm_kol_default_datagroup

explore: zocial_eye_message {
  required_access_grants: [project_area]

  join: dpr_kol_budget {
    type: left_outer
    sql_on:  ${zocial_eye_message.kol_channel_key} = ${dpr_kol_budget.kol_channel_key} ;;
    relationship: many_to_one
  }

  join: zocial_eye_message__links {
    view_label: "Zocial Eye Message: Links"
    sql: LEFT JOIN UNNEST(${zocial_eye_message.links}) as zocial_eye_message__links ;;
    relationship: one_to_many
  }
  join: zocial_eye_message__keywords {
    view_label: "Zocial Eye Message: Keywords"
    sql: LEFT JOIN UNNEST(${zocial_eye_message.keywords}) as zocial_eye_message__keywords ;;
    relationship: one_to_many
  }
  join: zocial_eye_message__hashtags {
    view_label: "Zocial Eye Message: Hashtags"
    sql: LEFT JOIN UNNEST(${zocial_eye_message.hashtags}) as zocial_eye_message__hashtags ;;
    relationship: one_to_many
  }
  join: zocial_eye_message__category {
    view_label: "Zocial Eye Message: Category"
    sql: LEFT JOIN UNNEST(${zocial_eye_message.category}) as zocial_eye_message__category ;;
    relationship: one_to_many
  }
  join: zocial_eye_message__meta_tags {
    view_label: "Zocial Eye Message: Meta Tags"
    sql: LEFT JOIN UNNEST(${zocial_eye_message.meta_tags}) as zocial_eye_message__meta_tags ;;
    relationship: one_to_many
  }
  join: zocial_eye_message__sub_keywords {
    view_label: "Zocial Eye Message: Sub Keywords"
    sql: LEFT JOIN UNNEST(${zocial_eye_message.sub_keywords}) as zocial_eye_message__sub_keywords ;;
    relationship: one_to_many
  }
  join: zocial_eye_message__meta_province {
    view_label: "Zocial Eye Message: Meta Province"
    sql: LEFT JOIN UNNEST(${zocial_eye_message.meta_province}) as zocial_eye_message__meta_province ;;
    relationship: one_to_many
  }
  join: zocial_eye_message__text_for_search {
    view_label: "Zocial Eye Message: Text For Search"
    sql: LEFT JOIN UNNEST(${zocial_eye_message.text_for_search}) as zocial_eye_message__text_for_search ;;
    relationship: one_to_many
  }
  join: zocial_eye_message__logo_detections {
    view_label: "Zocial Eye Message: Logo Detections"
    sql: LEFT JOIN UNNEST(${zocial_eye_message.logo_detections}) as zocial_eye_message__logo_detections ;;
    relationship: one_to_many
  }
  join: zocial_eye_message__poster_label_tza {
    view_label: "Zocial Eye Message: Poster Label Tza"
    sql: LEFT JOIN UNNEST(${zocial_eye_message.poster_label_tza}) as zocial_eye_message__poster_label_tza ;;
    relationship: one_to_many
  }
  join: zocial_eye_message__links_for_search {
    view_label: "Zocial Eye Message: Links For Search"
    sql: LEFT JOIN UNNEST(${zocial_eye_message.links_for_search}) as zocial_eye_message__links_for_search ;;
    relationship: one_to_many
  }
  join: zocial_eye_message__exclude_keywords {
    view_label: "Zocial Eye Message: Exclude Keywords"
    sql: LEFT JOIN UNNEST(${zocial_eye_message.exclude_keywords}) as zocial_eye_message__exclude_keywords ;;
    relationship: one_to_many
  }
  join: zocial_eye_message__deleted_category {
    view_label: "Zocial Eye Message: Deleted Category"
    sql: LEFT JOIN UNNEST(${zocial_eye_message.deleted_category}) as zocial_eye_message__deleted_category ;;
    relationship: one_to_many
  }
  join: zocial_eye_message__account_label_tza {
    view_label: "Zocial Eye Message: Account Label Tza"
    sql: LEFT JOIN UNNEST(${zocial_eye_message.account_label_tza}) as zocial_eye_message__account_label_tza ;;
    relationship: one_to_many
  }
  join: zocial_eye_message__system_label_text {
    view_label: "Zocial Eye Message: System Label Text"
    sql: LEFT JOIN UNNEST(${zocial_eye_message.system_label_text}) as zocial_eye_message__system_label_text ;;
    relationship: one_to_many
  }
  join: zocial_eye_message__meta_user_mention {
    view_label: "Zocial Eye Message: Meta User Mention"
    sql: LEFT JOIN UNNEST(${zocial_eye_message.meta_user_mention}) as zocial_eye_message__meta_user_mention ;;
    relationship: one_to_many
  }
  join: zocial_eye_message__meta_news_sections {
    view_label: "Zocial Eye Message: Meta News Sections"
    sql: LEFT JOIN UNNEST(${zocial_eye_message.meta_news_sections}) as zocial_eye_message__meta_news_sections ;;
    relationship: one_to_many
  }
  join: zocial_eye_message__system_label_image {
    view_label: "Zocial Eye Message: System Label Image"
    sql: LEFT JOIN UNNEST(${zocial_eye_message.system_label_image}) as zocial_eye_message__system_label_image ;;
    relationship: one_to_many
  }
  join: zocial_eye_message__poster_label_categories {
    view_label: "Zocial Eye Message: Poster Label Categories"
    sql: LEFT JOIN UNNEST(${zocial_eye_message.poster_label_categories}) as zocial_eye_message__poster_label_categories ;;
    relationship: one_to_many
  }
  join: zocial_eye_message__account_label_categories {
    view_label: "Zocial Eye Message: Account Label Categories"
    sql: LEFT JOIN UNNEST(${zocial_eye_message.account_label_categories}) as zocial_eye_message__account_label_categories ;;
    relationship: one_to_many
  }

}
