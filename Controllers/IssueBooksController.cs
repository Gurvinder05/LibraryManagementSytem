using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using LibraryManagementSytem.BusinessLayer;

namespace LibraryManagementSytem.Controllers
{
    public class IssueBooksController : Controller
    {
        private readonly LabiraryDbContext _context;

        public IssueBooksController(LabiraryDbContext context)
        {
            _context = context;
        }

        // GET: IssueBooks
        public async Task<IActionResult> Index()
        {
            var labiraryDbContext = _context.IssueBooks.Include(i => i.Books).Include(i => i.Students);
            return View(await labiraryDbContext.ToListAsync());
        }

        // GET: IssueBooks/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var issueBook = await _context.IssueBooks
                .Include(i => i.Books)
                .Include(i => i.Students)
                .FirstOrDefaultAsync(m => m.IssueId == id);
            if (issueBook == null)
            {
                return NotFound();
            }

            return View(issueBook);
        }

        // GET: IssueBooks/Create
        public IActionResult Create()
        {
            ViewData["BookId"] = new SelectList(_context.Books, "BookId", "Title");
            ViewData["StudentId"] = new SelectList(_context.Students, "StudentId", "Name");
            return View();
        }

        // POST: IssueBooks/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("IssueId,BookId,StudentId,IssueDate")] IssueBook issueBook)
        {
            if (ModelState.IsValid)
            {
                _context.Add(issueBook);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["BookId"] = new SelectList(_context.Books, "BookId", "Title", issueBook.BookId);
            ViewData["StudentId"] = new SelectList(_context.Students, "StudentId", "Name", issueBook.StudentId);
            return View(issueBook);
        }

        // GET: IssueBooks/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var issueBook = await _context.IssueBooks.FindAsync(id);
            if (issueBook == null)
            {
                return NotFound();
            }
            ViewData["BookId"] = new SelectList(_context.Books, "BookId", "Title", issueBook.BookId);
            ViewData["StudentId"] = new SelectList(_context.Students, "StudentId", "Name", issueBook.StudentId);
            return View(issueBook);
        }

        // POST: IssueBooks/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("IssueId,BookId,StudentId,IssueDate")] IssueBook issueBook)
        {
            if (id != issueBook.IssueId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(issueBook);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!IssueBookExists(issueBook.IssueId))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }
            ViewData["BookId"] = new SelectList(_context.Books, "BookId", "Title", issueBook.BookId);
            ViewData["StudentId"] = new SelectList(_context.Students, "StudentId", "Name", issueBook.StudentId);
            return View(issueBook);
        }

        // GET: IssueBooks/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var issueBook = await _context.IssueBooks
                .Include(i => i.Books)
                .Include(i => i.Students)
                .FirstOrDefaultAsync(m => m.IssueId == id);
            if (issueBook == null)
            {
                return NotFound();
            }

            return View(issueBook);
        }

        // POST: IssueBooks/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var issueBook = await _context.IssueBooks.FindAsync(id);
            _context.IssueBooks.Remove(issueBook);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool IssueBookExists(int id)
        {
            return _context.IssueBooks.Any(e => e.IssueId == id);
        }
    }
}
