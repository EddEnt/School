<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrderPage.aspx.cs" Inherits="OnlineShoppingCart.OrderPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 285px;
        }
        .auto-style3 {
            width: 285px;
            height: 23px;
        }
        .auto-style4 {
            height: 23px;
        }
        .auto-style5 {
            width: 283px;
        }
        .auto-style6 {
            width: 104px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
    <table class="auto-style1">
        <tr>
            <td><h2>Order Page</h2></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblInventory" runat="server" Text="Inventroy"></asp:Label>
            </td>
        </tr>
    </table>
        <table class="auto-style1">
            <tr>
                <td class="auto-style5">
                    <asp:Label ID="lblInventroyList" runat="server" Text="Inventory Listing"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblPrice" runat="server" Text="Price"></asp:Label>
                </td>
            </tr>
        </table>
    <table class="auto-style1">
        <tr>
            <td class="auto-style3">
                <asp:Label ID="lblFirst" runat="server" Text="Item the First"></asp:Label>
            </td>
            <td class="auto-style4">
                <asp:Label ID="Label3" runat="server" Text="$25.00"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">
                <asp:Label ID="lblSecond" runat="server" Text="Item the Second"></asp:Label>
            </td>
            <td>
                <asp:Label ID="Label4" runat="server" Text="$25.00"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">
                <asp:Label ID="lblThird" runat="server" Text="Item the Third"></asp:Label>
            </td>
            <td>
                <asp:Label ID="Label5" runat="server" Text="$10.00"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">
                <asp:Label ID="lblFourth" runat="server" Text="Item the Fourth"></asp:Label>
            </td>
            <td class="auto-style4">
                <asp:Label ID="Label6" runat="server" Text="$30.00"></asp:Label>
            </td>
        </tr>
    </table>
        <table class="auto-style1">
            <tr>
                <td class="auto-style6">
                    <asp:Label ID="lblProductName" runat="server" Text="Product Name: "></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtProductName" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style6">
                    <asp:Label ID="lblQuantity" runat="server" Text="Quantity: "></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtQuantity" runat="server"></asp:TextBox>
                </td>
            </tr>
        </table>
        <asp:Button ID="btnAddToCart" runat="server" Text="Add" OnClick="btnAddToCart_Click" />
    </form>
    </body>
</html>
