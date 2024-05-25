using System.Globalization;
using ManualTroubleHelper.Model;
using ManualTroubleHelper.RequestObjects;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Identity.Client.Extensions.Msal;

namespace ManualTroubleHelper.Controllers
{
    [Route("chat")]
    [ApiController]
    public class ChatController
    {
        [HttpPost("search")]
        public List<ChatMessage> Search([FromBody] ChatMessage query) 
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
            ];
        }
        [HttpGet]
        public List<ChatMessage> GetStartMessage()
        {
            return
            [
                new ChatMessage() { isRequest = false, 
                MessageText = "Hello user, how can I help you?", 
                MessageTime = DateTime.Now.ToString(CultureInfo.CurrentCulture), Problems = null},
            ];
        }
    }
}
