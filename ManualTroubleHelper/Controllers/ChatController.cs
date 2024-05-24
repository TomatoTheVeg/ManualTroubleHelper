using ManualTroubleHelper.RequestObjects;
using Microsoft.AspNetCore.Mvc;

namespace ManualTroubleHelper
{
    [Route("chat")]
    [ApiController]
    public class ChatController
    {
        [HttpPost("test")]
        public List<ChatMessage> MessageTest([FromBody] ChatMessage message) 
        { 
            return new List<ChatMessage>() { new ChatMessage() { isRequest = true, MessageText = "Я пидор?", MessageTime = DateTime.Now}, new ChatMessage() { isRequest = false, MessageText = "Да, я пидор!", MessageTime = DateTime.Now } };
        }
        [HttpGet]
        public ChatMessage GetTestMessage()
        {
            return new ChatMessage() {isRequest = false, MessageText = "Dura", MessageTime = DateTime.Now };
        }
    }
}
