# load-cards.tcl

ad_page_contract {
    Display all cards parsing XML.
    @author Henry Minsky (hqm@arsdigita.com)
    @creation-date 6 Nov 2000
    @cvs-id $Id$
} {
}

apm_load_xml_packages

set xml_data [ns_httpget "http://kiki7/postcard/dump-cards"]

set tree [dom::DOMImplementation parse $xml_data]
#set doc [dom::node cget $tree -firstChild]
set results_node [dom::element getElementsByTagName $tree "cards"]
set cards [dom::element getElementsByTagName $results_node "card"]

proc nodeValue {token} {
    return [dom::node cget [dom::node cget $token -firstChild] -nodeValue]    
}

set page_content ""

foreach card $cards {
    set id [dom::element getAttribute  $card "id"]
    set imageid [dom::element getAttribute  $card "image-id"]
    set recipient [dom::element getAttribute  $card "recipient"]
    set sender [dom::element getAttribute  $card "sender"]

    append page_content  "
<table border=1>
  <tr>
     <td><img src=postcard-picture?image_id=$imageid></td>
  </tr>
  <tr>
     <td align=right>To: $recipient</td>
  </tr>
  <tr>
     <td align=right>From: $sender</td>
  </tr>
  <tr>
     <td colspan=2>Message:<br>[nodeValue $card]</td>
  </tr>
</table>"
}


# element tagName
# element get
# attribute
# getElementsByTagName

doc_return 200 text/html  $page_content

