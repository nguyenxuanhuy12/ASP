using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WEBSITE.Context;

namespace WEBSITE.Controllers
{
    public class CategoryController : Controller
    {
        webBHEntities obj = new webBHEntities();

        // GET: Category
        public ActionResult Index()
        {
            var lstCategory = obj.Category.ToList();
            return View(lstCategory);
        }
        public ActionResult ProductCategory(int Id)
        {
            var listProduct = obj.Product.Where(n => n.CategoryId == Id).ToList();
            return View(listProduct);
        }
    }
}