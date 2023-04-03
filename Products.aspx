<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="SalesManegmentSystem.Products" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Products</title>
     <style> 
              @import url('https://fonts.googleapis.com/css2?family=Raleway:wght@200&family=Roboto+Condensed:wght@300&display=swap');
            body{
                color:white;
                font-family: 'Raleway', sans-serif;
             background: linear-gradient(to left, #ff6699 0%, #ff0000 100%);
            background-repeat:no-repeat;
            background-attachment:fixed;
            background-size:cover;
            }
            .left{
                float:left; 
                width:25%;
                height:300px;
            }
            .middle{
                float:left; 
                width:25%;
                height:300px;
            }
            .last{
                float:right;
                width:25%;
                height:300px;

            }
            .right{
                float:left;
                width:25%;
                height:300px;
            }
          h1{
              text-align:center;
          }
          .button{
            border-color:white;
            background-color:white;
            color:black;
            text-align:center;
        }
          .logout{
            float:right;
            border-color:white;
            background-color:white;
            color:black;
            text-align:center;
          }
        </style> 
</head>
<body>
    <form autocomplete="off" id="form1" runat="server">
        <div>
            <h1>Have a nice shopping, dear customer!<asp:Button CssClass="logout" ID="btn_logout" runat="server" Text="Logout" Height="31px" OnClick="btn_logout_Click" Width="63px" />
              </h1>
          <div class="left">
               <asp:Label  ID="lbl_sweet" runat="server" Text="Sweet: 10$"></asp:Label> <br />
              <asp:Image Width="198px" Height="248px" ImageUrl="~/sweet.jpg" ImageAlign="Left" ID="img_sweet"  runat="server" /><br/>
              <asp:TextBox ID="tb_sweet" runat="server"></asp:TextBox>
          </div>
          <div class="middle" >
                <asp:Label ID="lbl_dress" runat="server" Text="Dress: 50$"></asp:Label> <br />
              <asp:Image Width="198px" Height="248px" ImageAlign="Middle" ImageUrl="~/dress.jpg" ID="img_dress" runat="server" /> <br />
              <asp:TextBox ID="tb_dress" runat="server"></asp:TextBox>
          </div>
          <div class="right">
              <asp:Label ID="lbl_tro" runat="server" Text="Trousers: 15$"></asp:Label> <br />
              <asp:Image Width="198px" Height="248px"  ImageUrl="~/trousers.jpeg" ID="img_tro" runat="server" /> <br />
              <asp:TextBox ID="tb_tro" runat="server"></asp:TextBox>
          </div> 
            <div class="last">
            <asp:Label ID="lbl_buy" runat="server" Text="Please, if you want to buy write size and number of clothes then click Order button"></asp:Label> <br />
                <asp:TextBox ID="tb_username" runat="server"></asp:TextBox><br />
                <asp:Label ID="lbl_error" runat="server" Text="Please, write username." Visible="False"></asp:Label>  <br />
                <asp:Button CssClass="button" ID="btn_buy" runat="server" Text="Order" Height="30px" Width="78px" OnClick="btn_buy_Click" /> <br /> <br />
                <asp:Button CssClass="button" ID="btn_cancel" runat="server" Text="Cancel" Height="30px" Width="78px" /><br /><br />
                <asp:Label ID="lbl_info" runat="server" Visible="False">Great! We take your order!</asp:Label>
        </div>
          <div>
              <div class="left">
                  <asp:Label ID="lbl_casual" runat="server" Text="Casual Dress: 75$"></asp:Label> <br />
                  <asp:Image ImageUrl="~/casual.jpg"  ID="img_casual" runat="server" Height="198px" Width="248px" /> <br />
                  <asp:TextBox ID="tb_casual" runat="server"></asp:TextBox>
              </div>
              <div class="middle">
                  <asp:Label ID="lbl_shoes" runat="server" Text="Classic Shoes: 35$"></asp:Label> <br />
                  <asp:Image ImageUrl="~/shoes.jpg" ID="img_cshoes" runat="server" Height="198px" Width="248px" /><br />
                  <asp:TextBox ID="tb_shoes" runat="server"></asp:TextBox>
              </div>
              <div class="right">
                  <asp:Label ID="lbl_Sshoes" runat="server" Text="Sport Shoes: 65$"></asp:Label> <br />
                  <asp:Image ImageUrl="~/sportshoes.jpg" ID="img_Sshoes" runat="server" Height="198px" Width="248px" /><br />
                  <asp:TextBox ID="tb_Sshoes" runat="server"></asp:TextBox>
              </div>
          </div>
           
        </div>
    </form>
</body>
</html>
