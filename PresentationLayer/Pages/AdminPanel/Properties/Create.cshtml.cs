using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using BusinessObjectLayer;
using ServiceLayer.Interfaces;
using BusinessObjectLayer.Model;

namespace PresentationLayer.Pages.Properties
{
    public class CreateModel : PageModel
    {
        private readonly IPropertyService _propertyService;
		private readonly IPropertyCategoryService _propertyCategoryService;


		public CreateModel(IPropertyService propertyService, IPropertyCategoryService propertyCategoryService)
        {
            this._propertyService = propertyService;
            this._propertyCategoryService = propertyCategoryService; 
        }

        public SelectList CategorySelectList { get; set; }

        public IActionResult OnGet()
        {
            var categories = _propertyCategoryService.GetAllPropertyCategories()
                              .Select(c => new PropertyCategoryViewModel
                              {
                                  CategoryId = c.CategoryId,
                                  CategoryName = c.CategoryName
                              });
            CategorySelectList = new SelectList(categories, "CategoryId", "CategoryName");

            return Page();
        }



        [BindProperty]
        public Property Property { get; set; } = default!;

        // For more information, see https://aka.ms/RazorPagesCRUD.
        public async Task<IActionResult> OnPostAsync()
        {
			//if (!ModelState.IsValid)
			//{
			//	// Loop through each error and throw an exception or log it.
			//	foreach (var modelStateEntry in ModelState)
			//	{
			//		foreach (var error in modelStateEntry.Value.Errors)
			//		{
			//			// You can log this error to the console or throw an exception
			//			Console.WriteLine($"Error in {modelStateEntry.Key}: {error.ErrorMessage}");
			//		}
			//	}
			//	return Page();
			//}

			_propertyService.AddProperty(Property);

            return RedirectToPage("./Index");
        }
    }
}
