# index.tcl

ad_page_contract {
  send a post card

  @author hqm@ai.mit.edu
  @author k_vertigo@yahoo.com
  @creation-date 2000-10-23
  @cvs-id $Id$
} -properties {
  message:onevalue
}


db_multirow images get_all_images {
    select card_image_id, mime_type, title, description
    from postcard_images
    order by card_image_id
}

set message "Select image and send a Card"

