<?xml version="1.0"?>

<queryset>
   <rdbms><type>postgresql</type><version>7.1</version></rdbms>
 
<fullquery name="add_picture">      
      <querytext>

	insert into postcard_images (card_image_id, mime_type,
	title,	description)
	values (:image_id,  :mime_type, :title, :description )

      </querytext>
</fullquery>

<fullquery name="upload_picture">      
    <querytext>

    update postcard_images
    set lob = [set __lob_id [db_string get_lob_id "select empty_lob()"]]
    where card_image_id = :image_id

    </querytext>
</fullquery>
 </queryset>
