# load-cards.tcl

ad_page_contract {
    Display all cards parsing XML.
    @author Henry Minsky (hqm@arsdigita.com)
    @creation-date 6 Nov 2000
    @cvs-id $Id$
} {
}

package require tdom

set reply [ns_http run "http://kiki7/postcard/dump-cards"]
dom parse -- [dict get $reply body] postcard_doc
set root [$postcard_doc documentElement]
set page_content ""

foreach card [$root selectNodes {/cards/card}] {
    set imageid [ns_urlencode [$card getAttribute image-id]]
    set recipient [ns_quotehtml [$card getAttribute recipient]]
    set sender [ns_quotehtml [$card getAttribute sender]]
    set message [ns_quotehtml [$card text]]

    append page_content "
<table border=1>
  <tr>
     <td><img src=\"postcard-picture?image_id=$imageid\"></td>
  </tr>
  <tr>
     <td align=right>To: $recipient</td>
  </tr>
  <tr>
     <td align=right>From: $sender</td>
  </tr>
  <tr>
     <td colspan=2>Message:<br>$message</td>
  </tr>
</table>"
}

$postcard_doc delete
doc_return 200 text/html $page_content
