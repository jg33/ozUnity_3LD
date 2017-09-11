function process(input){
	
	var splitStr = input.split('/');
	
	for(i=1;i<splitStr.length;i++){
		
		var oscCmd = '/'+splitStr[i];
		outlet(0, oscCmd);
	}
	
}