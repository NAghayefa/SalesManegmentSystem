<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="SalesManegmentSystem.Admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Panel</title>
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
        input{
            border-radius: 10px;
            padding: 5px 5px;
            border-color:white;
        }
        h1,.label{
            color:white;
        }

    </style>
</head>
<body>
    <form autocomplete="off" id="form1" runat="server">
        <div>
           <center> <h1>Welcome Best Admin!</h1>
               <asp:Label CssClass="label" ID="lbl_admin" runat="server" Text="Name"></asp:Label>
               <asp:TextBox ID="tb_aname" runat="server"></asp:TextBox> <br /> <br /> <br />
               <asp:Label CssClass="label" ID="lbl_apass" runat="server" Text="Password"></asp:Label>
               <asp:TextBox TextMode="Password" ID="tb_apass" runat="server"></asp:TextBox> <br />
               <asp:Label ID="lbl_aerror" runat="server" Text="Wrong name or password!" Visible="False" ForeColor="Red"></asp:Label> <br />
               <asp:Button CssClass="abutton" ID="btn_alogin" runat="server" Text="Login" OnClick="btn_alogin_Click" Height="35px" Width="89px" />
           </center>
        </div>
    </form>
</body>
</html>
