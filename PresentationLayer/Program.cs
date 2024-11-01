using ServiceLayer;
using ServiceLayer.Interfaces;

namespace PresentationLayer
{
    public class Program
    {
        public static void Main(string[] args)
        {
            var builder = WebApplication.CreateBuilder(args);

            // Add services to the container.
            builder.Services.AddRazorPages();
            builder.Services.AddScoped<IMemberService, MemberService>();
			builder.Services.AddScoped<IPropertyCategoryService, PropertyCategoryService>();
			builder.Services.AddScoped<IPropertyService, PropertyService>();
			builder.Services.AddScoped<IRoleUserService, RoleUserService>();
			builder.Services.AddScoped<ITransactionService, TransactionService>();
			builder.Services.AddScoped<ITransactionDetailService, TransactionDetailService>();
			builder.Services.AddSession();


			var app = builder.Build();

            // Configure the HTTP request pipeline.
            if (!app.Environment.IsDevelopment())
            {
                app.UseExceptionHandler("/Error");
                // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
                app.UseHsts();
            }

            app.UseHttpsRedirection();
            app.UseStaticFiles();

            app.UseRouting();

            app.UseAuthorization();

            app.MapRazorPages();
            app.UseSession();
            app.Run();
        }
    }
}
