<?xml version="1.0"?>

<queryset>
   <rdbms><type>oracle</type><version>8.1.6</version></rdbms>

<fullquery name="select_image">      
      <querytext>
      
select image
    from postcard_images
    where card_image_id = $image_id

      </querytext>
</fullquery>

 
</queryset>
