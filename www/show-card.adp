<master>

<img src=postcard-picture?image_id=@image_id@>
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
     <td colspan=2>
     Message:<br>
	    <%
	    regsub -all "\n" $message "<br>" formatted_message
	    adp_puts $formatted_message
	    %>
     </td>
  </tr>
</table>
