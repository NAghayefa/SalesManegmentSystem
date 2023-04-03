using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
namespace SalesManegmentSystem
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        
        private bool checkForExists(string username, string email, MySqlConnection con)
        {
            string q = "SELECT COUNT(id) FROM users WHERE username = @username OR email = @email;";

            
            using (var cmd = new MySqlCommand(q, con))
            {
                cmd.Parameters.AddWithValue("@username", username);
                cmd.Parameters.AddWithValue("@email", email);
                int count = Convert.ToInt32(cmd.ExecuteScalar());
                return (count > 0) ? true : false;
            }
           

        }

        protected void btn_register_Click(object sender, EventArgs e)
        {
            string result = "Message";
            try
            {
                string fullname = tb_fullname.Text;
                string username = tb_username.Text;
                string email = tb_email.Text;
                string pass = tb_pass.Text;
                string cpass = tb_cpass.Text;

                if (string.IsNullOrWhiteSpace(fullname) || string.IsNullOrWhiteSpace(username) ||
                    string.IsNullOrWhiteSpace(email) || string.IsNullOrWhiteSpace(pass))
                {
                    result = "Empty place!";
                    return;
                }

                if (pass != cpass)
                {
                    result = "Passwords are not same!";
                    return;
                }

               

                string query = "INSERT INTO `users` (fullname, email, username, pass) VALUES (" +
                    "@fullname, @email, @username, @pass)";

                using (var con = new MySqlConnection(Index.conString))
                {
                    con.Open();
                    if (checkForExists(username, email, con))
                    {
                       
                        result = "Username or Email already exists! Please choose another one!";
                        con.Close();
                        return;
                    }
                    else
                        result = "if not work";

                    using (var cmd = new MySqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@fullname", fullname);
                        cmd.Parameters.AddWithValue("@email", email);
                        cmd.Parameters.AddWithValue("@username", username);
                        cmd.Parameters.AddWithValue("@pass", pass);

                        cmd.ExecuteNonQuery();
                    }
                    con.Close();
                }
                result = "Successfully register! Now you can login!";
            }
            catch
            {
                result = "Could not register! Please try again later!";
            }
            finally
            {
                lbl_error.Text = result;
            }
        }
    }
}