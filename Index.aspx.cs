using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
namespace SalesManegmentSystem
{
    public partial class Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] != null)
                Response.Redirect("Products.aspx");
        }
        public static string conString = "host=localhost;port=3306;user=root;password=12345678;database=sms;";

        protected void btn_login_Click(object sender, EventArgs e)
        {   
            string username = tb_username.Text;
            string pass = tb_pass.Text;

            using (var con = new MySqlConnection(conString))
            {
                con.Open();
                string query = "SELECT * FROM users where username = @username AND pass = @pass;";
                var cmd = new MySqlCommand(query, con);
                cmd.Parameters.AddWithValue("@username", username);
                cmd.Parameters.AddWithValue("@pass", pass);
                int id = Convert.ToInt32(cmd.ExecuteScalar());
                if (id > 0)
                {
                    Session["user"] = id;
                    Response.Redirect("Products.aspx");
                }
                else
                    lbl_error.Visible = true;
                con.Close();
            }

            
        }
       

        protected void btn_register_Click(object sender, EventArgs e)
        {
            Response.Redirect("Register.aspx");
        }

        protected void btn_admin_Click(object sender, EventArgs e)
        {
            Response.Redirect("Admin.aspx");
        }

        protected void btn_forgot_Click(object sender, EventArgs e)
        {
            Response.Redirect("ResetPassword.aspx");
        }


        protected void tb_username_TextChanged(object sender, EventArgs e)
        {

        }
    }
}