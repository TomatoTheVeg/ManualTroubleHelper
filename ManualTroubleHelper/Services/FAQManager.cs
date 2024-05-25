using ManualTroubleHelper.Model;

namespace ManualTroubleHelper.Services
{
    public class FAQManager : IFAQManager
    {
        public int AddProblem(Problem problem)
        {
            throw new NotImplementedException();
        }

        public int AddSolution(Solution solution, int problemId)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<Problem> GetAllProblems()
        {
            throw new NotImplementedException();
        }

        public Problem GetProblemById(int problemId)
        {
            throw new NotImplementedException();
        }

        public Solution GetSolutionById(int solutionId)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<Problem> SearchForProblem(string query)
        {
            throw new NotImplementedException();
        }
    }
}
