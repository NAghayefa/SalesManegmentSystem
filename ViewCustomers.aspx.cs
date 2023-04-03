using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
namespace SalesManegmentSystem
{
    public partial class ViewCustomers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public static string conString = "host=localhost;port=3306;user=root;password=12345678;database=sms;";
        protected void btn_view_Click(object sender, EventArgs e)
        {
            string sc = "SELECT * FROM `users` WHERE stat = 0;";
            using (var con = new MySqlConnection(ViewCustomers.conString))
            {
                con.Open();
                using (var cmd = new MySqlCommand(sc,con))
                {
                    MySqlDataReader mdr = cmd.ExecuteReader();
                    Gv_cus.DataSource = mdr;
                    Gv_cus.DataBind();
                }
                con.Close();
            }

        }

        protected void btn_confirm_Click(object sender, EventArgs e)
        {
            string sq = "update users set stat = 1 where stat = 0;";
            using (var con = new MySqlConnection(Index.conString))
            {
                con.Open();
                using (var cmd = new MySqlCommand(sq, con))
                {
                    cmd.ExecuteNonQuery();
                }
                con.Close();
            }
        }
    }
}