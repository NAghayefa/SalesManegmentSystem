<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="SalesManegmentSystem.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register</title>
    <style type="text/css">
        @import url('https://fonts.googleapis.com/css2?family=Raleway:wght@200&family=Roboto+Condensed:wght@300&display=swap');
        body{
            background: linear-gradient(to top, #0000ff 0%, #ff0066 100%);
            background-repeat:no-repeat;
            background-attachment:fixed;
            background-size:cover;
           font-family: 'Raleway', sans-serif;
           
        }
    

        input {
            border-radius: 10px;
            padding: 5px 5px;
            border-color:white;
        }
        .labels {
            color:white;
            display:table-row;
        }
        a{
            text-decoration:none;
        }
         a:link{
            color:white;
        }
         a:visited{
             color:white;
         }
        a:active{
            color:blue;
        }
        a:enabled{
            color:blue;
        }
        h1{
            color:black;
        }
        main{
            display:inline-block;
            height: 200px;
            width: 50%;
        }
    </style>
</head>
<body>
    <form autocomplete="off" id="form1" runat="server">
        <div class="main" >
            <center>
                <h1 style="color:white">Register</h1>
                <asp:Label CssClass="labels" ID="lbl_fullname" runat="server" Text="Enter fullname"></asp:Label>
                <asp:TextBox ID="tb_fullname" runat="server"></asp:TextBox>
                <br />
                <asp:Label CssClass="labels" ID="lbl_email" runat="server" Text="Enter email"></asp:Label>
                <asp:TextBox ID="tb_email" TextMode="Email" runat="server"></asp:TextBox>
                 <br />
                <asp:Label CssClass="labels" ID="lbl_username" runat="server" Text="Enter username"></asp:Label>
                <asp:TextBox ID="tb_username" runat="server"></asp:TextBox>
                 <br />
                <asp:Label CssClass="labels" ID="lbl_pass" runat="server" Text="Enter password"></asp:Label>
                <asp:TextBox ID="tb_pass" TextMode="password" runat="server"></asp:TextBox>
                 <br />
                <asp:Label CssClass="labels" ID="lbl_confirm" runat="server" Text="Confirm password"></asp:Label>
                <asp:TextBox ID="tb_cpass" TextMode="password"  runat="server"></asp:TextBox>
                 <br /> <br />
                <asp:Button ID="btn_register" runat="server" Text="Register" OnClick="btn_register_Click"  />
                  <br />
                 <asp:Label ID="lbl_error" runat="server" Text="" ForeColor="Red" Visible="True"></asp:Label> <br />
                <asp:Label ID="lbl_msg" CssClass="labels" runat="server" Text="Label">You already have account?</asp:Label> <a href="Index.aspx" > Login </a> 
            </center>
        </div>
    </form>
</body>
</html>
