<?xml version="1.0"?>

<queryset>
   <rdbms><type>postgresql</type><version>7.1</version></rdbms>

<fullquery name="add_picture">      
      <querytext>
    insert into postcard_images (card_image_id, image, mime_type, title, description)
    values (postcard_image_seq.nextval,
        [set __lob_id [db_string get_id "select empty_lob()"]],
        :mime_type, :title, :description)
      </querytext>
</fullquery>

 
</queryset>
