using BusinessObjectLayer;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using ServiceLayer.Interfaces;

namespace PresentationLayer.Pages
{
    public class LoginModel : PageModel
    {
        private IMemberService _memberService { get; set; }

        public LoginModel(IMemberService memberService)
        {
            this._memberService = memberService;
        }
        public void OnPost()
        {
            string email = Request.Form["txtEmail"];
            string password = Request.Form["txtPassword"];
            Member member = _memberService.GetMemberByEmail(email);
            if (member != null && member.Password.Equals(password))
            {
                int roleId = member.RoleId;
				HttpContext.Session.SetString("RoleID", roleId.ToString());
				Response.Redirect("/AdminPanel/Admin");
			}
        }
    }
}
