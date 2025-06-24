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
using Administrare_pensiune;

namespace Administrare_pensiune.Views.User
{
    public partial class Booking : System.Web.UI.Page
    {
        //Functions Con;
        protected void Page_Load(object sender, EventArgs e)
        {
            //Con = new Functions();
            //ShowRooms();
            //ShowBookings();
            if (!IsPostBack)
            {
                ShowRooms();
                ShowBookings();
            }


        }
        private void ShowRooms()
        {
            //string St = "Available";
            //string Query = "select RId as Nr, RName as Tip, RRemarks as Facilitati, RCost as PCamera, PretAtv as PATV, PretMasa as P3Mese, PretGhid as PGhid, PretBicicleta as PBicicleta from RoomTable where status = '"+St+"'";
            //RoomsGV.DataSource = Con.GetData(Query);
            //RoomsGV.DataBind();
            using (var context = new PensiuneAsp2Entities())
            {
                var rooms = context.RoomTable
                    .Where(r => r.Status == "Available")
                    .Select(r => new
                    {
                        Nr = r.RId,
                        Tip = r.RName,
                        Facilitati = r.RRemarks,
                        PCamera = r.RCost,
                        PATV = r.PretAtv,
                        P3Mese = r.PretMasa,
                        PGhid = r.PretGhid,
                        PBicicleta = r.PretBicicleta
                    }).ToList();

                RoomsGV.DataSource = rooms;
                RoomsGV.DataBind();
            }

        }

