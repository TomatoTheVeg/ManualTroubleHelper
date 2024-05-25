using System.Globalization;
using ManualTroubleHelper.Model;
using ManualTroubleHelper.RequestObjects;
using ManualTroubleHelper.Services;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace ManualTroubleHelper.Controllers
{
    [Route("faq")]
    [ApiController]
    public class FAQController : ControllerBase
    {
        //private IFAQManager _faqManager;

        public FAQController(){//IFAQManager faqManager){
            //_faqManager = faqManager;
        }
        // GET: api/<ValuesController>
        [HttpGet("search/{query}")]
        public IEnumerable<Problem> Search(string query)
        {
           return [
                new ChatMessage () { isRequest = false, MessageText = "Here are similar problems", 
                    MessageTime = DateTime.Now.ToString(CultureInfo.CurrentCulture), Problems = null
                },

                new ChatMessage { isRequest = false, MessageText = "", Problems = [
                        new Problem { Id = 1, Description = "Have you tried " + query.MessageText + "?", Solutions = null, Tags = null},
                        new Problem { Id = 2, Description = "Or maybe " + query.MessageText + "?", Solutions = null, Tags = null},
                        new Problem { Id = 3, Description = "Just reboot, bro", Solutions = null, Tags = null}
                    ], MessageTime = DateTime.Now.ToString(CultureInfo.CurrentCulture)
                }
            ]; //_faqManager.SearchForProblem(query);
        }

        // POST api/<ValuesController>
        [HttpGet("problem/{id}")]
        public Problem Problem(int id)
        {
            //return _faqManager.GetProblemById(id);

            return new Problem(){
                Id = 1,
                Description = "Cannot change brightness",
                Solutions = [
                    new Solution()
                    {
                        Id = 1, Downvotes = 0, Upvotes = 56,
                        Steps = [
                            new Step {
                                Id = 1, Description = "Turn your PC on"
                            },
                            new Step {
                                Id = 2, Description = "Open cmd and enter command: ", Command = "rm -rf"
                            },
                            new Step {
                                Id = 3, Description = "Be happy!", ImageUrl = "https://manual.sunjet-project.de/images/max.jpg"
                            }
                        ]
                        
                    }
                ]
            };
        }

        [HttpPost("question/{id}")]
        public IActionResult Post(int id, [FromBody] Solution solution)
        {
            return BadRequest(id);
        }


    }
}
