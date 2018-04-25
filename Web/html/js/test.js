"use strict";

var wcrcABI = [{"constant":true,"inputs":[],"name":"purchaseCounter","outputs":[{"name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"name","outputs":[{"name":"","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[{"name":"_tokenId","type":"uint256"}],"name":"getApproved","outputs":[{"name":"","type":"address"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[{"name":"","type":"uint256"}],"name":"countries","outputs":[{"name":"name","type":"string"},{"name":"price","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"_to","type":"address"},{"name":"_tokenId","type":"uint256"}],"name":"approve","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[{"name":"","type":"uint256"}],"name":"initTokenData","outputs":[{"name":"","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"totalSupply","outputs":[{"name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"isEthPayable","outputs":[{"name":"","type":"bool"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"_from","type":"address"},{"name":"_to","type":"address"},{"name":"_tokenId","type":"uint256"}],"name":"transferFrom","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"name":"_newCOO","type":"address"}],"name":"setCOO","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[{"name":"_owner","type":"address"}],"name":"getTokenByOwner","outputs":[{"name":"","type":"uint256[]"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"cap","outputs":[{"name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"finalCap","outputs":[{"name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"_tokenId","type":"uint256"}],"name":"purchaseWithToken","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[],"name":"unpause","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"name":"_from","type":"address"},{"name":"_to","type":"address"},{"name":"_tokenId","type":"uint256"}],"name":"safeTransferFrom","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[],"name":"sysFeePermillage","outputs":[{"name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[],"name":"claimOwnership","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[{"name":"_tokenId","type":"uint256"}],"name":"exists","outputs":[{"name":"","type":"bool"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"paused","outputs":[{"name":"","type":"bool"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[],"name":"withdrawBalance","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[{"name":"_tokenId","type":"uint256"}],"name":"ownerOf","outputs":[{"name":"","type":"address"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[{"name":"_owner","type":"address"}],"name":"balanceOf","outputs":[{"name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[],"name":"pause","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[],"name":"owner","outputs":[{"name":"","type":"address"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"symbol","outputs":[{"name":"","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"_to","type":"address"},{"name":"_approved","type":"bool"}],"name":"setApprovalForAll","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[],"name":"cooAddress","outputs":[{"name":"","type":"address"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"_tokenId","type":"uint256"}],"name":"purchaseWithEth","outputs":[],"payable":true,"stateMutability":"payable","type":"function"},{"constant":true,"inputs":[],"name":"initPrice","outputs":[{"name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"_from","type":"address"},{"name":"_to","type":"address"},{"name":"_tokenId","type":"uint256"},{"name":"_data","type":"bytes"}],"name":"safeTransferFrom","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[],"name":"payerContract","outputs":[{"name":"","type":"address"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"increasePermillage","outputs":[{"name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"pendingOwner","outputs":[{"name":"","type":"address"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[{"name":"_owner","type":"address"},{"name":"_operator","type":"address"}],"name":"isApprovedForAll","outputs":[{"name":"","type":"bool"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"newOwner","type":"address"}],"name":"transferOwnership","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[{"name":"_tokenId","type":"uint256"}],"name":"getTokenNextPrice","outputs":[{"name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"inputs":[{"name":"_initPrice","type":"uint256"},{"name":"_cap","type":"uint256"},{"name":"_isEthPayable","type":"bool"},{"name":"_address","type":"address"}],"payable":false,"stateMutability":"nonpayable","type":"constructor"},{"anonymous":false,"inputs":[{"indexed":true,"name":"_from","type":"address"},{"indexed":true,"name":"_to","type":"address"},{"indexed":false,"name":"_tokenId","type":"uint256"},{"indexed":false,"name":"_tokenPrice","type":"uint256"},{"indexed":false,"name":"_timestamp","type":"uint256"},{"indexed":false,"name":"_purchaseCounter","type":"uint256"}],"name":"PurchaseToken","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"name":"_from","type":"address"},{"indexed":true,"name":"_to","type":"address"},{"indexed":false,"name":"_tokenId","type":"uint256"}],"name":"Transfer","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"name":"_owner","type":"address"},{"indexed":true,"name":"_approved","type":"address"},{"indexed":false,"name":"_tokenId","type":"uint256"}],"name":"Approval","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"name":"_owner","type":"address"},{"indexed":true,"name":"_operator","type":"address"},{"indexed":false,"name":"_approved","type":"bool"}],"name":"ApprovalForAll","type":"event"},{"anonymous":false,"inputs":[],"name":"Pause","type":"event"},{"anonymous":false,"inputs":[],"name":"Unpause","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"name":"previousOwner","type":"address"},{"indexed":true,"name":"newOwner","type":"address"}],"name":"OwnershipTransferred","type":"event"}];

var contractAddress = "0x33781ce90584696A52E6f39977768D0BC7844A0C";

var worldcupTypeERC20ContractAddress = "0x5E684930BCC3690e29322Fe4Cf550F74035164Bf";


var payerABI = [{"constant":true,"inputs":[],"name":"name","outputs":[{"name":"","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"_spender","type":"address"},{"name":"_value","type":"uint256"}],"name":"approve","outputs":[{"name":"","type":"bool"}],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[],"name":"totalSupply","outputs":[{"name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"_from","type":"address"},{"name":"_to","type":"address"},{"name":"_value","type":"uint256"}],"name":"transferFrom","outputs":[{"name":"","type":"bool"}],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[],"name":"INITIAL_SUPPLY","outputs":[{"name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"decimals","outputs":[{"name":"","type":"uint8"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[{"name":"_owner","type":"address"}],"name":"balanceOf","outputs":[{"name":"balance","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"symbol","outputs":[{"name":"","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"_to","type":"address"},{"name":"_value","type":"uint256"}],"name":"transfer","outputs":[{"name":"","type":"bool"}],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[{"name":"_owner","type":"address"},{"name":"_spender","type":"address"}],"name":"allowance","outputs":[{"name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"inputs":[],"payable":false,"stateMutability":"nonpayable","type":"constructor"},{"anonymous":false,"inputs":[{"indexed":true,"name":"owner","type":"address"},{"indexed":true,"name":"spender","type":"address"},{"indexed":false,"name":"value","type":"uint256"}],"name":"Approval","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"name":"from","type":"address"},{"indexed":true,"name":"to","type":"address"},{"indexed":false,"name":"value","type":"uint256"}],"name":"Transfer","type":"event"}];
var payerERC20ContractAddress = "0xff620c44727c2af9a705598eb6781592986fc0a9";


// ccethereumjs
(function(){
	
	function CCEthereum(_wcrcABI, _contractAddress, _payerABI, _payerERC20ContractAddress) {
		//console.log(this.cname);
		this.wcrcABI = _wcrcABI;
		
		this.contractAddress = _contractAddress;

		this.worldcupContract;

		this.payerABI = _payerABI;

		this.payerERC20ContractAddress = _payerERC20ContractAddress;

		this.payerContract;
		
		this.web3js;

		this.userAccount;

		this.connectMetaMask = () => {
			if (typeof web3 !== 'undefined') {
		        // Use Mist/MetaMask's provider
				if (typeof web3.eth.defaultAccount !== 'undefined') {
					this.userAccount = web3.eth.defaultAccount;
					this.web3js = new Web3(web3.currentProvider);
					this.worldcupContract  = new this.web3js.eth.Contract(this.wcrcABI, this.contractAddress);

					if (typeof _payerABI !== 'undefined' && typeof _payerERC20ContractAddress !== 'undefined') {
						this.payerContract  = new this.web3js.eth.Contract(this.payerABI, this.payerERC20ContractAddress);
					}
					return true;
				}else {
					return new Error(-2);
				}

		    } else {
		        // Handle the case where the user doesn't have Metamask installed
		        // Probably show them a message prompting them to install Metamask
		        //web3js = new Web3(new Web3.providers.HttpProvider("http://127.0.0.1:8545"));
		        return new Error(-1);
		    }
		};

		this.balanceOf = function(_address) {
			return this.worldcupContract.methods.balanceOf(_address).call();
		}

		this.cap = function() {
			return this.worldcupContract.methods.cap().call();
		}	

		this.finalCap = function() {
			return this.worldcupContract.methods.finalCap().call();
		}

		this.initPrice = function() {
			return this.worldcupContract.methods.initPrice().call();
		}

		this.increasePermillage = function() {
			return this.worldcupContract.methods.increasePermillage().call();
		}

		this.sysFeePermillage = function() {
			return this.worldcupContract.methods.sysFeePermillage().call();
		}

		this.totalSupply = function() {
			return this.worldcupContract.methods.totalSupply().call();
		}

		this.payerContract = function() {
			return this.worldcupContract.methods.payerContract().call();
		}

		this.getTokenNextPrice = function(_tokenId) {
			return this.worldcupContract.methods.getTokenNextPrice(_tokenId).call();
		}

		/// @dev Buy token
		/// @param _money  Use the ETH as a uint.
		this.purchaseWithEth = function(_tokenId, _money) {
			return this.worldcupContract.methods.purchaseWithEth(_tokenId).send( {from: this.userAccount, value: this.web3js.utils.toWei(_money,"ether")} );
		}

		this.queryAllowance = function() {
			return this.payerContract.methods.allowance(this.userAccount, this.contractAddress).call();
		}

		this.prepareForPurchaseWithToken = function(_amount) {
			return this.payerContract.methods.approve(this.contractAddress, _amount).send( {from: this.userAccount} );
		}

		/// @dev Buy token
		/// @param _money  Use the ETH as a uint.
		this.purchaseWithToken = function(_tokenId) {
			return this.worldcupContract.methods.purchaseWithToken(_tokenId).send( {from: this.userAccount} );
		}

	};

	window.CCEthereum = CCEthereum;
})();

///////////// Demo 1
var ccethereum = new CCEthereum(wcrcABI, contractAddress);
var result = ccethereum.connectMetaMask();
if(result === true) {
	console.log("connected success~");

	// example 1
	ccethereum.purchaseWithEth(0, "0.00001").on('receipt', function(receipt) {
		console.log(receipt);
	}).catch(function(err) {
		console.error(err);
	});

	// example 2
	ccethereum.getTokenNextPrice(0).then(console.log).catch(console.log);

}else {
	console.log("connected faild: " + result.message);
}


///////////// Demo 2
ccethereum = new CCEthereum(wcrcABI, worldcupTypeERC20ContractAddress, payerABI, payerERC20ContractAddress);
result = ccethereum.connectMetaMask();
if(result === true) {
	console.log("connected success~");
	// example 1
	ccethereum.queryAllowance().then(function(value){
		if (value > 100000000) {
			ccethereum.purchaseWithToken(0).on('receipt', function(receipt) {
				console.log(receipt);
			}).catch(function(err) {
				console.error(err);
			});
		}else {
			ccethereum.prepareForPurchaseWithToken("100000000000000000").on('receipt', function(receipt) {
				console.log(receipt);
				ccethereum.purchaseWithToken(0).on('receipt', function(receipt) {
					console.log(receipt);
				}).catch(function(err) {
					console.error(err);
				});
			}).catch(function(err) {
					console.error(err);
			});
		}
	});

}else {
	console.log("connected faild: " + result.message);
}



