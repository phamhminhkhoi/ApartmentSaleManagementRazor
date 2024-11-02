using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using BusinessObjectLayer;
using ServiceLayer.Interfaces;

namespace PresentationLayer.Pages.Properties
{
    public class EditModel : PageModel
    {
        private readonly IPropertyService _propertyService;
        private readonly IPropertyCategoryService _propertyCategoryService;
        public EditModel(IPropertyService propertyService, IPropertyCategoryService propertyCategoryService)
        {
            this._propertyService = propertyService;
            this._propertyCategoryService = propertyCategoryService;
        }

        [BindProperty]
        public Property Property { get; set; } = default!;

        public async Task<IActionResult> OnGetAsync(int id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var property =  _propertyService.GetPropertyById(id);
            if (property == null)
            {
                return NotFound();
            }
            Property = property;
            var category = _propertyCategoryService.GetAllPropertyCategories();
           ViewData["CategoryId"] = new SelectList(category, "CategoryId", "CategoryName");
            return Page();
        }

        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more information, see https://aka.ms/RazorPagesCRUD.
        public async Task<IActionResult> OnPostAsync()
        {
            //if (!ModelState.IsValid)
            //{
            //    return Page();
            //}

            ////_context.Attach(Property).State = EntityState.Modified;

            //try
            //{
            _propertyService.UpdateProperty(Property);

            return RedirectToPage("./Index");
            //}
            //catch (DbUpdateConcurrencyException)
            //{

            //        return NotFound();

            //}

            //return RedirectToPage("./Index");
        }

        //private bool PropertyExists(int id)
        //{
        //    return _context.Properties.Any(e => e.PropertyId == id);
        //}
    }
}
