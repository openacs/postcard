# postcard/add-picture.tcl

ad_page_contract {
    Add a picture for postcard

    @author Henry Minsky (hqm@arsdigita.com)
    @creation-date 6 Nov 2000
    @cvs-id $Id$
} {
}

ad_require_permission [ad_conn package_id] admin

append page_content [ad_header "Add Comment"]

append page_content "
<center>
<form enctype=multipart/form-data method=POST action=add-picture-2>
Add a picture<br>
<table border=1>
 <tr>
  <td>Select Image</td>
  <td><input type=file name=upload_file size=20></td>
 </tr>
 <tr>
  <td>Title</td>
  <td><input type=text name=title size=30></td>
 </tr>
 <tr>
  <td>Description</td>
  <td><textarea name=description rows=5 cols=40></textarea></td>
 </tr>
</table>
<input type=submit>
</form>
</center>
"
append page_content [ad_footer]


doc_return 200 text/html $page_content



