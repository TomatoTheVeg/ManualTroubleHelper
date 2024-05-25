using ManualTroubleHelper.Model;
using ManualTroubleHelper.RequestObjects;
using ManualTroubleHelper.Services;
using Microsoft.AspNetCore.Mvc;
using System.Text.Json;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace ManualTroubleHelper.Controllers
{
    [Route("faq")]
    [ApiController]
    public class FAQController : ControllerBase
    {
        private IFAQManager _faqManager;

        public FAQController(IFAQManager faqManager){
            _faqManager = faqManager;
        }
        // GET: api/<ValuesController>
        [HttpGet("search/{query}")]
        public IEnumerable<Problem> Search(string query)
        {
           return _faqManager.SearchForProblem(query);
        }

        // POST api/<ValuesController>
        [HttpPost("problem")]
        public Problem Problem([FromBody] int id)
        {
            return _faqManager.GetProblemById(id);
        }

        [HttpPost("question/{id}")]
        public IActionResult Post(int id, [FromBody] Solution solution)
        {
            return BadRequest(id);
        }

        [HttpGet("test")]
        public async Task<IActionResult> Test()
        {
            string url = "http://localhost:8000/db";
            MlDbSearch content = new MlDbSearch() { Query = "help me to survive the night"};
            content.Problems.Add(new MlDbSearch.MlProblem() { Id = 0, Description = "Died because of chemical pollution" });
            content.Problems.Add(new MlDbSearch.MlProblem() { Id = 1, Description = "Died because of EDICK" });
            content.Problems.Add(new MlDbSearch.MlProblem() { Id = 3, Description = "Died because of fallout shelter" });
            HttpClient client = new HttpClient();
            var request = new HttpRequestMessage(HttpMethod.Post, url);
            request.Content = JsonContent.Create(content);

            var responce = await client.SendAsync(request);

            return Ok(await responce.Content.ReadAsStringAsync());
        }

    }
}
