# postcard/add-picture.tcl

ad_page_contract {
    Add a picture for postcard

    @author Henry Minsky (hqm@arsdigita.com)
    @creation-date 6 Nov 2000
    @cvs-id $Id$
} {
}

ad_require_permission [ad_conn package_id] "postcard_create_image"

set image_id [db_nextval postcard_image_sequence] 


