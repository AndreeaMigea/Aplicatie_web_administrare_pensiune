using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Administrare_pensiune;


namespace Administrare_pensiune.Views.Admin
{
    public partial class Categories : System.Web.UI.Page
    {
        //Functions Con;          
                               
        protected void Page_Load(object sender, EventArgs e)
        {
            //Con = new Functions();
            ShowCategories();
            LogedUser.InnerText = Session["UserName"] as string;
        }

        public override void VerifyRenderingInServerForm(Control control)
        {

        }

        //private void ShowCategories()
        //{
        //    string Query = "select CatId as Id, CatName as Categorie, CatRemarks as Detalii from CategoryTable ";
        //    CategoriesGV.DataSource = Con.GetData(Query);
        //    CategoriesGV.DataBind();

        //}
        private void ShowCategories()
        {
            using (var context = new PensiuneAsp2Entities())
            {
                
                CategoriesGV.DataSource = context.CategoryTable.ToList();
                CategoriesGV.DataBind();
            }
        }

        protected void SaveBtn_Click(object sender, EventArgs e)
        {
            //try
            //{
            //    string CatName = CatNameTb.Value;
            //    string Rem = RemarksTb.Value;
            //    string Query = "insert into CategoryTable values('{0}', '{1}')";
            //    Query = string.Format(Query, CatName, Rem);
            //    Con.setData(Query);
            //    ShowCategories();
            //    ErrMsg.InnerText = "Category Added!";
            //}
            //catch (Exception Ex)
            //{

            //    ErrMsg.InnerText = Ex.Message;
            //}
            using (var context = new PensiuneAsp2Entities())
            {
                var cat = new CategoryTable
                {
                    CatName = CatNameTb.Value,
                    CatRemarks = RemarksTb.Value
                };
                context.CategoryTable.Add(cat);
                context.SaveChanges();
                ShowCategories();
                ErrMsg.InnerText = "Category Added!";
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
            //try
            //{
            //    string CatName = CatNameTb.Value;
            //    string Rem = RemarksTb.Value;
            //    string Query = "update CategoryTable set CatName = '{0}', CatRemarks = '{1}' where CatId = {2}";
            //    Query = string.Format(Query, CatName, Rem, CategoriesGV.SelectedRow.Cells[1].Text);
            //    Con.setData(Query);
            //    ShowCategories();
            //    ErrMsg.InnerText = "Category Updated!";
            //}
            //catch (Exception Ex)
            //{

            //    ErrMsg.InnerText = Ex.Message;
            //}
            int id = Convert.ToInt32(CategoriesGV.SelectedRow.Cells[1].Text);
            using (var context = new PensiuneAsp2Entities())
            {
                var cat = context.CategoryTable.FirstOrDefault(c => c.CatId == id);
                if (cat != null)
                {
                    cat.CatName = CatNameTb.Value;
                    cat.CatRemarks = RemarksTb.Value;
                    context.SaveChanges();
                    ShowCategories();
                    ErrMsg.InnerText = "Category Updated!";
                }
            }
        }

        protected void DeleteBtn_Click(object sender, EventArgs e)
        {
            //try
            //{
            //    string CatName = CatNameTb.Value;
            //    string Rem = RemarksTb.Value;
            //    string Query = "delete from CategoryTable where CatId = {0}";
            //    Query = string.Format(Query, CategoriesGV.SelectedRow.Cells[1].Text);
            //    Con.setData(Query);
            //    ShowCategories();
            //    ErrMsg.InnerText = "Category Deleted!";
            //}
            //catch (Exception Ex)
            //{

            //    ErrMsg.InnerText = Ex.Message;
            //}
            int id = Convert.ToInt32(CategoriesGV.SelectedRow.Cells[1].Text);
            using (var context = new PensiuneAsp2Entities())
            {
                var cat = context.CategoryTable.FirstOrDefault(c => c.CatId == id);
                if (cat != null)
                {
                    context.CategoryTable.Remove(cat);
                    context.SaveChanges();
                    ShowCategories();
                    ErrMsg.InnerText = "Category Deleted!";
                }
            }
        }
    }
}