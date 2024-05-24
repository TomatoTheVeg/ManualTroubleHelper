using System.Text.Json.Serialization;

namespace ManualTroubleHelper.RequestObjects
{
    public class ChatMessage
    {
        [JsonPropertyName("text")]
        public string MessageText { get; set; } = "";
        [JsonPropertyName("isMe")]
        public bool isRequest { get; set; }
        [JsonPropertyName("timeSent")]
        public DateTime MessageTime { get; set; }
    }
}
