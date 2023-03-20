using System;
using System.Collections.Generic;

namespace User_JWT_Authorization.Models;

public partial class User
{
    public int Id { get; set; }

    public string FirstName { get; set; } = null!;

    public string? LastName { get; set; }

    public string Gender { get; set; } = null!;

    public DateTime? DateOfBirth { get; set; }

    public string EmailId { get; set; } = null!;

    public string PasswordHashed { get; set; } = null!;

    public int UserType { get; set; }

    public DateTime? CreatedAt { get; set; }

    public DateTime? UpdatedAt { get; set; }
}
