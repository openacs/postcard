<?xml version="1.0"?>
<queryset>

<fullquery name="add_message">      
      <querytext>
      
    insert into postcards (card_id, pickup_code, card_picture, recipient, sender, message)
    values (:card_id, :pickup_code, :image_id, :recipient, :sender, :message)

      </querytext>
</fullquery>

 
<fullquery name="select_card_id">      
      <querytext>
      
    select max(card_id) as card_id from postcards

      </querytext>
</fullquery>

 
</queryset>
