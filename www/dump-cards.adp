<?xml version='1.0' ?>
<cards>
 <multiple name=cards>
  <card id="@cards.card_id@" image-id="@cards.card_picture@" recipient="@cards.recipient@" sender="@cards.sender@"><%= [ns_quotehtml $cards(message)]%></card>
 </multiple>
</cards>
