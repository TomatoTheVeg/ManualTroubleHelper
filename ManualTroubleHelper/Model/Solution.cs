using System.Diagnostics.Contracts;

namespace ManualTroubleHelper.Model
{
    public class Solution
    {
        public int Id { get; set; }
        public string Header { get; set; }
        public string Content { get; set; }
        public string Author { get; set; }  
        public int Upvotes { get; set; }
        public int Downvotes { get; set; }

        public Solution() { }

        public int getScore()
        {
            return Upvotes - Downvotes;
        }

    }
}
