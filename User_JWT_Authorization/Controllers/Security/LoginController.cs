using User_JWT_Authorization.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;
using static User_JWT_Authorization.Constants;

namespace User_JWT_Authorization.Controllers.Security
{
    [Route("api/[controller]")]
    [ApiController]
    public class LoginController : ControllerBase
    {
        private readonly IConfiguration _config;
        public LoginController(IConfiguration config)
        {
            _config = config;
        }

        [AllowAnonymous]
        [HttpPost]
        public ActionResult Login( UserLogin userLogin)
        {
            var user = Authenticate(userLogin);
            if (user != null)
            {
                var token = GenerateToken(user);
                return Ok(token);
            }

            return NotFound("user not found");
        }

        # region Private Methods
        // To generate token
        private string GenerateToken(User user)
        {
            var securityKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_config["Jwt:Key"]));
            var credentials = new SigningCredentials(securityKey, SecurityAlgorithms.HmacSha256);

            string role = "USER";
            if(user.UserType== (int)UserRole.ADMIN)
            {
                role = "ADMIN";
            }

            var claims = new[]
            {
                new Claim(ClaimTypes.NameIdentifier,user.EmailId),
                new Claim(ClaimTypes.Role,role),
                new Claim(ClaimTypes.Sid,user.Id.ToString())
            };
            var token = new JwtSecurityToken(_config["Jwt:Issuer"],
                _config["Jwt:Audience"],
                claims,
                expires: DateTime.Now.AddMinutes(15),
                signingCredentials: credentials);


            return new JwtSecurityTokenHandler().WriteToken(token);

        }

        //To authenticate user
        private User Authenticate(UserLogin userLogin)
        {
            User currentUser = null;
            var context = new UserDbContext();
            currentUser = context.Users.FirstOrDefault(s => s.EmailId == userLogin.EmailID && s.PasswordHashed == userLogin.Password);
            if (currentUser != null)
            {
                return currentUser;
            }
            return null;
        }
        #endregion
    }
}
