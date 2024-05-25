using System.Text.Json.Serialization;

namespace ManualTroubleHelper.Model
{
    public class Problem
    {
        public int Id { get; set; }
        public string Description { get; set; }
        public IEnumerable<Solution>? Solutions { get; set; } = new List<Solution>();
        public IEnumerable<Tag>? Tags { get; set; } = new List<Tag>();
        public Problem() {}
    }
}