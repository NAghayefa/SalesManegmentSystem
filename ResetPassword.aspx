<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ResetPassword.aspx.cs" Inherits="SalesManegmentSystem.ResetPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <title>Rest Password</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Raleway:wght@200&family=Roboto+Condensed:wght@300&display=swap');
        body{
            background: linear-gradient(to top, #0000ff 0%, #ff0066 100%);
            background-repeat:no-repeat;
            background-attachment:fixed;
            background-size:cover;
           font-family: 'Raleway', sans-serif;
           
        }
         .button{
            border-color:white;
            background-color:white;
            color:black;
            text-align:center;
        }
         .label{
             color:white;
         }
         .main{
             margin: auto;
             width: 50%;
             border: 3px solid white;
             padding: 10px;
         }
    </style>
</head>
<body>
    <form autocomplete="off" id="form1" runat="server">
        <div class="main">
            <asp:Label CssClass="label" ID="lbl_enteremail" runat="server" Text="Enter email: "></asp:Label>
            <asp:TextBox runat="server" Text ="" ID="tb_email"></asp:TextBox>
            <br/>
            <br/>
            <asp:Button CssClass="button" ID="btn_reset" runat="server" Text="Reset password" Width="202px" OnClick="btn_reset_Click" />
            <br/><asp:Label CssClass="label" ID="lbl_result" runat="server" Text="Result: "></asp:Label>
            
            <br/>
            <br/>
            <asp:Label CssClass="label" ID="lbl_entercode" runat="server" Text="Enter code: " Visible="False"></asp:Label>
            <asp:TextBox runat="server" Text ="" ID="tb_entercode" Visible="False"></asp:TextBox><br/><br />
            <asp:Button CssClass="button" ID="btn_confirm" runat="server" Text="Confirm" Width="202px" OnClick="btn_confirm_Click" Visible="False" />
            <br />
            <br/>
            <asp:Panel ID="panel_newpass" runat="server" Visible="False" >
                <asp:Label CssClass="label" ID="lbl_newpas" runat="server" Text="New Password: "></asp:Label>
                <asp:TextBox runat="server" Text ="" ID="tb_newpass"></asp:TextBox><br/>
                <br />
                <asp:Label CssClass="label" ID="lbl_confirmpass" runat="server" Text="Confirm Password: " ></asp:Label>
                <asp:TextBox runat="server" Text ="" ID="tb_cpass"></asp:TextBox><br/><br />

                 <asp:Button CssClass="button" ID="btn_changepass" runat="server" Text="Change password" Width="202px" OnClick="btn_changepass_Click"/>
            </asp:Panel>
            <br/>

        </div>
    </form>
</body>
</html>
