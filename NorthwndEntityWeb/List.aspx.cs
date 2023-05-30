using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NorthwndEntityWeb
{
    public partial class List : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                NORTHWNDEntities db = new NORTHWNDEntities();
                var productList = from x in db.Products
                                  where x.Discontinued == true
                                  select new { ProductID = x.ProductID, ProductName = x.ProductName, CategoryName = x.Categories.CategoryName, ImagePath = "../Images/" + x.ImagePath, UnitPrice = x.UnitPrice };

                rp_productList.DataSource = productList.ToList(); // Verileri List'e dönüştürerek bağla
                rp_productList.DataBind(); // Verileri Repeater kontrolünde göster

                var categoryList = from x in db.Categories
                                   select new { CategoryID = x.CategoryID, CategoryName = x.CategoryName, Description = x.Description, Picture = "../Images/" + x.Picture };
                rp_categoryList.DataSource = categoryList.ToList();
                rp_categoryList.DataBind();
            }
        }
    }
}