<master>

<property name="title">Upload a Photo</property>
<property name="context">"upload photo"</property>

<center>
<form enctype=multipart/form-data method=POST action=add-picture-2>
Add a picture<br>
<table border=1>
 <tr>
  <td>Select Image</td>
  <td><input type=file name=upload_file size=20></td>
 </tr>
 <tr>
  <td>Title</td>
  <td><input type=text name=title size=30></td>
 </tr>
 <tr>
  <td>Description</td>
  <td><textarea name=description rows=5 cols=40></textarea></td>
 </tr>

 <input type=hidden name=image_id value="@image_id@">
</table>
<input type=submit value="Upload">
</form>
</center>

