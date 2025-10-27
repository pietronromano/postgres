using PostgresEF.Data;

//namespace PostgresEF;

using System;
using System.Linq;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;

/* var builder = new ConfigurationBuilder().Build();
var conString = builder.GetConnectionString("ComercioContext") ??
     throw new InvalidOperationException("Connection string 'ComercioContext'" +
    " not found.");
   builder. 
builder.AddDbContext<BloggingContext>(options =>
    options.UseSqlServer(conString)); */

using var db = new ComercioContext();


// Note: This sample requires the database to be created before running.
//Console.WriteLine($"Database path: {db.Database.}.");

// Read
Console.WriteLine("Querying for a Cliente");
var cliente = await db.Clientes
    .OrderBy(b => b.IdCliente)
    .FirstAsync();

Console.WriteLine("Nif: " + cliente.Nif);

// Create
Console.WriteLine("Inserting a new Cliente");
db.Add(new Cliente {
    Nif = "NNNNNNNN1",
    Nombres = "Nombres 20",
    Apellidos = "Apellidos 20",
    FechaAlta = new DateOnly(2025, 1, 1),
    Activo = true,
Comentarios = "Comentarios 20"
    });
await db.SaveChangesAsync();



/* // Update
Console.WriteLine("Updating the blog and adding a post");
blog.Url = "https://devblogs.microsoft.com/dotnet";
blog.Posts.Add(
    new Post { Title = "Hello World", Content = "I wrote an app using EF Core!" });
await db.SaveChangesAsync();

// Delete
Console.WriteLine("Delete the blog");
db.Remove(blog);
await db.SaveChangesAsync(); */

