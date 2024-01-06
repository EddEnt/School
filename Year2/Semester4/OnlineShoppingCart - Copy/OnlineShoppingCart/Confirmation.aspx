<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Confirmation.aspx.cs" Inherits="OnlineShoppingCart.Confirmation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
    <table class="auto-style1">
        <tr>
            <td><h2>Process Complete!</h2></td>
        </tr>
        <tr>
            <td>Thank you. We will review your request and get back to you in 24 hours.</td>
        </tr>
        <tr>
            <td>Your order details are below:</td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblConfirmation" runat="server" Text="Confirmation Number: "></asp:Label>
                <asp:Label ID="lblConfirmNum" runat="server" Text=" "></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblPrice" runat="server" Text="Price:"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>An email recipt has been sent to: 
                <asp:Label ID="lblEmail" runat="server" Text=" "></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btnLogout" runat="server" Text="Logout" OnClick="btnLogout_Click" />
            </td>
        </tr>
    </table>
    </form>
    </body>
</html>
