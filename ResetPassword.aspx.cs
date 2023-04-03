using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SalesManegmentSystem
{
    public partial class ResetPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        Random r = new Random();
        private int generateCode()
        {
            return r.Next(10000, 99999);
        }

        string email = "";
        private bool SendMail()
        {
            try
            {
                string to = tb_email.Text;
                email = to;
                string from = "aghayefanigar@gmail.com";
                string pass = "aghayefa0527";
                int code = generateCode();

                MailMessage mm = new MailMessage();
                mm.To.Add(new MailAddress(to));
                mm.From = new MailAddress(from, "Best Company");
                mm.Subject = "Password Recovery";
                mm.IsBodyHtml = true;
                mm.Body = "Your account recovery code: <b>" + code + "</b>";

                NetworkCredential nc = new NetworkCredential();
                nc.UserName = from;
                nc.Password = pass;

                SmtpClient sc = new SmtpClient();
                sc.Host = "smtp.gmail.com";
                sc.EnableSsl = true;
                sc.Port = 587;
                sc.UseDefaultCredentials = false;
                sc.Credentials = nc;
                sc.DeliveryMethod = SmtpDeliveryMethod.Network;
                sc.Send(mm);
                writeCodeToDatabase(code);

                return true;
            }
            catch { return false; }

        }

        private bool writeCodeToDatabase(int code)
        {
            try
            {
                string query = "INSERT INTO `resetpass` (email, code) VALUES(" +
                    "@email, @code);";
                using (var con = new MySqlConnection(Index.conString))
                {
                    if (con.State != System.Data.ConnectionState.Open)
                        con.Open();

                    using (var cmd = new MySqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@email", email);
                        cmd.Parameters.AddWithValue("@code", code);
                        cmd.ExecuteNonQuery();
                    }
                }
                return true;
            }
            catch
            {
                return false;
            }

        }

        protected void btn_reset_Click(object sender, EventArgs e)
        {
            using (var con = new MySqlConnection(Index.conString))
            {
                if (con.State != System.Data.ConnectionState.Open)
                    con.Open();
                string query = "SELECT COUNT(*) FROM users WHERE email = @email;";
                using (var cmd = new MySqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@email", tb_email.Text.Trim());
                    int count = Convert.ToInt32(cmd.ExecuteScalar());
                    if (count == 1)
                    {
                        if (SendMail())
                        {
                            lbl_result.Text = "Recovery code was sent to your email!";
                            btn_confirm.Visible = lbl_entercode.Visible = tb_entercode.Visible = true;
                        }
                        else
                            lbl_result.Text = "Could not sent recovery code! Please try again!";
                    }
                    else
                        lbl_result.Text = "Result: Email not found!";
                }
            }
        }

        protected void btn_confirm_Click(object sender, EventArgs e)
        {
            string code = tb_entercode.Text.Trim();
            using (var con = new MySqlConnection(Index.conString))
            {
                if (con.State != System.Data.ConnectionState.Open)
                    con.Open();
                string query = "SELECT COUNT(*) FROM resetpass WHERE email = @email AND code = @code;";
                using (var cmd = new MySqlCommand(query, con))
                {
                    email = tb_email.Text;
                    cmd.Parameters.AddWithValue("@email", email);
                    cmd.Parameters.AddWithValue("@code", code);

                    int rowCount = Convert.ToInt32(cmd.ExecuteScalar());
                   
                    if (rowCount == 1)
                    {
                        
                        panel_newpass.Visible = true;
                    }
                    else
                        lbl_result.Text = "The code is not correct! Count: " + rowCount;
                }
            }
        }

        protected void btn_changepass_Click(object sender, EventArgs e)
        {
            string pass = tb_newpass.Text;
            string cpass = tb_cpass.Text;

            if (pass != cpass)
            {
                Response.Write("Passwords don't match");
                return;
            }

            using (var con = new MySqlConnection(Index.conString))
            {
                con.Open();
                string query = "UPDATE `users` SET pass = @pass WHERE email = @email;";
                using (var cmd = new MySqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@pass", pass);
                    cmd.Parameters.AddWithValue("@email", tb_email.Text);
                    int affectedRows = cmd.ExecuteNonQuery();
                    if (affectedRows > 0)
                    {
                        Response.Write("Succesfully changed");
                    }
                    else
                        Response.Write("Not changed password");
                }
            }
        }    }
}