<?xml version="1.0"?>

<queryset>
   <rdbms><type>postgresql</type><version>7.1</version></rdbms>

<fullquery name="set_date">      
      <querytext>
      
	update postcards
	set picked_up = now()
	where pickup_code = :pickup_code
    
      </querytext>
</fullquery>

 
</queryset>
