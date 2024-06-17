using _3crud.Models;
using _3crud.Reponsitories;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace _3crud.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class StudentController : ControllerBase
    {
        private readonly IStudentRepository _repo;
        public StudentController(IStudentRepository repo)
        {
            _repo = repo;
        }

        [HttpGet("Get")]
        public async Task<IActionResult> Get()
        {
            try
            {
                return Ok(await _repo.GetList());
            }
            catch (Exception)
            {

                throw;
            }
        }

        [HttpGet("GetByID")]
        public async Task<IActionResult> GetById(int id)
        {
            try
            {
                var student = await _repo.GetStudentByID(id);
                if (student != null)
                {
                    return Ok(student);
                }
                else
                {
                    return NotFound("Student not found");
                }
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Internal server error: {ex.Message}");
            }
        }
        [HttpPost("Create")]
        public async Task<IActionResult> Create(Student student)
        {
            try
            {
                var result = await _repo.CreateStudent(student);
                if (result == "ok")
                {
                    return Ok(result);
                }
                else
                {
                    return BadRequest("Failed to create student");
                }
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Internal server error: {ex.Message}");
            }
        }

        [HttpPut("Update")]
        public async Task<IActionResult> Update(Student student)
        {
            try
            {
                var updatedStudent = await _repo.PutStudent(student);
                if (updatedStudent != null)
                {
                    return Ok(updatedStudent);
                }
                else
                {
                    return NotFound("Student not found");
                }
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Internal server error: {ex.Message}");
            }
        }

        [HttpDelete("Delete/{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            try
            {
                var result = await _repo.DeleteStudent(id);
                if (result)
                {
                    return Ok("Student deleted");
                }
                else
                {
                    return NotFound("Student not found");
                }
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Internal server error: {ex.Message}");
            }
        }
    }
}
