<master>

Write your message below
<center>
<img src=postcard-picture?image_id=@image_id@> 
<p>
<form action=confirm method=post>
<%= [export_form_vars image_id] %>
<%= [export_form_vars card_id] %>

<table>
  <tr>
     <td align=right>
     To: (email address)
     <td>
     <input type=text name=recipient>
     </td>
  </tr>
  <tr>
     <td align=right>
     Subject
     <td>
     <input type=text name=subject>
     </td>
  </tr>
  <tr>
     <td colspan=2>
     Message<br>
     <textarea name=message rows=8 cols=64></textarea>
     </td>
  </tr>
</table>
<input type=submit>
</form>
</center>
