using _3crud.Models;

namespace _3crud.Reponsitories
{
    public interface IEnrollmentRepository
    {
        Task<List<Enrollment>> GetEnrollments();
        Task<Enrollment> GetEnrollmentById(int id);
        Task<List<Enrollment>> GetEnrollmentsByStudentId(int studentId);
        Task<List<Enrollment>> GetEnrollmentsByCourseId(int courseId);
        Task<string> CreateEnrollment(Enrollment enrollment);
        Task<bool> UpdateEnrollment(Enrollment enrollment);
        Task<bool> DeleteEnrollment(int id);
    }
}
