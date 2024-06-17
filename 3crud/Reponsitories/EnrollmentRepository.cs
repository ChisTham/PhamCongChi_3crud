using _3crud.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace _3crud.Reponsitories
{
    public class EnrollmentRepository : IEnrollmentRepository
    {
        private readonly prn221_lab2Context _context;

        public EnrollmentRepository(prn221_lab2Context context)
        {
            _context = context;
        }

        public async Task<string> CreateEnrollment(Enrollment enrollment)
        {
            try
            {
                _context.Enrollments.Add(enrollment);
                await _context.SaveChangesAsync();
                return "ok";
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                return "!ok";
            }
        }

        public async Task<bool> DeleteEnrollment(int id)
        {
            try
            {
                var enrollment = await _context.Enrollments.FindAsync(id);
                if (enrollment != null)
                {
                    _context.Enrollments.Remove(enrollment);
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

        public async Task<List<Enrollment>> GetEnrollments()
        {
            try
            {
                var enrollments = await _context.Enrollments.ToListAsync();
                return enrollments;
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                return null;
            }
        }

        public async Task<Enrollment> GetEnrollmentById(int id)
        {
            try
            {
                var enrollment = await _context.Enrollments.FindAsync(id);
                return enrollment;
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                return null;
            }
        }

        public async Task<List<Enrollment>> GetEnrollmentsByCourseId(int courseId)
        {
            try
            {
                var enrollments = await _context.Enrollments
                    .Where(e => e.CourseId == courseId)
                    .ToListAsync();
                return enrollments;
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                return null;
            }
        }

        public async Task<List<Enrollment>> GetEnrollmentsByStudentId(int studentId)
        {
            try
            {
                var enrollments = await _context.Enrollments
                    .Where(e => e.StudentId == studentId)
                    .ToListAsync();
                return enrollments;
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                return null;
            }
        }

        public async Task<bool> UpdateEnrollment(Enrollment enrollment)
        {
            try
            {
                _context.Entry(enrollment).State = EntityState.Modified;
                await _context.SaveChangesAsync();
                return true;
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                return false;
            }
        }
    }
}
