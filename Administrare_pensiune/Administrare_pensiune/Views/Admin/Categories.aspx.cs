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
        }

        public override void VerifyRenderingInServerForm(Control control)
        {

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
                ErrMsg.InnerText = "Category Added!";
            }
            catch (Exception Ex)
            {

                ErrMsg.InnerText = Ex.ToString();
            }
        
        }
    }
}