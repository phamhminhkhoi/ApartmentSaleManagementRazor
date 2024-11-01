using System;
using System.Collections.Generic;
using System.Linq;
using Microsoft.EntityFrameworkCore;
using BusinessObjectLayer;

namespace DataAccessLayer
{
    public class PropertyDAO
    {
        private readonly SaleManagementContext _context;
        public static PropertyDAO instance = null;
        public static PropertyDAO Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = new PropertyDAO();
                }
                return instance;
            }
        }

        public PropertyDAO()
        {
            _context = new SaleManagementContext();
        }

        public void AddProperty(Property property)
        {
            var newProp = new Property();
            newProp.PropertyName = property.PropertyName;
            newProp.Bedrooms = property.Bedrooms;
            newProp.Bathrooms = property.Bathrooms;
            newProp.CategoryId = property.CategoryId;
            newProp.Description = property.Description;
            newProp.Location = property.Location;
            newProp.Price = property.Price;
            newProp.SizeSqFt = property.SizeSqFt;

            _context.Properties.Add(newProp);
            _context.SaveChanges();
        }

        public Property GetPropertyById(int propertyId)
        {
            return _context.Properties
                           .Include(p => p.Category)
                           .FirstOrDefault(p => p.PropertyId == propertyId);
        }

        public List<Property> GetAllProperties()
        {
            return _context.Properties
                           .Include(p => p.Category)
                           .ToList();
        }

        public void UpdateProperty(Property property)
        {
            var existingProperty = new Property();
            existingProperty.Bedrooms = property.Bedrooms;
            existingProperty.Category = property.Category;
            existingProperty.Bathrooms = property.Bathrooms;
            existingProperty.PropertyName = property.PropertyName;
            if (existingProperty != null)
            {

                _context.Update(existingProperty);
                _context.SaveChanges();
            }
        }

        public void DeleteProperty(int propertyId)
        {
            var property = _context.Properties.Find(propertyId);
            if (property != null)
            {
                _context.Properties.Remove(property);
                _context.SaveChanges();
            }
        }
    }
}
