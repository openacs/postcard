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

set user_id    [ad_conn user_id]
set package_id [ad_conn package_id]

permission::require_permission \
    -party_id $user_id \
    -privilege create \
    -object_id $package_id

set export_vars [export_vars -form {image_id recipient subject message card_id}]

# Insert a new postcard in the database, set card_id to the card id value
ad_get_user_info
set sender $email


set formatted_message $message
regsub -all "\n" $message "<br>" formatted_message

