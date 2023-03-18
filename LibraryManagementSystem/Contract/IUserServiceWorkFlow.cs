using User_JWT_Authorization.Models;

namespace User_JWT_Authorization.Contract
{
    public interface IUserServiceWorkFlow
    {
        void RegisterUser(UserRegistration request);
        User GetUserDetails(long userId);
        User UpdateUser(User request);
    }
}
