# dump-card.tcl

ad_page_contract {
  send a post card

  @author hqm@ai.mit.edu
  @creation-date 2000-10-23
  @cvs-id $Id$
} -properties {
  message:onevalue
}

db_multirow cards cards {
    select card_id, card_picture, recipient, sender, message
    from postcards
    order by card_id
}
