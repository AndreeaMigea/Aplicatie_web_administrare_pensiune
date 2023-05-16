using Administrare_pensiune.Views.Admin;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
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
            string Query = "select RId as Id, RName as Tip, RRemarks as Facilitati, RCost as PCamera, Status as Status, PretAtv as PATV, PretMasa as P3Mese, PretGhid as PGhid, PretBicicleta as PBicicleta from RoomTable where status = '" + St + "'";
            RoomsGV.DataSource = Con.GetData(Query);
            RoomsGV.DataBind();

        }

        private void ShowBookings()
        {
            string agent = Session["UId"] as string;
            string query = "SELECT * FROM BookingTable WHERE [User Id] = '" + agent + "'";
            BookingGV.DataSource = Con.GetData(query);
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
        private void UpdateRoom2(string bookStat)
        {
            try
            {
                string BRoom = BookingGV.SelectedRow.Cells[3].Text;
                string Query = "update RoomTable set Status = '{0}' where RId = '{1}'";
                Query = string.Format(Query, bookStat, BRoom);
                Con.setData(Query);
                ShowRooms();
            }
            catch (Exception Ex)
            {
                //ErrMsg.InnerText = Ex.Message;
            }
        }

        protected void BookingGV_SelectedIndexChanged(object sender, EventArgs e)
        {
            string Agent = Session["UId"] as string;
            string uid = BookingGV.SelectedRow.Cells[4].Text;
            if (Agent == uid)
            {
                string Query = "delete from BookingTable where BRoom = {0}";
                Query = string.Format(Query, BookingGV.SelectedRow.Cells[3].Text);
                Con.setData(Query);
                UpdateRoom2("Available");

                ShowRooms();
                ShowBookings();
            }
            else
            {
                return;
            }
        }
        private void UpdateRoom(string bookStat)
        {
            try
            {

                string Query = "update RoomTable set Status = '{0}' where RId = {1}";
                Query = string.Format(Query, bookStat, RoomsGV.SelectedRow.Cells[1].Text);
                Con.setData(Query);
                ShowRooms();
            }
            catch (Exception Ex)
            {

                //ErrMsg.InnerText = Ex.Message;
            }
        }

        int TCost;
        int addAtv = 0, addMasa = 0, addBicicleta = 0, addGhid = 0;

        int finalPrice;
        private void GetCost()
        {
            DateTime DIn = Convert.ToDateTime(DateInTb.Value);
            DateTime DOut = Convert.ToDateTime(DateOutTb.Value);
            TimeSpan value = DOut.Subtract(DIn);
            TCost = Convert.ToInt32(value.TotalDays) * Convert.ToInt32(RoomsGV.SelectedRow.Cells[4].Text);


            if (checkBoxMasaInclusa.Checked == true) { addMasa += Convert.ToInt32(RoomsGV.SelectedRow.Cells[7].Text) * Convert.ToInt32(value.TotalDays); }
            if (checkBoxATV.Checked == true) { addAtv += Convert.ToInt32(RoomsGV.SelectedRow.Cells[6].Text) * Convert.ToInt32(value.TotalDays); }
            if (checkBoxBiclicleta.Checked == true) { addBicicleta += Convert.ToInt32(RoomsGV.SelectedRow.Cells[9].Text) * Convert.ToInt32(value.TotalDays); }
            if (checkBoxGhid.Checked == true) { addGhid += Convert.ToInt32(RoomsGV.SelectedRow.Cells[8].Text) * Convert.ToInt32(value.TotalDays); }

            finalPrice = TCost + addMasa + addAtv + addBicicleta + addGhid;
            AmountTb.Value = finalPrice.ToString();

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
                UpdateRoom("Booked");
                ShowRooms();

                ShowBookings();
                RoomTb.Value = "";
                AmountTb.Value = "";

            }
            catch (Exception Ex)
            {

                //ErrMsg.InnerText = Ex.Message;
            }
        }
    }
}