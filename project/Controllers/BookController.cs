using project.Models;
using System.Data.Entity;
using System.Linq;
using System.Web.Mvc;

namespace project.Controllers
{
    public class BookController : Controller
    {
        libraryprojectEntities db = new libraryprojectEntities();
        // GET: Book
        public ActionResult Index()
        {
            var result = db.Book.ToList();
            return View(result);
        }

        // GET: Book/Details/5
        public ActionResult Details(int id)
        {
            var result = db.Book.Where(test => test.Book_ID == id).FirstOrDefault();
            return View(result);
        }

        // GET: Book/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Book/Create
        [HttpPost]
        public ActionResult Create(Book b1)
        {
            try
            {
                db.Book.Add(b1);
                db.SaveChanges();

                // TODO: Add insert logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Book/Edit/5
        public ActionResult Edit(int id)
        {
            var result = db.Book.Where(test => test.Book_ID == id).FirstOrDefault();
            return View(result);
        }

        // POST: Book/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, Book b1, FormCollection collection)
        {
            try
            {
                b1.Book_ID = id;
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
            var result = db.Book.Where(test => test.Book_ID == id).FirstOrDefault();
            return View(result);
        }

        // POST: Book/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                var result = db.Book.Where(test => test.Book_ID == id).FirstOrDefault();
                db.Book.Remove(result);
                db.SaveChanges();
                // TODO: Add delete logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
