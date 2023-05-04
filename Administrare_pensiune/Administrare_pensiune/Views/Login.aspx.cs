using Administrare_pensiune.Views.Admin;
using System;
using System.Data;
using System.Runtime.InteropServices;

namespace Administrare_pensiune.Views
{
    public partial class Login : System.Web.UI.Page
    {
        Functions Con;
        protected void Page_Load(object sender, EventArgs e)
        {
            Con = new Functions();

            Session["UserName"] = "";
            Session["UId"] = "";
        }


        protected void LoginBtn_Click(object sender, EventArgs e)
        {
            //Response.Redirect("Admin/Rooms.aspx");


            if (AdminCb.Checked)
            {
                Console.WriteLine("fafa");
                if (UserTb.Value == "Admin" && PasswordTb.Value == "Password")
                {
                    Session["UserName"] = "Admin";
                    Response.Redirect("Admin/Rooms.aspx");
                }
                else
                {
                    ErrMsg.InnerText = "Invalid Admin!";
                }
            }
            else
            {
                //Session["UserName"] = "Admin";
                string Query = "select UId, UName, UPass from UserTable where UName = '{0}' and UPass ='{1}'";
                Query = string.Format(Query, UserTb.Value, PasswordTb.Value);
                DataTable dt = Con.GetData(Query);
                if (dt.Rows.Count == 0)
                {
                    ErrMsg.InnerText = "Invalid User!";
                }
                else
                {
                    Session["UserName"] = dt.Rows[0][1].ToString();
                    Session["UId"] = dt.Rows[0][0].ToString();
                    Response.Redirect("User/Booking.aspx");

                }
            }
        }

        protected void SaveBtn_Click(object sender, EventArgs e)
        {
            try
            {
                string UName = UNameTb.Value;
                string UPhone = PhoneTb0.Value;
                string UGen = GenCb0.SelectedValue;
                string UAdd = AddressTb0.Value;
                string UPass = PasswordTb0.Value;
                string Query = "insert into UserTable values('{0}', '{1}', '{2}', '{3}', '{4}')";
                Query = string.Format(Query, UName, UPhone, UGen, UAdd, UPass);
                Con.setData(Query);
                ErrMsg.InnerText = "User Added!";

                UNameTb.Value = "";
                GenCb0.SelectedIndex = -1; ;
                AddressTb0.Value = "";
                PasswordTb.Value = "";
                PhoneTb0.Value = "";
            }
            catch (Exception Ex)
            {

                ErrMsg.InnerText = Ex.Message;
            }
        }
    }
}