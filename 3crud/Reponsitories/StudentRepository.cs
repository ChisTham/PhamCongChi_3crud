using _3crud.Models;
using Microsoft.EntityFrameworkCore;

namespace _3crud.Reponsitories
{
    public class StudentRepository : IStudentRepository
    {
        private readonly prn221_lab2Context _context;

        public StudentRepository(prn221_lab2Context context)
        {
            _context = context;
        }

        public async Task<string> CreateStudent(Student student)
        {
            try
            {
                _context.Students.Add(student);
                await _context.SaveChangesAsync();
                return "ok";
            }
            catch (Exception)
            {
                return "!ok";
                throw;
            }
        }

        public async Task<bool> DeleteStudent(int id)
        {
            try
            {
                var student = await _context.Students.SingleOrDefaultAsync(s => s.Id == id);
                if (student != null)
                {
                    _context.Students.Remove(student);
                    await _context.SaveChangesAsync();
                    return true;
                }
                return false;
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                return false;
            }
        }

        public async Task<List<Student>> GetList()
        {
            try
            {
                var list = await _context.Students.ToListAsync();
                return list;
            }
            catch (Exception)
            {
                return null;
                throw;
            }
        }

        public async Task<Student> GetStudentByID(int id)
        {
            try
            {
                var student = await _context.Students.SingleOrDefaultAsync(s => s.Id == id);
                return student;
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                return null;
            }
        }

        public async Task<List<Student>> GetStudentByName(string name)
        {
            try
            {
                var students = await _context.Students
                    .Where(s => s.LastName.Contains(name) || s.FirstMidName.Contains(name))
                    .ToListAsync();
                return students;
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                return null;
            }
        }

        public async Task<Student> PutStudent(Student student)
        {
            try
            {
                var exStudent = await _context.Students.SingleOrDefaultAsync(s => s.Id == student.Id);
                if (exStudent != null)
                {
                    exStudent.LastName = student.LastName;
                    exStudent.FirstMidName = student.FirstMidName;
                    exStudent.EnrollmentDate = student.EnrollmentDate;
                    await _context.SaveChangesAsync();
                    return exStudent;
                }
                return null;
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                return null;
            }
        }
    }
}
