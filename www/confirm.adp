<master>
<property name="title">Confirm</property>
<property name="context">confirm</property>

  <h1>Confirm Your Message</h1>
  <p />
  <center>
    <img src=postcard-picture?image_id=@image_id@ />
      <p />
      <form action=send-card method=post>
        @export_vars;noquote@

        <table>
          <tr>
            <th align=right>To:</th>
            <td>@recipient@</td>
          </tr>
          <tr>
            <th align=right>From:</th>
            <td>@email@</td>
          </tr>
          <tr>
            <th align=right>Subject:</th>
            <td>@subject@</td>
          </tr>
          <tr>
            <th>Message:</th>
            <td>@formatted_message;noquote@</td>
            </td>
          </tr>
        </table>
        <input type=submit value=OK>
      </form>
  </center>
