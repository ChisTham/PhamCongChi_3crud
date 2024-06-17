using _3crud.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace _3crud.Reponsitories
{
    public class CourseReponsitory : ICourseReponsitory
    {
        private readonly prn221_lab2Context _context;

        public CourseReponsitory(prn221_lab2Context context)
        {
            _context = context;
        }

        public async Task<string> CreateCourse(Course course)
        {
            try
            {
                _context.Courses.Add(course);
                await _context.SaveChangesAsync();
                return "ok";
            }
            catch (Exception)
            {
                return "!ok";
                throw;
            }
        }

        public async Task<List<Course>> GetCourseByCredits(int credits)
        {
            try
            {
                var courses = await _context.Courses.Where(c => c.Credits == credits).ToListAsync();
                return courses;
            }
            catch (Exception)
            {
                return null;
                throw;
            }
        }

        public async Task<Course> GetCourseByID(int id)
        {
            try
            {
                var courses = await _context.Courses
                    .Include(c => c.Enrollments)
                    .ThenInclude(e => e.Student) // Include student information
                    .SingleOrDefaultAsync(c => c.CourseId == id);
                return courses;
            }
            catch (Exception)
            {
                return null;
                throw;
            }
        }

        public async Task<List<Course>> GetCourseByName(string name)
        {
            try
            {
                var courses = await _context.Courses
                    .Include(c => c.Enrollments)
                    .ThenInclude(e => e.Student) // Include student information
                    .Where(c => c.Title.Contains(name))
                    .ToListAsync();
                return courses;
            }
            catch (Exception)
            {
                return null;
                throw;
            }
        }

        public async Task<List<Course>> GetList()
        {
            try
            {
                var list = await _context.Courses
                    .Include(c => c.Enrollments)
                    .ThenInclude(e => e.Student) // Include student information
                    .ToListAsync();
                return list;
            }
            catch (Exception)
            {
                return null;
                throw;
            }
        }

        public async Task<Course> PutCourse(Course course)
        {
            try
            {
                var exCourse = await _context.Courses.SingleOrDefaultAsync(c => c.CourseId == course.CourseId);
                if (exCourse != null)
                {
                    exCourse.Title = course.Title;
                    exCourse.Credits = course.Credits;
                    await _context.SaveChangesAsync();
                    return exCourse;
                }
                else
                {
                    return null;
                }
            }
            catch (Exception)
            {
                return null;
                throw;
            }
        }

        public async Task<bool> DeleteCourse(int id)
        {
            try
            {
                var course = await _context.Courses.SingleOrDefaultAsync(c => c.CourseId == id);
                if (course != null)
                {
                    _context.Courses.Remove(course);
                    await _context.SaveChangesAsync();
                    return true;
                }
                return false;
            }
            catch (Exception)
            {
                return false;
                throw;
            }
        }
    }
}