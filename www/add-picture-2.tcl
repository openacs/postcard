# postcard/add-picture-2.tcl

ad_page_contract {
    Add comment

    @author Henry Minsky (hqm@arsdigita.com)
    @creation-date 6 Nov 2000
    @cvs-id $Id$
} {
    upload_file
    {image_id:integer,notnull}
    {title:notnull}
    {description:notnull}
}

set user_id [ad_verify_and_get_user_id]

ad_require_permission [ad_conn package_id] "postcard_create_image"

set tmp_filename [ns_queryget upload_file.tmpfile]

set file_extension [string tolower [file extension $upload_file]]

set file_size [file size $tmp_filename]

# remove the first . from the file extension
regsub "\." $file_extension "" file_extension


set what_aolserver_told_us ""
if { $file_extension == "jpeg" || $file_extension == "jpg" } {
    set mime_type "image/jpeg"
    catch { set what_aolserver_told_us [ns_jpegsize $tmp_filename] }
} elseif { $file_extension == "gif" } {
    set mime_type "image/gif"
    catch { set what_aolserver_told_us [ns_gifsize $tmp_filename] }
}

if { ![empty_string_p $what_aolserver_told_us] && [lindex $what_aolserver_told_us 0] > 10 && [lindex $what_aolserver_told_us 1] > 10 } {
    set original_width [lindex $what_aolserver_told_us 0]
    set original_height [lindex $what_aolserver_told_us 1]
} else {
    set original_width ""
    set original_height ""
}
 
db_transaction {

    db_dml add_picture {
	insert into postcard_images (card_image_id, mime_type,
	       title,	description)
	values (:image_id, 
	       :mime_type, :title, :description )
    } -blob_files [list $tmp_filename]

    db_dml upload_picture {
	update postcard_images
	set image = [set __lob_id [db_string get_lob_id "select empty_lob()"]]
	where card_image_id = :image_id
    } -blob_files [list $tmp_filename]
} on_error {}

ad_returnredirect "."



