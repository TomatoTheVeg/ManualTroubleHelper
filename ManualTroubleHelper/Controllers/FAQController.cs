using ManualTroubleHelper.Model;
using ManualTroubleHelper.Services;
using Microsoft.AspNetCore.Mvc;

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


    }
}
