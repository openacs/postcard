<?xml version="1.0"?>

<queryset>
   <rdbms><type>postgresql</type><version>7.3</version></rdbms>

<fullquery name="retrieve_image">      
      <querytext>
        select lob
        from postcard_images
        where card_image_id = :image_id
      </querytext>
</fullquery>

 
</queryset>
