using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WEBSITE.Context;

namespace WEBSITE.Controllers
{
    public class ProductController : Controller
    {
        webBHEntities obj = new webBHEntities();

        // GET: Product
        public ActionResult Detail(int Id)
        {
            var objProduct = obj.Product.Where(n => n.id == Id).FirstOrDefault();
            return View(objProduct);
        }
    }
}