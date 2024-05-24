namespace ManualTroubleHelper.Model
{
    public class Question
    {
        public int Id { get; set; }
        public string Header { get; set; }
        public string Content { get; set; }
        public string Author { get; set; }
        public IEnumerable<Solution> solutions { get; set; } = new List<Solution>();
        public IEnumerable<string>? tags { get; set; } = new List<string>();
        public Question() {}
    }
}
