<h1>{"Register account information"|i18n}</h1>

<form method="post" action={"/shop/register/"|ezurl}>

<table>
<tr>
    <td>First name:</td>
    <td><input type="text" name="FirstName" size="20" /></td>
</tr>
<tr>
    <td>Last name:</td>
    <td><input type="text" name="LastName" size="20" /></td>
<tr>
    <td>E-mail name:</td>
    <td><input type="text" name="EMail" size="20" /></td>
</tr>
<tr>
    <td colspan="2">Address:</td>
</tr>
<tr>
    <td colspan="2">
    <textarea name="Address" cols="50" rows="10" ></textarea>
    </td>
</tr>
</table>

<input type="submit" name="StoreButton" value="Store" />
</form>