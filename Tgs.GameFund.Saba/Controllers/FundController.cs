using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Tgs.GameFund.Saba.ViewModel;
using Tgs.GameInterface.SabaService.Client;
using Tgs.GameInterface.SabaService.Protos;

namespace Tgs.GameFund.Saba.Controllers;

[ApiController]
[Route("[controller]")]
public class FundController : ControllerBase
{
	/// <summary>
	/// Funds the transfer saba status asynchronous.
	/// </summary>
	/// <param name="client">The client.</param>
	/// <param name="source">The source.</param>
	/// <returns></returns>
	/// <remarks>
	/// <b>Example</b><br />
	///
	///     我方訂單號:32fd88b0-8401-0000-0001-0000010a3742
	///     遊戲廠商訂單號:tg_32fd88b08401000000010000010a3742
	///     OrderId:32fd88b08401000000010000010a3742
	///
	///     Post
	///
	///         {
	///             "apiUrl": "http://h0i2tsa.bw6688.com/",
	///             "operatorId": "tg",
	///             "vendorId": "um5vspnzkx",
	///             "orderId": "32fd88b08401000000010000010a3742"
	///         }
	/// </remarks>
	[HttpPost("status")]
	public ValueTask<FundStatusReply> FundStatusAsync(
		[FromServices] IGameInterfaceSabaClient client,
		GameFundStatusViewModel source)
		=> client.FundStatusAsync(
			apiUrl: source.ApiUrl,
			operatorId: source.OperatorId,
			vendorId: source.VendorId,
			orderId: source.OrderId,
			cancellationToken: HttpContext.RequestAborted);
}
