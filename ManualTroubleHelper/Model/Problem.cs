using System.Text.Json.Serialization;

namespace ManualTroubleHelper.Model
{
    public class Problem
    {
        public int Id { get; set; }
        public string Description { get; set; }
        public IEnumerable<Solution>? Solutions { get; set; } = new List<Solution>();
        public IEnumerable<string>? Tags { get; set; } = new List<string>();
        public Problem() {}
    }
}