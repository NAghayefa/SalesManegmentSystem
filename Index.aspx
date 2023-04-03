<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="SalesManegmentSystem.Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Best Sales Management System</title>
    <style>
         @import url('https://fonts.googleapis.com/css2?family=Raleway:wght@200&family=Roboto+Condensed:wght@300&display=swap');
        body{
            background: linear-gradient(to top, #0000ff 0%, #ff0066 100%);
            background-repeat:no-repeat;
            background-attachment:fixed;
            background-size:cover;
           font-family: 'Raleway', sans-serif;
           
        }
        .main {
            color: white;
        }
        .login{
            margin: auto;
            width: 60%;
            padding: 10px;
            align-items:center;
        }
        .button{
            border-color:white;
            background-color:white;
            color:black;
            text-align:center;
        }
        input{
            border-radius: 10px;
            padding: 5px 5px;
            border-color:white;
        }
    </style>
</head>
<body>
    <form autocomplete="off" id="form1" runat="server">
        <div class="main">
            
            <center>
                <h1 class="h1"> Welcome to Best Sales Management System!</h1>
                <h3>For Shopping please Login!</h3>
            </center>
            <div class="login">
             <asp:Label ID="lbl_username" runat="server" Text="Username: "></asp:Label>
             <asp:TextBox ID="tb_username" runat="server" Height="16px" OnTextChanged="tb_username_TextChanged" Width="155px"></asp:TextBox>
              <br /> <br />

             <asp:Label ID="lbl_pass" runat="server" Text="Password: "></asp:Label>
             <asp:TextBox TextMode="Password" ID="tb_pass" runat="server" Height="16px" Width="155px" style="margin-left: 4px"></asp:TextBox>
                
                <asp:Button CssClass="button" ID="btn_login" runat="server" Text="Login" OnClick="btn_login_Click" Height="39px" Width="115px" />
                <asp:Button CssClass="button" ID="btn_forgot" runat="server" Text="Forgot Password" Height="39px" Width="115px" OnClick="btn_forgot_Click" />
               <br />   <asp:Label ID="lbl_error" runat="server" Text="Password or username is not true" Visible="False"></asp:Label>
                <br />
                <asp:Label ID="lbl_register" runat="server" Text="You don't have account? "></asp:Label> 
                <asp:Button CssClass="button" ID="btn_register" runat="server" Text="Register" OnClick="btn_register_Click" />
                <br /><br />
                <asp:Button ID="btn_admin" runat="server" Text="Admin" OnClick="btn_admin_Click" />
            </div>
        </div>
    </form>
</body>
</html>
