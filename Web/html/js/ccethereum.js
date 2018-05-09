"use strict";
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

		this.getTokenByOwner = function() {
			return this.worldcupContract.methods.getTokenByOwner(this.userAccount).call();	
		}

		this.getTokenPriceListByIds = function(_ids) {
			return this.worldcupContract.methods.getTokenPriceListByIds(_ids).call();
		}

		/// @dev Buy token
		/// @param _money  Use the ETH as a unit.
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
		/// @param _money  Use the ERC20 accurate unit.
		this.purchaseWithToken = function(_tokenId) {
			return this.worldcupContract.methods.purchaseWithToken(_tokenId).send( {from: this.userAccount} );
		}

	};

	window.CCEthereum = CCEthereum;
})();