using System.Diagnostics.Contracts;
using System.Text.Json.Serialization;

namespace ManualTroubleHelper.Model
{
    public class Solution
    {
        public int Id { get; set; }
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
