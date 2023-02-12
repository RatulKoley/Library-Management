using project.Models;
using System;
using System.Data.Entity;
using System.Linq;
using System.Web.Mvc;

namespace project.Controllers
{
    public class AdminController : Controller
    {
        libraryprojectEntities db = new libraryprojectEntities();
        // GET: Admin
        public ActionResult Index()
        {
            string d = Convert.ToString(Session["UserName"]);
            ViewBag.Message = d + " ,Welcome Back Admin";
            var result = db.Customer.ToList();

            return View(result);
        }
        public ActionResult Create(int id = 0)
        {
            Customer c1 = new Customer();
            return View(c1);
        }

        // POST: Customer/Create
        [HttpPost]
        public ActionResult Create(Customer c1)
        {
            var result = db.Customer.Where(test => test.UserName == c1.UserName || test.Email == c1.Email).FirstOrDefault();
            if (result != null)
            {
                ViewBag.Message = "Username/Email already exists";
            }
            else
            {
                db.Customer.Add(c1);
                db.SaveChanges();
                Session["UserName"] = c1.UserName;
                return RedirectToAction("Index");
            }
            return View();
        }
        public ActionResult Edit(int id)
        {
            var result = db.Customer.Where(test => test.Customer_ID == id).FirstOrDefault();
            return View(result);
        }

        // POST: Book/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, Customer b1, FormCollection collection)
        {
            try
            {
                b1.Customer_ID = id;
                db.Entry(b1).State = EntityState.Modified;
                db.SaveChanges();
                // TODO: Add update logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Book/Delete/5
        public ActionResult Delete(int id)
        {
            var result = db.Customer.Where(test => test.Customer_ID == id).FirstOrDefault();
            return View(result);
        }

        // POST: Book/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                var result = db.Customer.Where(test => test.Customer_ID == id).FirstOrDefault();
                db.Customer.Remove(result);
                db.SaveChanges();
                // TODO: Add delete logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
        public ActionResult Details(int id)
        {
            var result = db.Customer.Where(test => test.Customer_ID == id).FirstOrDefault();
            return View(result);
        }
        public ActionResult History(int id)
        {
            var result = db.Borrow.Where(test => test.Customer_ID == id).ToList();
            return View(result);
        }

    }
}