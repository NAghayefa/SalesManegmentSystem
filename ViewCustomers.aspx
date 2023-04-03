<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewCustomers.aspx.cs" Inherits="SalesManegmentSystem.ViewCustomers" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Customers</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Raleway:wght@200&family=Roboto+Condensed:wght@300&display=swap');
    body{
            background: linear-gradient(to top, #0000ff 0%, #ff0066 100%);
            background-repeat:no-repeat;
            background-attachment:fixed;
            background-size:cover;
           font-family: 'Raleway', sans-serif;
           
        }
    .abutton{
             border-color:white;
             border-radius:10px;
            background-color:white;
            color:black;
            text-align:center;
        }
    .grid{
        color:white;
    }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button CssClass="abutton" ID="btn_view" runat="server" Text="View Customers" OnClick="btn_view_Click" /> 
        <asp:GridView CssClass="grid" ID="Gv_cus" runat="server"></asp:GridView>
            <asp:Button CssClass="abutton" ID="btn_confirm" runat="server" Text="Confirm" OnClick="btn_confirm_Click" />
        </div>
    </form>
</body>
</html>
