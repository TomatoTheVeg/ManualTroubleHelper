using System.Globalization;
using ManualTroubleHelper.RequestObjects;
using Microsoft.AspNetCore.Mvc;

namespace ManualTroubleHelper.Controllers
{
    [Route("chat")]
    [ApiController]
    public class ChatController
    {
        [HttpPost("test")]
        public void MessageTest([FromBody] ChatMessage message) 
        {
            return;
        }
        [HttpGet]
        public List<ChatMessage> GetTestMessage()
        {
            return
            [
                new ChatMessage() { isRequest = true, MessageText = "Я пидор?", MessageTime = DateTime.Now.ToString(CultureInfo.CurrentCulture) },
                new ChatMessage()
                    { isRequest = false, MessageText = "Да, я пидор!", MessageTime = DateTime.Now.ToString(CultureInfo.CurrentCulture) }
            ];
        }
    }
}
