# psets/image.tcl

ad_page_contract {
    Put out BLOB image

    @author Henry Minsky (hqm@arsdigita.com)
    @creation-date 6 Nov 2000
    @cvs-id $Id$
} {
    {image_id:integer,notnull}
} 


ReturnHeaders [db_string mime_type {
  select mime_type
    from postcard_images
   where card_image_id = :image_id}]


db_write_blob retrieve_image "
select lob
    from postcard_images
    where card_image_id = :image_id
"


