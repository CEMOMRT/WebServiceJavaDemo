using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace WebServiceJavaDemo
{
    /// <summary>
    /// StudentService için özet açıklama
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // Bu Web Hizmeti'nin, ASP.NET AJAX kullanılarak komut dosyasından çağrılmasına, aşağıdaki satırı açıklamadan kaldırmasına olanak vermek için.
    [System.Web.Script.Services.ScriptService]
    public class StudentService : System.Web.Services.WebService
    {

        [WebMethod]
        public Student GetStudentById(int ID)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(cs))
            {
                SqlCommand command = new SqlCommand("upGetStudentByID", connection);
                command.CommandType = CommandType.StoredProcedure;
                SqlParameter sqlParameter = new SqlParameter("@ID", ID);
                command.Parameters.Add(sqlParameter);
                Student student = new Student();
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    student.ID = Convert.ToInt32(reader["ID"]);
                    student.Name = reader["Name"].ToString();
                    student.Gender = reader["Gender"].ToString();
                    student.TotalMarks = Convert.ToInt32(reader["TotalMarks"]);
                }
                return student;
            }
        }
    }
}
