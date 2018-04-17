// Start here
window.addEventListener('load', function() {
	
	//var web3 = new Web3();
	// 连接到以太坊节点
	//web3.setProvider(new Web3.providers.HttpProvider("http://127.0.0.1:8545"));
	web3 = new Web3(new Web3.providers.WebsocketProvider("wss://mainnet.infura.io/ws"));

	var account_one = web3.eth.accounts[0];

	console.log(account_one);

})