<?xml version="1.0"?>
<queryset>

<fullquery name="mime_type">      
      <querytext>
      
  select mime_type
    from postcard_images
   where card_image_id = :image_id
      </querytext>
</fullquery>

 
</queryset>
