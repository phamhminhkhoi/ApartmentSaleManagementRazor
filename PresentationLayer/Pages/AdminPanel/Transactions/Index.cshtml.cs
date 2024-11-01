using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using BusinessObjectLayer;
using ServiceLayer.Interfaces;
using BusinessObjectLayer.Model;

namespace PresentationLayer.Pages.Transactions
{
    public class IndexModel : PageModel
    {
        private readonly ITransactionService _transactionService;
        private readonly ITransactionDetailService _transactionDetailService;
        private readonly IMemberService _memberService;
        private readonly IPropertyService _propertyService;


        public IndexModel(ITransactionService transactionService, ITransactionDetailService transactionDetailService, IMemberService memberService, IPropertyService propertyService )
        {
            this._transactionService = transactionService;
            this._transactionDetailService = transactionDetailService;
            this._memberService = memberService;
            this._propertyService = propertyService;
        }

        public IList<TransactionDetailViewModel> Transaction { get;set; } = default!;

        public async Task OnGetAsync()
        {
            var transactionsDetail = _transactionDetailService.GetAllTransactionDetails();
            var AttributesToList = new List<TransactionDetailViewModel>();
            if(transactionsDetail != null)
            {
                foreach (var transactionDetail in transactionsDetail) {
                    var transaction = _transactionService.GetTransactionById(transactionDetail.TransactionId);
                    var userSell = _memberService.GetSellerById(transaction.SellerId);
                    
                    var userBuy = _memberService.GetBuyerById(transaction.BuyerId);
                    var property = _propertyService.GetPropertyById(transactionDetail.PropertyId);

                    AttributesToList.Add(new TransactionDetailViewModel 
                    {
                        PropertyName = property.PropertyName,
                        Price = property.Price,
                        BuyerName = userBuy.FullName,
                        SellerName = userSell.FullName,
                        TransactionDate = transaction.TransactionDate.ToString("g"),
                        
                    
                    
                    });
                    

                }
                Transaction = AttributesToList;
            }
        }
    }
}
