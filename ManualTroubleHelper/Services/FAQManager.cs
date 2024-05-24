﻿using ManualTroubleHelper.Model;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using System.Text.RegularExpressions;

namespace ManualTroubleHelper.Services
{
    public class FAQManager : IFAQManager
    {
        private FAQContext _context;
        public FAQManager(FAQContext context) 
        {
            _context = context;
        }
        public int AddProblem(Problem problem)
        {
            _context.Problems.Add(problem);
            _context.SaveChanges();
            return problem.Id;
        }

        public int AddSolution(Solution solution, int problemId)
        {
            Problem? problem = _context.Problems.FirstOrDefault(p => p.Id == problemId);
            if(problem == null)
            {
                return -1;
            }
            _context.Entry(problem).Collection(p => p.Solutions).Load();
            problem.Solutions = problem.Solutions.Append(solution);
            _context.SaveChanges();
            var sol = problem.Solutions.FirstOrDefault(s => s == solution);
            return sol == null? -1: sol.Id;
        }

        public IEnumerable<Problem> GetAllProblems()
        {
            return _context.Problems.Include(p=>p.Tags).ToList();
        }

        public Problem GetProblemById(int problemId)
        {
            Problem? problem = _context.Problems.FirstOrDefault(p => p.Id == problemId);
            if (problem == null)
            {
                return new Problem();
            }
            _context.Entry(problem).Collection(p => p.Solutions).Load();
            _context.Entry(problem).Reference(p => p.Tags).Load();
            foreach(Solution solution in problem.Solutions)
            {
                _context.Entry(solution).Collection(s=>s.Steps).Load();
            }
            return problem;
        }

        public Solution GetSolutionById(int solutionId)
        {
            Solution? solution = _context.Solutions.FirstOrDefault(p => p.Id == solutionId);
            if(solution == null)
            {
                return null;
            }
            _context.Entry(solution).Collection(s => s.Steps).Load();
            return solution;

        }

        private int QueryCheck(Problem problem, string query)
        {
            string[] queryTokens = query.Split('.', ',', ' ', '?', '!', ':', ';').Where(s=>s!="").Distinct().ToArray();
            int counter = 0;
            foreach(string token in queryTokens)
            {
                if (problem.Tags.Contains(token))
                {
                    counter++;
                }
                counter += Regex.Matches(problem.Header, token).Count;
                counter += Regex.Matches(problem.Content, token).Count;
            }
            return counter;
        }

        public IEnumerable<Problem> SearchForProblem(string query)
        {
            return _context.Problems.Include(p=>p.Tags).OrderBy(p=>QueryCheck(p, query)).ToList();
        }
    }
}