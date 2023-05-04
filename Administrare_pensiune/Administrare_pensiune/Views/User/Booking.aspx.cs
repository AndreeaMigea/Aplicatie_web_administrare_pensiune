using Administrare_pensiune.Views.Admin;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace Administrare_pensiune.Views.User
{
    public partial class Booking : System.Web.UI.Page
    {
        Functions Con;
        protected void Page_Load(object sender, EventArgs e)
        {
            Con = new Functions();
            ShowRooms();
            ShowBookings();
        }
        private void ShowRooms()
        {
            string St = "Available";
            string Query = "select RId as Id, RName as Name, RCategory as categories, RCost as Cost, Status as Status from RoomTable where status = '"+St+"'";
            RoomsGV.DataSource = Con.GetData(Query);
            RoomsGV.DataBind();

        }

        private void ShowBookings()
        {
            string Query = "select BDate, BRoom, DateIn, DateOut, Amount from BookingTable";
            BookingGV.DataSource = Con.GetData(Query);
            BookingGV.DataBind();

        }

        int Key = 0;
        int Days = 1;
        protected void RoomsGV_SelectedIndexChanged(object sender, EventArgs e)
        {
            Key = Convert.ToInt32(RoomsGV.SelectedRow.Cells[1].Text);
            RoomTb.Value = RoomsGV.SelectedRow.Cells[2].Text;
            int Cost = Days * Convert.ToInt32(RoomsGV.SelectedRow.Cells[4].Text);
            AmountTb.Value = Cost.ToString();
        }

        private void UpdateRoom()
        {
            try
            {
                string st = "Booked";
                string Query = "update RoomTable set Status = '{0}' where RId = {1}";
                Query = string.Format(Query, st, RoomsGV.SelectedRow.Cells[1].Text);
                Con.setData(Query);
                ShowRooms();
                //ErrMsg.InnerText = "Room Updated!";
            }
            catch (Exception Ex)
            {

                ErrMsg.InnerText = Ex.Message;
            }
        }

        int TCost;
        private void GetCost()
        {
            DateTime DIn = Convert.ToDateTime(DateInTb.Value);
            DateTime DOut = Convert.ToDateTime(DateInTb.Value);
            TimeSpan value = DOut.Subtract(DIn);
            TCost = Convert.ToInt32(value.ToString().Substring(0,2)) * Convert.ToInt32(RoomsGV.SelectedRow.Cells[4].Text);
            AmountTb.Value = TCost.ToString();
        }


        protected void BookBtn_Click(object sender, EventArgs e)
        {
            try
            {
                string format = "yyyy-MM-dd";
                string RId = RoomsGV.SelectedRow.Cells[1].Text;
                string BDate = System.DateTime.Now.ToString(format);
                string InDate = DateInTb.Value.ToString();
                string OutDate = DateOutTb.Value.ToString();
                string Agent = Session["UId"] as string;

                GetCost();

                int Amount = Convert.ToInt32(AmountTb.Value.ToString());

                string Query = "insert into BookingTable values('{0}',{1},'{2}','{3}','{4}',{5})";

                Query = string.Format(Query, BDate, RId, Agent, InDate, OutDate, Amount);

                Con.setData(Query);
                UpdateRoom();
                ShowRooms();
                
                ErrMsg.InnerText = "Room Booked!";
                ShowBookings();
                RoomTb.Value = "";
                AmountTb.Value = "";

            }
            catch (Exception Ex)
            {

                ErrMsg.InnerText = Ex.Message;
            }
        }
    }
}