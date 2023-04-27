using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Administrare_pensiune.Views.Admin
{
    public partial class Categories : System.Web.UI.Page
    {
        Functions Con;          //;a el e Models.Functions Con pt ca el a creat in filderul Models clasa Functions la mine nu a mers, dc?
                                // dc Functions Con?
        protected void Page_Load(object sender, EventArgs e)
        {
            Con = new Functions();
            ShowCategories();
            LogedUser.InnerText = Session["UserName"] as string;  //apare sus in dreapta id ul celui care e logat de ex la admin apare 502
        }

        public override void VerifyRenderingInServerForm(Control control)
        {

        }
        
        private void ShowCategories()
        {
            string Query = "select CatId as Id, CatName as Categories, CatRemarks as Remarks from CategoryTable ";
            CategoriesGV.DataSource = Con.GetData(Query);
            CategoriesGV.DataBind();

        }

        protected void SaveBtn_Click(object sender, EventArgs e)
        {
            try
            {
                string CatName = CatNameTb.Value;
                string Rem = RemarksTb.Value;
                string Query = "insert into CategoryTable values('{0}', '{1}')";
                Query = string.Format(Query, CatName, Rem);
                Con.setData(Query);
                ShowCategories();
                ErrMsg.InnerText = "Category Added!";
            }
            catch (Exception Ex)
            {

                ErrMsg.InnerText = Ex.Message;
            }
        
        }
        int Key = 0;

        protected void CategoriesGV_SelectedIndexChanged(object sender, EventArgs e)
        {
            Key = Convert.ToInt32(CategoriesGV.SelectedRow.Cells[1].Text);
            CatNameTb.Value = CategoriesGV.SelectedRow.Cells[2].Text;
            RemarksTb.Value = CategoriesGV.SelectedRow.Cells[3].Text;
        }

        protected void Button1_Click(object sender, EventArgs e) //edit
        {
            try
            {
                string CatName = CatNameTb.Value;
                string Rem = RemarksTb.Value;
                string Query = "update CategoryTable set CatName = '{0}', CatRemarks = '{1}' where CatId = {2}";
                Query = string.Format(Query, CatName, Rem, CategoriesGV.SelectedRow.Cells[1].Text);
                Con.setData(Query);
                ShowCategories();
                ErrMsg.InnerText = "Category Updated!";
            }
            catch (Exception Ex)
            {

                ErrMsg.InnerText = Ex.Message;
            }
        }

        protected void DeleteBtn_Click(object sender, EventArgs e) //sa se stearga casutele din stanga catname si remarks si sa fie warning message
        {
            try
            {
                string CatName = CatNameTb.Value;
                string Rem = RemarksTb.Value;
                string Query = "delete from CategoryTable where CatId = {0}";
                Query = string.Format(Query, CategoriesGV.SelectedRow.Cells[1].Text);
                Con.setData(Query);
                ShowCategories();
                ErrMsg.InnerText = "Category Deleted!";
            }
            catch (Exception Ex)
            {

                ErrMsg.InnerText = Ex.Message;
            }
        }
    }
}