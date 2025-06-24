using Administrare_pensiune.Views.Admin;
using System;
using System.Linq;
using System.Data;
using System.Runtime.InteropServices;
using Administrare_pensiune;

namespace Administrare_pensiune.Views
{
    public partial class Login : System.Web.UI.Page
    {
        //Functions Con;
        protected void Page_Load(object sender, EventArgs e)
        {
           // Con = new Functions();

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
            //else
            //{
            //    //Session["UserName"] = "Admin";
            //    string Query = "select UId, UName, UPass from UserTable where UName = '{0}' and UPass ='{1}'";
            //    Query = string.Format(Query, UserTb.Value, PasswordTb.Value);
            //    DataTable dt = Con.GetData(Query);
            //    if (dt.Rows.Count == 0)
            //    {
            //        ErrMsg.InnerText = "Invalid User!";
            //    }
            //    else
            //    {
            //        Session["UserName"] = dt.Rows[0][1].ToString();
            //        Session["UId"] = dt.Rows[0][0].ToString();
            //        Response.Redirect("User/Booking.aspx");

            //    }
            //}
            else
            {
                using (var context = new PensiuneAsp2Entities())
                {
                    var user = context.UserTable.FirstOrDefault(u => u.UName.Trim() == UserTb.Value && u.UPass.Trim() == PasswordTb.Value);

                    if (user == null)
                    {
                        ErrMsg.InnerText = "Invalid User!";
                    }
                    else
                    {
                        Session["UserName"] = user.UName.Trim();
                        Session["UId"] = user.UId.ToString();
                        Response.Redirect("User/Booking.aspx");
                    }
                }
            }
        }

        protected void SaveBtn_Click(object sender, EventArgs e)
        {
            try
            {
                using (var context = new PensiuneAsp2Entities())
                {
                    var user = new UserTable
                    {
                        UName = UNameTb.Value,
                        UPhone = PhoneTb0.Value,
                        UGen = GenCb0.SelectedValue,
                        UAdd = AddressTb0.Value,
                        UPass = PasswordTb0.Value
                    };

                    context.UserTable.Add(user);
                    context.SaveChanges();
                    ErrMsg.InnerText = "User Added!";
                }

                // Reset fields
                UNameTb.Value = "";
                GenCb0.SelectedIndex = -1;
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