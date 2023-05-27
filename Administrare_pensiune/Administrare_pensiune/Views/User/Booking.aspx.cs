using Administrare_pensiune.Views.Admin;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net;
using System.Security.Cryptography;
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
            string Query = "select RId as Nr, RName as Tip, RRemarks as Facilitati, RCost as PCamera, PretAtv as PATV, PretMasa as P3Mese, PretGhid as PGhid, PretBicicleta as PBicicleta from RoomTable where status = '"+St+"'";
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
        private void PopulateBookingDates(int id)
        {
            string query = "SELECT DateIn, DateOut FROM BookingTable WHERE BRoom = {0}";
            query = string.Format(query, id);

            DataTable bookingsTable = Con.GetData(query);

            DropDownList1.Items.Clear(); // Clear existing items in the dropdown list

            foreach (DataRow row in bookingsTable.Rows)
            {
                DateTime dateIn = Convert.ToDateTime(row["DateIn"]);
                DateTime dateOut = Convert.ToDateTime(row["DateOut"]);
                string bookingDate = dateIn.ToString("dd/MM/yyyy") + " - " + dateOut.ToString("dd/MM/yyyy");

                DropDownList1.Items.Add(new ListItem(bookingDate, bookingDate));
            }
           
        }



        int Key = 0;
        int Days = 1;
        protected void RoomsGV_SelectedIndexChanged(object sender, EventArgs e)
        {

            Key = Convert.ToInt32(RoomsGV.SelectedRow.Cells[1].Text);
            RoomTb.Value = RoomsGV.SelectedRow.Cells[2].Text;
            int Cost = Days * Convert.ToInt32(RoomsGV.SelectedRow.Cells[4].Text);
            AmountTb.Value = Cost.ToString();
            PopulateBookingDates(Key);


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
            int key = 0;
            string Agent = Session["UId"] as string;
            string uid = BookingGV.SelectedRow.Cells[4].Text;
            key = Convert.ToInt32(BookingGV.SelectedRow.Cells[3].Text);

            if (Agent == uid)
            {
                string Query = "delete from BookingTable where BId = {0}";
                Query = string.Format(Query, BookingGV.SelectedRow.Cells[1].Text);
                Con.setData(Query);
                lblInfo.Text = "Rezervare anulata cu succes";

                ShowRooms();
                ShowBookings();
                PopulateBookingDates(key);
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


            if (checkBoxMasaInclusa.Checked == true) { addMasa += Convert.ToInt32(RoomsGV.SelectedRow.Cells[6].Text) * Convert.ToInt32(value.TotalDays); }
            if (checkBoxATV.Checked == true) { addAtv += Convert.ToInt32(RoomsGV.SelectedRow.Cells[5].Text) * Convert.ToInt32(value.TotalDays); }
            if (checkBoxBiclicleta.Checked == true) { addBicicleta += Convert.ToInt32(RoomsGV.SelectedRow.Cells[8].Text) * Convert.ToInt32(value.TotalDays); }
            if (checkBoxGhid.Checked == true) { addGhid += Convert.ToInt32(RoomsGV.SelectedRow.Cells[7].Text) * Convert.ToInt32(value.TotalDays); }

            finalPrice = TCost + addMasa + addAtv + addBicicleta + addGhid;
            AmountTb.Value = finalPrice.ToString();

        }

        private bool IsBookingAvailable(string RId, string InDate, string OutDate)
        {
            string query = "SELECT COUNT(*) FROM BookingTable WHERE BRoom = {0} AND NOT (DateIn > '{2}' OR DateOut < '{1}')";
            query = string.Format(query, RId, InDate, OutDate);

            DataTable result = Con.GetData(query);

            if (result.Rows.Count > 0)
            {
                int count = Convert.ToInt32(result.Rows[0][0]);
                return count == 0;
            }
            return false;
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

                if (IsBookingAvailable(RId, InDate, OutDate))
                {
                    GetCost();

                    int Amount = Convert.ToInt32(AmountTb.Value.ToString());
                    Key = Convert.ToInt32(RoomsGV.SelectedRow.Cells[1].Text);


                    string Query = "insert into BookingTable values('{0}',{1},'{2}','{3}','{4}',{5})";

                    Query = string.Format(Query, BDate, RId, Agent, InDate, OutDate, Amount);

                    Con.setData(Query);
                    ShowRooms();
                    PopulateBookingDates(Key);
                    ShowBookings();
                    RoomTb.Value = "";
                    AmountTb.Value = "";
                    lblInfo.Text = "Camera rezervata cu succes";
                    lblInfo.Visible = true;
                }
                else
                {
                    lblInfo.Text = "Camera este rezervata pentru data aleasa!";
                    lblInfo.Visible = true;
                }
            }
            catch (Exception Ex)
            {

                //ErrMsg.InnerText = Ex.Message;
            }
        }
    }
}