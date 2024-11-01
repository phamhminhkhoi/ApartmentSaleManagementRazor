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
    public class IndexModel : PageModel
    {
        private readonly IPropertyService _propertyService;

        public IndexModel(IPropertyService propertyService)
        {
            _propertyService = propertyService;
        }

        public IList<Property> Property { get;set; } = default!;

        public async Task OnGetAsync()
        {
            if(_propertyService.GetAllProperties() != null)
            {
                Property = _propertyService.GetAllProperties();
            }
        }
    }
}
