using User_JWT_Authorization.Contract;
using User_JWT_Authorization.Models;
using User_JWT_Authorization.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace User_JWT_Authorization.Controllers
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    public class UserController : ControllerBase
    {
        //public IActionResult Index()
        //{
        //    return View();
        //}
        [HttpPost]
        public IActionResult Register(UserRegistration request)
        {
            try
            {
                IUserServiceWorkFlow workFlow = new UserServiceWorkFlow();
                workFlow.RegisterUser(request);
                return Ok();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                return StatusCode(StatusCodes.Status500InternalServerError);
            }
        }

        [Microsoft.AspNetCore.Authorization.Authorize]
        [HttpPost]
        public IActionResult GetCurrentUser(long userID)
        {
            User response = null;
            try
            {
                IUserServiceWorkFlow workFlow = new UserServiceWorkFlow();
                response = workFlow.GetUserDetails(userID);
                return Ok(response);
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                return StatusCode(StatusCodes.Status500InternalServerError);
            }
        }
    }
}
