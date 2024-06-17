using _3crud.Models;

namespace _3crud.Reponsitories
{
    public interface IStudentRepository
    {
        Task<List<Student>> GetList();
        Task<Student> GetStudentByID(int id);
        Task<List<Student>> GetStudentByName(string name);
        Task<string> CreateStudent(Student student);
        Task<Student> PutStudent(Student student);
        Task<bool> DeleteStudent(int id);
    }
}
