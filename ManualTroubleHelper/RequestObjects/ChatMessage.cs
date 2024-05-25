using System.Text.Json.Serialization;
using ManualTroubleHelper.Model;

namespace ManualTroubleHelper.RequestObjects
{
    public class ChatMessage
    {
        [JsonPropertyName("text")]
        public string MessageText { get; set; } = "";
        [JsonPropertyName("isMe")]
        public bool isRequest { get; set; }
        [JsonPropertyName("timeSent")]
        public String MessageTime { get; set; }
        public List<Problem>? Problems { get; set; }
    }
}
