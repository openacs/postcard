<?xml version="1.0"?>
<queryset>

<fullquery name="select_card_id">      
      <querytext>
      
    select card_id, card_picture as image_id, recipient, sender, message, picked_up
    from postcards
    where pickup_code = :pickup_code

      </querytext>
</fullquery>

 
</queryset>
