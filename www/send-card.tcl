# send_card.tcl

ad_page_contract {
  send an email message

  @author hqm@ai.mit.edu
  @creation-date 2000-10-23
  @cvs-id $Id$
} {
  card_id:integer,notnull
  image_id:integer,notnull
  recipient:notnull
  subject:notnull
  message:notnull
} -properties {
  recipient:onevalue
  message:onevalue
  url:onevalue
}

ad_require_permission [ad_conn package_id] "postcard_create_card"

set pickup_code [ns_crypt $card_id foobar]

# Don't take the email from the poster. Pull it out of the db instead.
ad_get_user_info
set sender $email

db_transaction {

    db_dml add_message {
	insert into postcards (card_id, pickup_code, card_picture, recipient, sender, message)
	values (:card_id, :pickup_code, :image_id, :recipient, :sender, :message)
    }

    db_0or1row select_card_id {
	select max(card_id) as card_id from postcards
    }

} on_error { # most likely a double click
    ad_returnredirect "."
}


set url "[util_current_location][ad_conn package_url]show-card?pickup_code=$pickup_code"


# If we're doing Japanese, encode the subject line in MIME 7bit ISO-2022-JP

if { [string compare [string tolower [ns_config ns/parameters DefaultCharset ""]] "shift_jis"] == 0} {
    set subject [encoding convertto "iso2022-jp" $subject]
    set subject [ns_uuencode $subject]
    set subject "=?ISO-2022-JP?B?$subject?="
}

set message  "
You have received a postcard from $first_names $last_name ($sender).

You may go to $url to pick up your card!

"
ns_sendmail $recipient $sender $subject $message



