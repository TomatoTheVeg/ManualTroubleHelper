namespace ManualTroubleHelper.Model
{
    public interface IFAQManager
    {
        public Problem GetProblemById(int problemId);
        public Solution GetSolutionById(int solutionId);
        public IEnumerable<Problem> GetAllProblems();
        public IEnumerable<Problem> SearchForProblem(string query);
        public int AddProblem(Problem problem);
        public int AddSolution(Solution solution, int problemId);
    }
}
