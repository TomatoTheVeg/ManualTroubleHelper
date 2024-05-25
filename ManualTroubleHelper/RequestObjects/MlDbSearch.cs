using System.Text.Json.Serialization;

namespace ManualTroubleHelper.RequestObjects
{
    public class MlDbSearch
    {
        [JsonPropertyName("query")]
        public string Query { get; set; }
        public List<MlProblem> Problems { get; set; } = new List<MlProblem>();

        public class MlProblem
        {
            [JsonPropertyName("index")]
            public int Id { get; set; }
            [JsonPropertyName("description")]
            public string Description { get; set; }
        }
    }
}
