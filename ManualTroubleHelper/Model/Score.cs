using System.Text.Json.Serialization;

namespace ManualTroubleHelper.Model
{
    public class Score
    {
        [JsonPropertyName("score")]
        public int ScoreNum { get; set; }

        public Score(int num){
            ScoreNum = num;
        }
    }
}
