# postcard/add-picture.tcl

ad_page_contract {
    Add a picture for postcard

    @author Henry Minsky (hqm@arsdigita.com)
    @creation-date 6 Nov 2000
    @cvs-id $Id$
} {
}

set user_id    [ad_conn user_id]
set package_id [ad_conn package_id]

permission::require_permission \
    -party_id $user_id \
    -privilege admin \
    -object_id $package_id

set image_id [db_nextval postcard_image_sequence] 


