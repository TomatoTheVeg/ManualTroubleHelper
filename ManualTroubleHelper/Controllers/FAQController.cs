using ManualTroubleHelper.Model;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace ManualTroubleHelper.Controllers
{
    [Route("faq")]
    [ApiController]
    public class FAQController : ControllerBase
    {
        // GET: api/<ValuesController>
        [HttpGet("question/{id}")]
        public IActionResult Get(int id)
        {
           return Ok(id);
        }

        // POST api/<ValuesController>
        [HttpPost("question")]
        public IActionResult Post([FromBody] Problem question)
        {
            return BadRequest();
        }

        [HttpPost("question/{id}")]
        public IActionResult Post(int id, [FromBody] Solution solution)
        {
            return BadRequest(id);
        }


    }
}
