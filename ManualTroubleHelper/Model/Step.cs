using System.Text.Json.Serialization;

namespace ManualTroubleHelper.Model
{
    public class Step
    {
        [JsonIgnore]
        public int Id { get; set; }
        [JsonPropertyName("description")]
        public string Description { get; set; } = "";
        [JsonPropertyName("command")]
        public string Command { get; set; } = "";
        [JsonPropertyName("pictureUrl")]
        public string PictureUrl { get; set; } = "";

        public Step() { }
    }
}
