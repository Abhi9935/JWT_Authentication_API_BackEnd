using User_JWT_Authorization.Contract;
using User_JWT_Authorization.Models;

namespace User_JWT_Authorization.Services
{
    public class UserServiceWorkFlow : IUserServiceWorkFlow
    {
        public void RegisterUser(UserRegistration request)
        {
            User user = new User();
            user = GetUserRegDetailsDataMapper(request);
            try
            {
                using (var context = new UserDbContext())
                {
                    //1. Attach an entity to context with Added EntityState
                    //context.Add<User>(user);
                    context.Users.Add(user);

                    //2. Calling SaveChanges to insert a new record into Students table
                    context.SaveChanges();
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }

        }

        public User GetUserDetails(long userId)
        {
            User currentUser = null;
            try
            {
                var context = new UserDbContext();
                currentUser = context.Users.FirstOrDefault(s => s.Id == userId);
                if (currentUser != null) return currentUser;

            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }
            return currentUser;
        }

        public User UpdateUser(User request)
        {
            User response = new User();
            try
            {
                using (var context = new UserDbContext())
                {
                    context.Update<User>(request);

                    context.SaveChanges();
                }
                response = GetUserDetails(request.Id);

            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }
            return response;
        }

        # region Private methods
        private User GetUserRegDetailsDataMapper(UserRegistration request)
        {
            User user = new User();

            user.FirstName = request.FirstName;
            user.LastName = request.LastName;
            user.DateOfBirth = request.DateOfBirth;
            user.UserType = (int)Constants.UserRole.User;
            user.Gender = request.Gender;
            user.EmailId = request.EmailId;
            user.PasswordHashed = request.Password;
            user.CreatedAt = DateTime.Now;
            user.UpdatedAt = DateTime.Now;

            return user;
        }

        # endregion
    }
}
