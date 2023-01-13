using Microsoft.Data.SqlClient;
using System;
using System.Data;
using System.Threading.Tasks;
using AppNames.Sql;
using AppNames.Models;
using AppNames.Classes;

namespace AppNames
{
     public class Program
    {
        public static async Task Main(string[] args)
        {
            var builder = WebApplication.CreateBuilder(args);

            // Add services to the container.
            builder.Services.AddControllersWithViews();

            var app = builder.Build();

            var sqlClass = await mySqlClass.CreateAsync();
            sqlClass.SqlClose(); 

            // Configure the HTTP request pipeline.
            if (!app.Environment.IsDevelopment())
            {
                
                app.UseExceptionHandler("/Home/Error");
                // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
                app.UseHsts();
            }
            else if (sqlClass.ErrorConnection.Length>0)
            {
                app.UseExceptionHandler("/Home/Error");
            }

            app.UseHttpsRedirection();
            app.UseStaticFiles();

            app.UseRouting();

            app.UseAuthorization();

            app.MapControllerRoute(
                name: "default",
                pattern: "{controller=Home}/{action=Index}/{id?}");

            app.MapControllerRoute(
                name: "Month",
                pattern: "{controller=Month}/{action=Index}/{NumbMonth?}");

            app.Run();

        }
    }
}