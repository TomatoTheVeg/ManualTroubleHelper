using System.Globalization;
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
        [HttpGet("problem/{id}")]
        public Problem Problem(int id)
        {
            return _faqManager.GetProblemById(id);

            // return new Problem(){
            //     Id = 1,
            //     Description = "Cannot change brightness",
            //     Solutions = [
            //         new Solution()
            //         {
            //             Id = 1, Downvotes = 0, Upvotes = 56,
            //             Steps = [
            //                 new Step {
            //                     Id = 1, Description = "Turn your PC on"
            //                 },
            //                 new Step {
            //                     Id = 2, Description = "Open cmd and enter command: ", Command = "rm -rf"
            //                 },
            //                 new Step {
            //                     Id = 3, Description = "Be happy!", ImageUrl = "https://manual.sunjet-project.de/images/max.jpg"
            //                 }
            //             ]
                        
            //         }
            //     ]
            // };
        }

        [HttpGet("problems")]
        public List<Problem> GetAllProblems()
        {
            return _faqManager.GetAllProblems().ToList();
        }

        [HttpPost("problem")]
        public Problem AddProblem([FromBody] Problem problem)
        {
            problem.Id = _faqManager.AddProblem(problem);
            return problem;
        }

        [HttpPost("solution/{problemId}")]
        public Solution AddSolution(int problemId, [FromBody] Solution solution)
        {
            solution.Id = _faqManager.AddSolution(solution, problemId);
            return solution;
        }
        
        [HttpGet("upvote/{id}")]
        public int Upvote(int id)
        {
            return _faqManager.AddUpvote(id);
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
