# confirm.tcl

ad_page_contract {
  confirm a message

  @author hqm@ai.mit.edu
  @creation-date 2000-10-23
  @cvs-id $Id$
} {
  card_id:integer,notnull
  image_id:integer,notnull
  recipient:notnull
  subject:notnull
  message:notnull

} -properties {
  card_id:onevalue
  sender:onevalue  
  recipient:onevalue  
  subject:onevalue
  message:onevalue
}

# Insert a new postcard in the database, set card_id to the card id value
ad_require_permission [ad_conn package_id] "postcard_create_card"
ad_get_user_info
set sender $email

ad_return_template

