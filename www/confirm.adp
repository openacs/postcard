<master>

<h1>Confirm Your Message</h1>
<p>
<center>
<img src=postcard-picture?image_id=@image_id@>
<p>
<form action=send-card method=post>
<%= [export_form_vars image_id] %>
<%= [export_form_vars recipient] %>
<%= [export_form_vars sender] %>
<%= [export_form_vars subject] %>
<%= [export_form_vars message] %>
<%= [export_form_vars card_id] %>


<table>
  <tr>
     <td align=right>
     To: @recipient@
     </td>
  </tr>
  <tr>
     <td align=right>
     From: @sender@
     </td>
  </tr>
  <tr>
     <td align=right>
     Subject: @subject@
     </td>
  </tr>
  <tr>
     <td colspan=2>
     Message:<br>
	    <%
	    regsub -all "\n" $message "<br>" formatted_message
	    adp_puts $formatted_message
	    %>
     </td>
  </tr>
</table>
<input type=submit value=OK>
</form>
</center>
