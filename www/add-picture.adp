<master>

<property name="title">Upload a Photo</property>
<property name="context">"upload photo"</property>

<center>
<form enctype=multipart/form-data method=POST action=add-picture-2>
<h3>Add a picture</h3>
<table border="0" cellpadding="2" cellspacing="2">
 <tr>
  <th>Select Image</th>
  <td><input type=file name=upload_file size=20></td>
 </tr>
 <tr>
  <th>Title</th>
  <td><input type=text name=title size=30></td>
 </tr>
 <tr>
  <th>Description</th>
  <td><textarea name=description rows=5 cols=40></textarea></td>
 </tr>

 <input type=hidden name=image_id value="@image_id@">
</table>
<input type=submit value="Upload">
</form>
</center>

