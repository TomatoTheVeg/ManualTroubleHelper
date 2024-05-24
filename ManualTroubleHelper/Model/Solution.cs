using System.Diagnostics.Contracts;
using System.Text.Json.Serialization;

namespace ManualTroubleHelper.Model
{
    public class Solution
    {
        [JsonIgnore]
        public int Id { get; set; }
        [JsonPropertyName("header")]
        public string Header { get; set; }
        [JsonPropertyName("content")]
        public string Content { get; set; }
        [JsonPropertyName("steps")]
        public List<Step> Steps { get; set; } = new List<Step>();
        [JsonPropertyName("upvotes")]
        public int Upvotes { get; set; }
        [JsonPropertyName("downvotes")]
        public int Downvotes { get; set; }

        public Solution() { }

        public int getScore()
        {
            return Upvotes - Downvotes;
        }

    }
}
