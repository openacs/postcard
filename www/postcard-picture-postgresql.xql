<?xml version="1.0"?>

<queryset>
   <rdbms><type>postgresql</type><version>7.1</version></rdbms>

<fullquery name="select_image">      
      <querytext>
--      FIX ME LOB
        select image
        from postcard_images
        where card_image_id = $image_id

      </querytext>
</fullquery>

 
</queryset>
