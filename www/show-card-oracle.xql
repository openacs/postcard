<?xml version="1.0"?>

<queryset>
   <rdbms><type>oracle</type><version>8.1.6</version></rdbms>

<fullquery name="set_date">      
      <querytext>
      
	update postcards
	set picked_up = sysdate
	where pickup_code = :pickup_code
    
      </querytext>
</fullquery>

 
</queryset>
