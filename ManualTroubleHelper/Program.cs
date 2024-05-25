using ManualTroubleHelper.Model;
using ManualTroubleHelper.Services;

var builder = WebApplication.CreateBuilder(args);

var services = builder.Services;

services.AddControllers();
//services.AddSingleton<FAQContext>();
//services.AddSingleton<IFAQManager, FAQManager>();

var app = builder.Build();

app.MapGet("/", () => "Hello World!");
app.MapControllers();

app.Run();
