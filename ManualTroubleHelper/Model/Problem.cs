using System.Text.Json.Serialization;

namespace ManualTroubleHelper.Model
{
    public class Problem
    {
        [JsonIgnore]
        public int Id { get; set; }
        [JsonPropertyName("header")]
        public string Header { get; set; } = "Empty problem";
        [JsonPropertyName("content")]
        public string Content { get; set; } = "EmptyContent";
        [JsonPropertyName("author")]
        public string Author { get; set; } = "Noname author";
        [JsonPropertyName("solutions")]
        public IEnumerable<Solution> Solutions { get; set; } = new List<Solution>();
        [JsonPropertyName("tags")]
        public IEnumerable<string>? Tags { get; set; } = new List<string>();
        public Problem() {}
    }
}
