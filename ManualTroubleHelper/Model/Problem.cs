using System.Text.Json.Serialization;

namespace ManualTroubleHelper.Model
{
    public class Problem
    {
        public int Id { get; set; }
        public string Description { get; set; }
        public List<Solution>? Solutions { get; set; } = new List<Solution>();
        public List<Tag>? Tags { get; set; } = new List<Tag>();
        public Problem() {}
    }
}