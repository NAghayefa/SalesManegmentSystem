using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
namespace SalesManegmentSystem
{
    public partial class Products : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public static string conString = "host=localhost;port=3306;user=root;password=12345678;database=sms;";

        protected void btn_buy_Click(object sender, EventArgs e)
        {
            string username = tb_username.Text;
            string sweet = tb_sweet.Text;
            string dress = tb_dress.Text;
            string trousers = tb_tro.Text;
            string casualDress = tb_casual.Text;
            string classicShoes = tb_shoes.Text;
            string sportShoes = tb_Sshoes.Text;

            using (var con = new MySqlConnection(conString))
            {
                
                if (tb_username.Text == string.Empty)
                {
                    lbl_error.Visible = true;
                }
                else
                {
                    con.Open();
                    //string query = $"UPDATE `users` SET sweet=15,dress={dress},trousers={trousers},casualDress={casualDress},classicShoes={classicShoes},sportShoes={sportShoes} WHERE username={username};";
                    string query = "UPDATE `users` SET sweet=@sweet,dress=@dress,trousers=@trousers,casualDress=@casualDress,classicShoes=@classicShoes,sportShoes=@sportShoes WHERE username=@username;";
                    using (var cmd = new MySqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@sweet", sweet);
                        cmd.Parameters.AddWithValue("@dress", dress);
                        cmd.Parameters.AddWithValue("@trousers", trousers);
                        cmd.Parameters.AddWithValue("@casualDress", casualDress);
                        cmd.Parameters.AddWithValue("@classicShoes", classicShoes);
                        cmd.Parameters.AddWithValue("@sportShoes", sportShoes);
                        cmd.Parameters.AddWithValue("@username", username);
                        lbl_info.Visible = true;
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }
                }
                

            }
        }

        protected void btn_logout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("Index.aspx");
        }
    }
}