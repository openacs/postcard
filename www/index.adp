<master>

@message@

<p>
<table border=0 cellpadding=1 cellspacing=0>
 <tr>
  <td bgcolor=#aaaaaa>
   <multiple name=images>
   <table border=1>
    <tr>
     <td>Title</td>
     <td>@images.title@</td>
    </tr>
    <tr>
     <td>Description</td>
     <td>@images.description@</td>
    </tr>
    <tr>
     <td>Image</td>
     <td>
      <a href="write-card?image_id=@images.card_image_id@"><img src="postcard-picture?image_id=@images.card_image_id@" border=0></a><br>
      Click image to select
    </tr>
   </table>
   </multiple>
  </td>
 </tr>

<if @images:rowcount@ eq 0>
  <tr bgcolor=#eeeeee>
    <td colspan=2 align=center><br>(no images)<br>&nbsp;</td>
  </tr>
</if>
</table>

<p>
<a href="add-picture"> Add a picture</a><br>
