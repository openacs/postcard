<master>
<property name="title">Write a card</property>
<property name="context">"write a card"</property>

Write your message below
<center>
<img src=postcard-picture?image_id=@image_id@> 
<p>
<form action=confirm method=post>
@export_vars;noquote@

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
