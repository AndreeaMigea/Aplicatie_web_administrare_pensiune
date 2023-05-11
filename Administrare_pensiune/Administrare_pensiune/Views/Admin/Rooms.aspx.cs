using Administrare_pensiune.Views.Admin;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Administrare_pensiune
{
    public partial class Rooms : System.Web.UI.Page
    {
        Functions Con;

        protected void Page_Load(object sender, EventArgs e)
        {
            Con = new Functions();
            ShowRooms();
            GetCategories();
            ShowBookings();
        }
        public override void VerifyRenderingInServerForm(Control control)
        {

        }

        private void ShowRooms()
        {
            string Query = "select * from RoomTable";
            RoomsGV.DataSource = Con.GetData(Query);
            RoomsGV.DataBind();

        }
        private void GetCategories()
        {
            string Query = "Select * from CategoryTable";
            CatCb.DataTextField = Con.GetData(Query).Columns["CatName"].ToString();
            CatCb.DataValueField = Con.GetData(Query).Columns["CatId"].ToString();
            CatCb.DataSource = Con.GetData(Query);
            CatCb.DataBind();
        }
        private void ShowBookings()
        {
            string Query = "select * from BookingTable";
            BookingGV.DataSource = Con.GetData(Query);
            BookingGV.DataBind();

        }

        protected void SaveBtn_Click(object sender, EventArgs e)
        {
            try
            {
                string RName = RNameTb.Value;
                string RCat = CatCb.SelectedValue;
                string RLoc = LocationTb.Value;
                string Cost = CostTb.Value; 
                string priceAtv = PriceAtvTb.Value;
                string priceBicycle = PriceBicycleTb.Value;
                string price3Meal = Price3MealsTb.Value;
                string priceGuide = PriceGuideTb.Value;
                string Rem =  RemarksTb.Value;
                string Status = "Available";
                string Query = "insert into RoomTable values('{0}', '{1}', '{2}', '{3}', '{4}', '{5}', '{6}','{7}','{8}','{9}')";
                Query = string.Format(Query, RName, RCat, RLoc, Cost, Rem, Status, priceAtv, price3Meal, priceGuide, priceBicycle);
                Con.setData(Query);
                ShowRooms();
                ErrMsg.InnerText = "Room Added!";

                RNameTb.Value = "";
                CatCb.SelectedIndex = -1; ;
                LocationTb.Value = "";
                CostTb.Value = "";
                RemarksTb.Value = "";
                ;
            }
            catch (Exception Ex)
            {

                ErrMsg.InnerText = Ex.Message;
            }

        }
        int Key = 0;
        protected void RoomsGV_SelectedIndexChanged(object sender, EventArgs e)   
        {
            Key = Convert.ToInt32(RoomsGV.SelectedRow.Cells[1].Text);
            RNameTb.Value = RoomsGV.SelectedRow.Cells[2].Text;
            CatCb.SelectedValue = RoomsGV.SelectedRow.Cells[3].Text;
            LocationTb.Value = RoomsGV.SelectedRow.Cells[4].Text;
            LocationTb.Value = RoomsGV.SelectedRow.Cells[4].Text;
            CostTb.Value = RoomsGV.SelectedRow.Cells[5].Text;
            RemarksTb.Value = RoomsGV.SelectedRow.Cells[6].Text;
            StatusCb.SelectedValue = RoomsGV.SelectedRow.Cells[7].Text;
        }

        protected void BookingGV_SelectedIndexChanged(object sender, EventArgs e)
        {
            UpdateRoom();

            string Query = "delete from BookingTable where BId = {0}";
            Query = string.Format(Query, BookingGV.SelectedRow.Cells[1].Text);
            Con.setData(Query);
            ShowRooms();
            ShowBookings();
        }
        protected void EditBtn_Click(object sender, EventArgs e)
        {
            
            try
            {
                string RName = RNameTb.Value;
                string RCat = CatCb.SelectedValue.ToString();
                string RLoc = LocationTb.Value;
                string Cost = CostTb.Value;
                string Rem = RemarksTb.Value;
                string Status = StatusCb.SelectedValue.ToString();
                string Query = "update RoomTable set RName='{0}', RCategory='{1}', RLocation= '{2}', RCost= '{3}', RRemarks= '{4}', Status= '{5}' where RId= {6}";
                Query = string.Format(Query, RName, RCat, RLoc, Cost, Rem, Status, RoomsGV.SelectedRow.Cells[1].Text);    
                Con.setData(Query);
                ShowRooms();
                ErrMsg.InnerText = "Room Updated!";

                RNameTb.Value = "";
                CatCb.SelectedIndex = -1; ;
                LocationTb.Value = "";
                CostTb.Value = "";
                RemarksTb.Value = "";
                
            }
            catch (Exception Ex)
            {

                ErrMsg.InnerText = Ex.Message;
            }
            
        }
        private void UpdateRoom()
        {
            try
            {
                string st = "Available";
                string bookingId = BookingGV.SelectedRow.Cells[3].Text;
                string Query = "update RoomTable set Status = '{0}' where RId = {1}";
                Query = string.Format(Query, st,BookingGV.SelectedRow.Cells[3].Text);
                Con.setData(Query);
                ShowRooms();
                //ErrMsg.InnerText = "Room Updated!";
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
               
                string Query = "delete from RoomTable where RId = {0}";
                Query = string.Format(Query, RoomsGV.SelectedRow.Cells[1].Text);
                Con.setData(Query);
                ShowRooms();
                ErrMsg.InnerText = "Room Deleted!";
            }
            catch (Exception Ex)
            {

                ErrMsg.InnerText = Ex.Message;
            }
        }
    }
}