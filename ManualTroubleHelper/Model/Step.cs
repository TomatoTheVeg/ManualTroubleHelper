using System.Text.Json.Serialization;

namespace ManualTroubleHelper.Model
{
    public class Step
    {
        public int Id { get; set; }
        [JsonPropertyName("description")]
        public string Description { get; set; } = "";
        [JsonPropertyName("code")]
        public string? Command { get; set; }
        [JsonPropertyName("imageUrl")]
        public string? ImageUrl { get; set; }

        public Step() { }
    }
}
