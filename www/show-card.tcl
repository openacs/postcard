# show-card.tcl

ad_page_contract {
  show a postcard

  @author hqm@ai.mit.edu
  @creation-date 2000-10-23
  @cvs-id $Id$
} {
  pickup_code:notnull
} -properties {
  image_id:onevalue
  sender:onevalue
  recipient:onevalue
  message:onevalue
}

# Get Record
if ![db_0or1row select_card_id {
    select card_id, card_picture as image_id, recipient, sender, message, picked_up
    from postcards
    where pickup_code = :pickup_code
}] {}


# Set picked_up date
if [empty_string_p $picked_up] {
    db_dml set_date {
	update postcards
	set picked_up = sysdate
	where pickup_code = :pickup_code
    }
}

ad_return_template
