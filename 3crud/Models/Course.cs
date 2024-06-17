using System;
using System.Collections.Generic;
using System.Text.Json.Serialization;

namespace _3crud.Models
{
    public partial class Course
    {
        public Course()
        {
            Enrollments = new HashSet<Enrollment>();
        }
        
        public int CourseId { get; set; }
        public string Title { get; set; }
        public int Credits { get; set; }

        [JsonIgnore]
        public virtual ICollection<Enrollment> Enrollments { get; set; }
    }
}
