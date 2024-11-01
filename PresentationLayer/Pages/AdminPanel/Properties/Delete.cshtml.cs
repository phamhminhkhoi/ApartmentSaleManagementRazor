using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using BusinessObjectLayer;
using ServiceLayer.Interfaces;

namespace PresentationLayer.Pages.Properties
{
    public class DeleteModel : PageModel
    {
        private readonly IPropertyService _propertyService;

        public DeleteModel(IPropertyService propertyService)
        {
            this._propertyService = propertyService;
        }

        [BindProperty]
        public Property Property { get; set; } = default!;

        public async Task<IActionResult> OnGetAsync(int id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var property = _propertyService.GetPropertyById(id);

            if (property == null)
            {
                return NotFound();
            }
            else
            {
                Property = property;
            }
            return Page();
        }

        public async Task<IActionResult> OnPostAsync(int id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var property = _propertyService.GetPropertyById(id);
            if (property != null)
            {
                Property = property;
                _propertyService.DeleteProperty(Property.PropertyId);    
            }

            return RedirectToPage("./Index");
        }
    }
}
