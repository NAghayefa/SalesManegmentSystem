using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
namespace SalesManegmentSystem
{
    public partial class Admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public static string conString = "host=localhost;port=3306;user=root;password=12345678;database=sms;";
        protected void btn_alogin_Click(object sender, EventArgs e)
        {
            string adminName = tb_aname.Text;
            string adminPass = tb_apass.Text;

            using (var con = new MySqlConnection(conString))
            {
                con.Open();
                string query = "SELECT * FROM admin where adminName = @adminName AND adminPass = @pass;";
                var cmd = new MySqlCommand(query, con);
                cmd.Parameters.AddWithValue("@adminName", adminName);
                cmd.Parameters.AddWithValue("@pass", adminPass);
                int id = Convert.ToInt32(cmd.ExecuteScalar());
                if (id > 0)
                {
                    Session["user"] = id;
                    Response.Redirect("ViewCustomers.aspx");
                }
                else
                    lbl_aerror.Visible = true;
                con.Close();
            }
        }
    }
}