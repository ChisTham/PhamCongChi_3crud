using _3crud.Models;

namespace _3crud.Reponsitories
{
    public interface ICourseReponsitory 
    {
        public Task<List<Course>> GetList();
        public Task<Course> GetCourseByID(int id);

        public Task<List<Course>> GetCourseByName(string name);
        public Task<List<Course>> GetCourseByCredits(int credits);

        public Task<string> CreateCourse(Course course);

        public Task<Course> PutCourse(Course course);

        public Task<bool> DeleteCourse(int id);

    }
}
