var builder = WebApplication.CreateBuilder(args);

var services = builder.Services;

services.AddControllers();

var app = builder.Build();

app.MapGet("/", () => "Hello World!");
app.MapControllers();

app.Run();
