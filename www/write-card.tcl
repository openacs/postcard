# write-card.tcl

ad_page_contract {
  compose a message

  @author hqm@ai.mit.edu
  @creation-date 2000-10-23
  @cvs-id $Id$
} {
    image_id:integer,notnull
} -properties {
    image_id:onevalue
    image_value:onevalue
}

set user_id    [ad_conn user_id]
set package_id [ad_conn package_id]

permission::require_permission \
    -party_id $user_id \
    -privilege create \
    -object_id $package_id

set card_id [db_nextval postcard_sequence]

set export_vars [export_vars -form {image_id card_id}]
