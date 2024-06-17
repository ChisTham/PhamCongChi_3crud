using _3crud.Models;
using _3crud.Reponsitories;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Threading.Tasks;

namespace _3crud.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CourseController : ControllerBase
    {
        private readonly ICourseReponsitory _repo;

        public CourseController(ICourseReponsitory repo)
        {
            _repo = repo;
        }

        [HttpGet("Get")]
        public async Task<IActionResult> Get()
        {
            try
            {
                var courses = await _repo.GetList();
                return Ok(courses);
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Internal server error: {ex.Message}");
            }
        }

        [HttpPost("Post")]
        public async Task<IActionResult> Post(Course course)
        {
            try
            {
                var result = await _repo.CreateCourse(course);
                return Ok(result);
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Internal server error: {ex.Message}");
            }
        }

        [HttpGet("GetByCredit")]
        public async Task<IActionResult> GetByCredit(int credit)
        {
            try
            {
                var courses = await _repo.GetCourseByCredits(credit);
                return Ok(courses);
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Internal server error: {ex.Message}");
            }
        }

        [HttpGet("GetByID")]
        public async Task<IActionResult> GetById(int id)
        {
            try
            {
                var course = await _repo.GetCourseByID(id);
                if (course != null)
                {
                    return Ok(course);
                }
                else
                {
                    return NotFound("Course not found");
                }
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Internal server error: {ex.Message}");
            }
        }

        [HttpGet("GetByName")]
        public async Task<IActionResult> GetByName(string name)
        {
            try
            {
                var courses = await _repo.GetCourseByName(name);
                if (courses != null)
                {
                    return Ok(courses);
                }
                else
                {
                    return NotFound("No courses found with that name");
                }
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Internal server error: {ex.Message}");
            }
        }

        [HttpPut("PutCourse")]
        public async Task<IActionResult> Put(Course course)
        {
            try
            {
                var updatedCourse = await _repo.PutCourse(course);
                if (updatedCourse != null)
                {
                    return Ok(updatedCourse);
                }
                else
                {
                    return NotFound("Course not found");
                }
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Internal server error: {ex.Message}");
            }
        }

        [HttpDelete("DeleteCourse/{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            try
            {
                var result = await _repo.DeleteCourse(id);
                if (result)
                {
                    return Ok($"Course with ID = {id} deleted successfully.");
                }
                else
                {
                    return NotFound($"Course with ID = {id} not found.");
                }
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Internal server error: {ex.Message}");
            }
        }
    }
}