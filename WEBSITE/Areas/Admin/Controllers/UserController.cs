using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WEBSITE.Context;

namespace WEBSITE.Areas.Admin.Controllers
{
    public class UserController : Controller
    {
        webBHEntities obj = new webBHEntities();
        // GET: Admin/User
        public ActionResult Index()
        {
            return View(obj.Users.ToList());
        }

        [HttpGet]
        public ActionResult Create()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Create(Users objUsers)
        {
            try
            {
                if (objUsers.ImageUpload != null)
                {
                    string fileName = Path.GetFileNameWithoutExtension(objUsers.ImageUpload.FileName);
                    string extension = Path.GetExtension(objUsers.ImageUpload.FileName);
                    fileName = fileName + "_" + long.Parse(DateTime.Now.ToString("yyyyMMddhhmmss")) + extension;
                }
                obj.Users.Add(objUsers);
                obj.SaveChanges();
                return RedirectToAction("Index");

            }

            catch (Exception)
            {
                return RedirectToAction("Index");
            }

        }

        [HttpGet]
        public ActionResult Details()
        {
            var objUser = obj.Users.FirstOrDefault();
            return View(objUser);
        }

        [HttpGet]
        public ActionResult Edit()
        {
            var objUser = obj.Users.FirstOrDefault();
            return View(objUser);
        }

        [HttpPost]
        public ActionResult Edit(Users objUser)
        {

            if (objUser.ImageUpload != null)
            {
                string fileName = Path.GetFileNameWithoutExtension(objUser.ImageUpload.FileName);
                string extension = Path.GetExtension(objUser.ImageUpload.FileName);
                fileName = fileName + "_" + long.Parse(DateTime.Now.ToString("yyyyMMddhhmmss")) + extension;
                objUser.ImageUpload.SaveAs(Path.Combine(Server.MapPath("~/Content/images/"), fileName));
            }
            obj.Entry(objUser).State = System.Data.Entity.EntityState.Modified;
            obj.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult Delete(int Id)
        {
            var kh = obj.Users.FirstOrDefault(p => p.idUser == Id);
            obj.Users.Remove(kh);
            obj.SaveChanges();
            return RedirectToAction("Index");
        }

    }
}