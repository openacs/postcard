<?xml version="1.0"?>

<queryset>
   <rdbms><type>oracle</type><version>8.1.6</version></rdbms>

<fullquery name="add_picture">      
      <querytext>
      
    insert into postcard_images (card_image_id, image, mime_type, title, description)
    values (postcard_image_seq.nextval, empty_blob(), :mime_type, :title, :description)
    returning image into :1

      </querytext>
</fullquery>

 
</queryset>
