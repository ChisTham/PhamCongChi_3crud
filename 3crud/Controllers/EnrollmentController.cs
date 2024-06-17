using _3crud.Models;
using _3crud.Reponsitories;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace _3crud.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class EnrollmentController : ControllerBase
    {
        private readonly IEnrollmentRepository _repo;

        public EnrollmentController(IEnrollmentRepository repo)
        {
            _repo = repo;
        }

        [HttpGet("Get")]
        public async Task<IActionResult> Get()
        {
            try
            {
                var enrollments = await _repo.GetEnrollments();
                return Ok(enrollments);
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Internal server error: {ex.Message}");
            }
        }

        [HttpGet("GetById")]
        public async Task<IActionResult> GetById(int id)
        {
            try
            {
                var enrollment = await _repo.GetEnrollmentById(id);
                if (enrollment != null)
                {
                    return Ok(enrollment);
                }
                else
                {
                    return NotFound("Enrollment not found");
                }
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Internal server error: {ex.Message}");
            }
        }

        [HttpPost("Create")]
        public async Task<IActionResult> Create(Enrollment enrollment)
        {
            try
            {
                var result = await _repo.CreateEnrollment(enrollment);
                if (result == "ok")
                {
                    return Ok("Enrollment created");
                }
                else
                {
                    return BadRequest("Failed to create enrollment");
                }
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Internal server error: {ex.Message}");
            }
        }

        [HttpPut("Update")]
        public async Task<IActionResult> Update(Enrollment enrollment)
        {
            try
            {
                var updated = await _repo.UpdateEnrollment(enrollment);
                if (updated)
                {
                    return Ok("Enrollment updated");
                }
                else
                {
                    return NotFound("Enrollment not found");
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
                var deleted = await _repo.DeleteEnrollment(id);
                if (deleted)
                {
                    return Ok("Enrollment deleted");
                }
                else
                {
                    return NotFound("Enrollment not found");
                }
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Internal server error: {ex.Message}");
            }
        }
    }
}