﻿using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Administrare_pensiune.Views.Admin
{
    public partial class Users : System.Web.UI.Page
    {
        Functions Con;
        protected void Page_Load(object sender, EventArgs e)
        {
            Con = new Functions();
            ShowUsers();
        }
        private void ShowUsers()
        {
            string Query = "select * from UserTable";
            UserGV.DataSource = Con.GetData(Query);
            UserGV.DataBind();

        }

        protected void SaveBtn_Click(object sender, EventArgs e)
        {
            try
            {
                string UName = UNameTb.Value;
                string UPhone = PhoneTb.Value;
                string UGen = GenCb.SelectedValue;
                string UAdd = AddressTb.Value;
                string UPass = PasswordTb.Value;
              
                string Query = "insert into UserTable values('{0}', '{1}', '{2}', '{3}', '{4}')";
                Query = string.Format(Query, UName, UPhone, UGen, UAdd, UPass);
                Con.setData(Query);
                ShowUsers();
                ErrMsg.InnerText = "User Added!";

                UNameTb.Value = "";
                GenCb.SelectedIndex = -1; ;
                AddressTb.Value = "";
                PasswordTb.Value = "";
                PhoneTb.Value = "";
                
            }
            catch (Exception Ex)
            {

                ErrMsg.InnerText = Ex.Message;
            }
        }
        int Key = 0;
        protected void UserGV_SelectedIndexChanged(object sender, EventArgs e)
        {
            Key = Convert.ToInt32(UserGV.SelectedRow.Cells[1].Text);
            UNameTb.Value = UserGV.SelectedRow.Cells[2].Text;
            PhoneTb.Value = UserGV.SelectedRow.Cells[3].Text;
            GenCb.SelectedValue = UserGV.SelectedRow.Cells[4].Text;
            AddressTb.Value = UserGV.SelectedRow.Cells[5].Text;
            PasswordTb.Value = UserGV.SelectedRow.Cells[6].Text;
        }

        protected void EditBtn_Click(object sender, EventArgs e)
        {
            try
            {
                string UName = UNameTb.Value;
                string UPhone = PhoneTb.Value;
                string UGen = GenCb.SelectedValue;
                string UAdd = AddressTb.Value;
                string UPass = PasswordTb.Value;

                string Query = "update UserTable set UName='{0}', UPhone='{1}', UGen='{2}', UAdd='{3}', UPass='{4}' where UId={5}";
                Query = string.Format(Query, UName, UPhone, UGen, UAdd, UPass, UserGV.SelectedRow.Cells[1].Text);
                Con.setData(Query);
                ShowUsers();
                ErrMsg.InnerText = "User Updated!";

                UNameTb.Value = "";
                GenCb.SelectedIndex = -1; ;
                AddressTb.Value = "";
                PasswordTb.Value = "";
                PhoneTb.Value = "";

            }
            catch (Exception Ex)
            {

                ErrMsg.InnerText = Ex.Message;
            }
        }

        protected void DeleteBtn_Click(object sender, EventArgs e)
        {
            try
            {
                string Query = "delete from UserTable where UId = {0}";
                Query = string.Format(Query, UserGV.SelectedRow.Cells[1].Text);
                Con.setData(Query);
                ShowUsers();
                ErrMsg.InnerText = "User Deleted!";

                UNameTb.Value = "";
                GenCb.SelectedIndex = -1; ;
                AddressTb.Value = "";
                PasswordTb.Value = "";
                PhoneTb.Value = "";
            }
            catch (Exception Ex)
            {

                ErrMsg.InnerText = Ex.Message;
            }
        }
    }
}