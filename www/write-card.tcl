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

ad_require_permission [ad_conn package_id] "postcard_create_card"

set card_id [db_nextval postcard_sequence]

ad_return_template