        private void ShowBookings()
        {
            //string agent = Session["UId"] as string;
            //string query = "SELECT * FROM BookingTable WHERE [User Id] = '" + agent + "'";
            //BookingGV.DataSource = Con.GetData(query);
            //BookingGV.DataBind();
            string agent = Session["UId"] as string;
            int uid = int.Parse(agent);

            using (var context = new PensiuneAsp2Entities())
            {
                var bookings = context.BookingTable
                    .Where(b => b.User_Id == uid)
                    .ToList();

                BookingGV.DataSource = bookings;
                BookingGV.DataBind();
            }
        }
        private void PopulateBookingDates(int id)
        {
            //string query = "SELECT DateIn, DateOut FROM BookingTable WHERE BRoom = {0}";
            //query = string.Format(query, id);

            //DataTable bookingsTable = Con.GetData(query);

            //DropDownList1.Items.Clear(); // Clear existing items in the dropdown list

            //foreach (DataRow row in bookingsTable.Rows)
            //{
            //    DateTime dateIn = Convert.ToDateTime(row["DateIn"]);
            //    DateTime dateOut = Convert.ToDateTime(row["DateOut"]);
            //    string bookingDate = dateIn.ToString("dd/MM/yyyy") + " - " + dateOut.ToString("dd/MM/yyyy");

            //    DropDownList1.Items.Add(new ListItem(bookingDate, bookingDate));
            //}
            using (var context = new PensiuneAsp2Entities())
            {
                var bookings = context.BookingTable
                    .Where(b => b.BRoom == id)
                    .Select(b => new { b.DateIn, b.DateOut })
                    .ToList();

                DropDownList1.Items.Clear();
                foreach (var b in bookings)
                {
                    string range = b.DateIn.ToString("dd/MM/yyyy") + " - " + b.DateOut.ToString("dd/MM/yyyy");
                    DropDownList1.Items.Add(new ListItem(range, range));
                }
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
        //private void UpdateRoom2(string bookStat)
        //{
        //    try
        //    {
        //        string BRoom = BookingGV.SelectedRow.Cells[3].Text;
        //        string Query = "update RoomTable set Status = '{0}' where RId = '{1}'";
        //        Query = string.Format(Query, bookStat, BRoom);
        //        Con.setData(Query);
        //        ShowRooms();
        //    }
        //    catch (Exception Ex)
        //    {
        //        //ErrMsg.InnerText = Ex.Message;
        //    }
        //}

        protected void BookingGV_SelectedIndexChanged(object sender, EventArgs e)
        {
            //int key = 0;
            //string Agent = Session["UId"] as string;
            //string uid = BookingGV.SelectedRow.Cells[4].Text;
            //key = Convert.ToInt32(BookingGV.SelectedRow.Cells[3].Text);

            //if (Agent == uid)
            //{
            //    string Query = "delete from BookingTable where BId = {0}";
            //    Query = string.Format(Query, BookingGV.SelectedRow.Cells[1].Text);
            //    Con.setData(Query);
            //    lblInfo.Text = "Rezervare anulata cu succes";

            //    ShowRooms();
            //    ShowBookings();
            //    PopulateBookingDates(key);
            //}
            
            //else
            //{
            //    return;
            //}
            int userId = int.Parse(Session["UId"].ToString());
            int bookingId = int.Parse(BookingGV.SelectedRow.Cells[1].Text);
            int roomId = int.Parse(BookingGV.SelectedRow.Cells[3].Text);
            int bookingUserId = int.Parse(BookingGV.SelectedRow.Cells[4].Text);

            if (userId == bookingUserId)
            {
                using (var context = new PensiuneAsp2Entities())
                {
                    var booking = context.BookingTable.FirstOrDefault(b => b.BId == bookingId);
                    if (booking != null)
                    {
                        context.BookingTable.Remove(booking);

                        var room = context.RoomTable.FirstOrDefault(r => r.RId == booking.BRoom);
                        if (room != null)
                        {
                            room.Status = "Available";
                        }

                        context.SaveChanges();
                    }
                }

                lblInfo.Text = "Rezervare anulată cu succes.";
                lblInfo.Visible = true;

                ShowRooms();
                ShowBookings();
                PopulateBookingDates(roomId);
            }
        }
        //private void UpdateRoom(string bookStat)
        //{
        //    try
        //    {

        //        string Query = "update RoomTable set Status = '{0}' where RId = {1}";
        //        Query = string.Format(Query, bookStat, RoomsGV.SelectedRow.Cells[1].Text);
        //        Con.setData(Query);
        //        ShowRooms();
        //    }
        //    catch (Exception Ex)
        //    {

        //        //ErrMsg.InnerText = Ex.Message;
        //    }
        //}

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

        private bool IsBookingAvailable(int roomId, DateTime inDate, DateTime outDate)
        {
            //string query = "SELECT COUNT(*) FROM BookingTable WHERE BRoom = {0} AND NOT (DateIn > '{2}' OR DateOut < '{1}')";
            //query = string.Format(query, RId, InDate, OutDate);

            //DataTable result = Con.GetData(query);

            //if (result.Rows.Count > 0)
            //{
            //    int count = Convert.ToInt32(result.Rows[0][0]);
            //    return count == 0;
            //}
            //return false;
            using (var context = new PensiuneAsp2Entities())
            {
                return !context.BookingTable
                    .Any(b => b.BRoom == roomId &&
                              !(b.DateIn > outDate || b.DateOut < inDate));
            }
        }
        protected void BookBtn_Click(object sender, EventArgs e)
        {
            try
            {
                //string format = "yyyy-MM-dd";
                //string RId = RoomsGV.SelectedRow.Cells[1].Text;
                //string BDate = System.DateTime.Now.ToString(format);
                //string InDate = DateInTb.Value.ToString();
                //string OutDate = DateOutTb.Value.ToString();
                //string Agent = Session["UId"] as string;

                //if (IsBookingAvailable(RId, InDate, OutDate))
                //{
                //    GetCost();

                //    int Amount = Convert.ToInt32(AmountTb.Value.ToString());
                //    Key = Convert.ToInt32(RoomsGV.SelectedRow.Cells[1].Text);


                //    string Query = "insert into BookingTable values('{0}',{1},'{2}','{3}','{4}',{5})";

                //    Query = string.Format(Query, BDate, RId, Agent, InDate, OutDate, Amount);

                //    Con.setData(Query);
                //    ShowRooms();
                //    PopulateBookingDates(Key);
                //    ShowBookings();
                //    RoomTb.Value = "";
                //    AmountTb.Value = "";
                //    lblInfo.Text = "Camera rezervata cu succes";
                //    lblInfo.Visible = true;
                int roomId = int.Parse(RoomsGV.SelectedRow.Cells[1].Text);
                DateTime dateIn = DateTime.Parse(DateInTb.Value);
                DateTime dateOut = DateTime.Parse(DateOutTb.Value);
                int uid = int.Parse(Session["UId"].ToString());

                if (IsBookingAvailable(roomId, dateIn, dateOut))
                {
                    GetCost();

                    using (var context = new PensiuneAsp2Entities())
                    {
                        var booking = new BookingTable
                        {
                            BDate = DateTime.Now,
                            BRoom = roomId,
                            User_Id = uid,
                            DateIn = dateIn,
                            DateOut = dateOut,
                            Amount = finalPrice
                        };

                        context.BookingTable.Add(booking);

                        var room = context.RoomTable.FirstOrDefault(r => r.RId == roomId);
                        if (room != null)
                        {
                            //room.Status = "Booked";
                        }

                        context.SaveChanges();
                    }

                    ShowRooms();
                    PopulateBookingDates(roomId);
                    ShowBookings();

                    RoomTb.Value = "";
                    AmountTb.Value = "";
                    lblInfo.Text = "Camera rezervată cu succes!";
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
                lblInfo.Text = Ex.Message;
                lblInfo.Visible = true;
                //ErrMsg.InnerText = Ex.Message;
            }
        }
    }
}