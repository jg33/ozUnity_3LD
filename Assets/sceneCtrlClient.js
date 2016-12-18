#pragma strict

public var connectionIP:String = "127.0.0.1";
public var portNumber:int = 16261;
private var connected:boolean = false;
var timeout: int = 300;

public var cueComponent:cueSystem;
//public var scenes:GameObject;
var numScenes:int = 3;
public var currentCue:int = 0;
@HideInInspector public var prevCue:int =0;

private var moviePosition:float = 0f;
private var currentEventCue:int = 0;

@HideInInspector
var sceneArray: List.<GameObject> ;
private var canvasObject:GameObject;
var timeoutCounter: int;

private var forcePassive: boolean;
private var camObj: GameObject;

private var messageText:String[] = new String[10];
private var currentTextSelection: int = 0;

private var transitionSpeed : int =1;

public var disconnectedTimeout: int = 100;
private var disconnectedTimer: int = 0;

private var imageTargetX: float = 0;
private var imageTargetY: float = 0;
private var imageTargetZ: float = 0;



// one-shot events that fire on cue or never //
enum TriggeredEvents{ MOE_VIDEO, RANDOM_RAINBOW, TORNADO_ALERT, APPLAUSE, AWW, NO_PLACE };

function Awake(){
	DontDestroyOnLoad (this);
}


function Start () {

	Screen.sleepTimeout = SleepTimeout.NeverSleep;
	Network.Connect (connectionIP, portNumber);

	
	setupText();
	


}

function Update () {
	// Gotta make sure the obb loads!
	#if UNITY_ANDROID
	if (connected && PlayerPrefs.GetInt("readyToEnter",0)==1){

	#elif UNITY_IOS
	if (connected){	
	#endif
		
		forcePassive = cueComponent.forcePassive;
				
		  if (Application.loadedLevel != 2 && !forcePassive){ //if connected and in the show, jump on in!
			//GameObject.Destroy(GameObject.Find("Camera Container"));
			//yield WaitForSeconds(1);
			GameObject.Find("Camera Container").SendMessage("setTightTracking", false);
//			GameObject.Find("Look Up").GetComponent(Renderer).enabled = true;

			Debug.Log("Connected! Loading Active Mode!");
			Application.LoadLevel(2);
			currentCue = -1; //force scene refresh
			camObj = GameObject.Find("Camera");
			var realTarget:GameObject = GameObject.Find("RealImageTarget");
			if(realTarget) realTarget.SendMessage("updateTargetPos");


		
		} else if(Application.loadedLevel == 1 && forcePassive){ //if connected and in passive mode show connected text
			var alert:GameObject = GameObject.Find("InstructionAlertText");
			alert.GetComponent(UI.Text).text = "You are now connected. Enjoy the Show!";
			var alertPanel:GameObject = GameObject.Find("InstructionAlertPanel");
			alertPanel.GetComponent(UI.Image).color = Color(0.1,0.733,0.3);
			
//			GameObject.Find("ConnectedLight").SendMessage("setConnected", true);

		} else if (forcePassive && Application.loadedLevel != 1){
			//GameObject.Destroy(GameObject.Find("Camera Container"));
			//yield WaitForSeconds(1);
			GameObject.Find("Camera Container").SendMessage("setTightTracking", true);			
//			GameObject.Find("Look Up").GetComponent(Renderer).enabled = false;

			Application.LoadLevel(1);

		} 

		/// cue control ///
		if (cueComponent.cueNumber != currentCue && Application.loadedLevel == 2){
			transitionSpeed = cueComponent.transitionSpeed;
			setActiveScene(cueComponent.cueNumber.ToString());
			GameObject.Find("RealImageTarget").SendMessage("updateTargetPos");


		} else if (cueComponent.cueNumber == 1 && Application.loadedLevel == 2 && !GameObject.Find("Scene1")){
			setActiveScene("1"); // emergency backup goto 1
		}



		/// Event Cueing ///
		if (cueComponent.tempEventTriggers != currentEventCue){
			currentEventCue = cueComponent.tempEventTriggers;
		
				switch( currentEventCue ){
						case 1:
							cueComponent.playMovie("judyInterview");
							Debug.Log("judyInterview!");
	
						break;
				
						case 2:
							cueComponent.playMovie("NoPlaceLikeMoe");
							Debug.Log("no place!");

						break;
				
						case 3:
							cueComponent.stopMovie();
							cueComponent.stopAudio();
						break;
						
						case 4:
							cueComponent.playAudio("noPlace");
							Debug.Log("no place audio!");

						break;
						
						case 5:				
							cueComponent.playMovie("randomRainbow");
							Debug.Log("random rainbow!");

						break;
						
						case 6:
							cueComponent.playMovie("copyright");
							Debug.Log("copyright video!");
						break;
						
						case 7:
							//Animate Sepia -> Color
							GameObject.Find("Camera").GetComponent.<Animator>().SetBool("isSepia", false);

						break;
						
						case 8:
							cueComponent.playMovie("tvStatic");
							Debug.Log("Static!");
							break;
						
						case 9:
							cueComponent.playMovie("scratches");
							Debug.Log("scratches!");
							break;

						case 10:
							setCompletedShow();
						break;
						
						case 11:
							cueComponent.playAudio("munchkinLaugh");
							Debug.Log("munchkinLaugh!");
						break;
						
						
						case 12:
							cueComponent.playMovie("ozFace");
							Debug.Log("ozFace!");
						break;	
						
						case 13:
							cueComponent.playAudio("frogs1");
							Debug.Log("frogs!");						
						break;
						
						
						case 14:
							cueComponent.playAudio("drums1");
							Debug.Log("drums1!");	
						break;
						
						case 15:
							cueComponent.playAudio("drums2");
							Debug.Log("drums2!");	
						break;

						case 16:
							cueComponent.playMovie("FireBall");
							Debug.Log("FireBall!");	
						break;

						case 17:
							//Animate Camera -> Glitch
							GameObject.Find("Camera").GetComponent.<Animator>().SetBool("isGlitch", true);
						break;

						case 18:
							//Animate Camera -> Glitch OFF CALLED WITH "THE END"
							GameObject.Find("Camera").GetComponent.<Animator>().SetBool("isGlitch", false);
						break;
						
						default: 
						break;
						

					  
					
					}

		}
		
		
		/// Text Cueing ///
		if (cueComponent.textSelection != currentTextSelection && Application.loadedLevel == 2 &&currentCue ==1){
			var msg:GameObject = GameObject.Find("Message");
//			var msgTxt: UI.Text = msg.GetComponent(UI.Text);
			currentTextSelection = cueComponent.textSelection;
//			msgTxt.text = messageText[currentTextSelection];
			
			if(msg) msg.SendMessage("changeText", messageText[currentTextSelection]);
			Debug.Log("Text Changed!");

//			if (messageText[currentTextSelection].Length>140){
//				//msg.transform.GetComponent(RectTransform).anchorMin = Vector2(0,-400);
//				//msg.transform.GetComponent(RectTransform).anchorMax = Vector2(0,800);
//			} else {
//				//msg.transform.GetComponent(RectTransform).anchorMin = Vector2(0,-150);
//				//msg.transform.GetComponent(RectTransform).anchorMax = Vector2(0,300);
//			}
		}
		
		/// Movie Sync ///
		if(cueComponent.moviePosition != moviePosition && camObj != null){
			moviePosition = cueComponent.moviePosition;
			camObj.SendMessage("syncToPosition", moviePosition, SendMessageOptions.DontRequireReceiver);	
			
			//Debug.Log("sync to: " + moviePosition);
		} else if (camObj == null){
			camObj = GameObject.Find("Camera");

		}
		
		
		/// Image Target Sync ///
		if(imageTargetX != cueComponent.imageTargetX){
			imageTargetX = cueComponent.imageTargetX;
			GameObject.Find("RealImageTarget").SendMessage("overrideTargetXPos",imageTargetX );
		}
		if(imageTargetY != cueComponent.imageTargetY){
			imageTargetY = cueComponent.imageTargetY;
			GameObject.Find("RealImageTarget").SendMessage("overrideTargetYPos",imageTargetY );

		}
		if(imageTargetZ != cueComponent.imageTargetZ){
			imageTargetZ = cueComponent.imageTargetZ;
			GameObject.Find("RealImageTarget").SendMessage("overrideTargetZPos",imageTargetZ );

		}
		
		
		
	} else{ //not connected
	
		if(Application.loadedLevel ==0){
			#if UNITY_ANDROID
			if(PlayerPrefs.GetInt("readyToEnter",0)==1){
				Application.LoadLevel(1);

			}
			#elif UNITY_IOS
			Application.LoadLevel(1);
			#endif
		
		} else if (Application.loadedLevel == 2 ){ //if in active mode and disconnected, try to connect!
			
			if(disconnectedTimer > disconnectedTimeout){ //timeout connection, kick to passive
				disconnectedTimer = 0;

				Debug.Log("Disconnected! Loading Passive Mode! :'(");
				GameObject.Find("Camera Container").SendMessage("setTightTracking", true);
				Application.LoadLevel(1);
				reset();
				
				var alert2:GameObject = GameObject.Find("InstructionAlertText");
				if (alert2) alert2.GetComponent(UI.Text).text = "Are you at the theater? Tap here to set up your phone for the show.";
				var alertPanel2:GameObject = GameObject.Find("InstructionAlertPanel");
				if(alertPanel2) alertPanel2.GetComponent(UI.Image).color = Color(1,1,1);
			
			} else {
				Debug.Log("Disconnected for "+disconnectedTimer+"/"+disconnectedTimeout);
				if(disconnectedTimer%30 == 0){ 
					Network.Connect (connectionIP, portNumber); //try really hard to reconnect
					Debug.Log("trying to connect");
				}
				disconnectedTimer++;
			}

		}
	
	
		if(timeoutCounter> timeout){
			Network.Connect (connectionIP, portNumber);
			Debug.Log("Not Connected! "+ Network.peerType );
			timeoutCounter =0;
 			
 		} else if (timeoutCounter <= timeout){
			timeoutCounter++;
		} 
	

	}
}


function OnConnectedToServer(){
		Debug.Log ("Connected To Server");
		connected = true;
		disconnectedTimer = 0;

		if(Application.loadedLevel ==1){
			var alert:GameObject = GameObject.Find("InstructionAlertText");
			if (alert) alert.GetComponent(UI.Text).text = "You are now connected. Enjoy the Show!";
			var alertPanel:GameObject = GameObject.Find("InstructionAlertPanel");
			if(alertPanel) alertPanel .GetComponent(UI.Image).color = Color(0.1,0.733,0.3);
		}
//		var indicatorAnimator: Animator = GameObject.Find("ConnectedLight").GetComponent(Animator);
//		indicatorAnimator.SetBool("connected", true);
//		GameObject.Find("ConnectedLight").SendMessage("setConnected", true);
	}

function OnDisconnectedFromServer(){
		Debug.Log ("Disconnected From Server");
		connected = false;
//		
//		var indicatorAnimator: Animator = GameObject.Find("ConnectedLight").GetComponent(Animator);
//		indicatorAnimator.SetBool("connected",false);

//		GameObject.Find("ConnectedLight").SendMessage("setConnected", false);
		if(Application.loadedLevel ==1){
			var alert:GameObject = GameObject.Find("InstructionAlertText");
			if(alert) alert.GetComponent(UI.Text).text = "Are you at the theater? Tap here to set up your phone for the show.";
			var alertPanel:GameObject = GameObject.Find("InstructionAlertPanel");
			if(alertPanel) alertPanel .GetComponent(UI.Image).color = Color(1,1,1);
		}
	}

function OnFailedToConnect(error: NetworkConnectionError){
		Debug.Log ("Failed to Connect: " + error);
		connected = false;
	}

function setActiveScene(newScene:String){

	Debug.Log("SETTING ACTIVE SCENE: " + newScene);
	prevCue = currentCue;
	currentCue = cueComponent.cueNumber;
	
	#if UNITY_IPHONE || UNITY_ANDROID
	if (currentCue != 0 &&  currentCue != 1) Handheld.Vibrate();
	#endif
	
	var i=parseInt(newScene);
	
	sceneArray = GameObject.Find("Scenes").GetComponent.<sceneList>().sceneArray;
	
	GameObject.Find("ConnectedLight").SendMessage("setConnected", true);

	if(i == 1){
		canvasObject = sceneArray[i];
		Debug.Log(sceneArray[i]);
		canvasObject.SetActive(true);
//		animation["UIFadeIn"].speed = transitionSpeed;
		canvasObject.GetComponent(Animation).Play("UIFadeIn");
	
		yield WaitForSeconds(canvasObject.GetComponent(Animation).clip.length+3);
		GameObject.Find("Camera Container").SendMessage("resetTracking");

		for (var j = 0; j< sceneArray.Count  ;j++){ //turn off the rest
			if(j!=i){
				canvasObject = sceneArray[j];
				if (canvasObject) canvasObject.SetActive(false);
			}
		}
		
	} else if (i==2 || i==7){
		canvasObject = sceneArray[i];
		Debug.Log(sceneArray[i]);
		canvasObject.SetActive(true);
		
		canvasObject = sceneArray[prevCue];
		canvasObject.GetComponent(Animation).Play("UIFadeOut");
		GameObject.Find("Camera Container").SendMessage("resetTracking");

		yield WaitForSeconds(canvasObject.GetComponent(Animation).clip.length+3);
		for (j = 0; j< sceneArray.Count  ;j++){ //turn off the rest
			if(j!=i){
				canvasObject = sceneArray[j];
				if(canvasObject) canvasObject.SetActive(false);
			}
		}
		
	
	
	}else if(i>2){
		canvasObject = sceneArray[i];
		Debug.Log(sceneArray[i]);
		canvasObject.SetActive(true);
		
		canvasObject = sceneArray[prevCue];
//		animation["UIFadeOut"].speed = transitionSpeed;
		canvasObject.GetComponent(Animation).Play("UIFadeOut");
		GameObject.Find("Camera Container").SendMessage("resetTracking");
		
		var lookupAni: Animator = GameObject.Find("Look Up").GetComponent(Animator);
		lookupAni.SetTrigger("goLookUp");
		
		yield WaitForSeconds(canvasObject.GetComponent(Animation).clip.length+3);
		for (j = 0; j< sceneArray.Count  ;j++){ //turn off the rest
			if(j!=i){
				canvasObject = sceneArray[j];
				if(canvasObject) canvasObject.SetActive(false);
			}
		}
		

		
	
	} else if (i==0){
		for (j = 0; j< sceneArray.Count  ;j++){
			canvasObject = sceneArray[j];
//			canvasObject.GetComponent(Animation).Play("UIFadeOut");
			canvasObject.SetActive(false);
		}
		canvasObject = sceneArray[0];
		canvasObject.SetActive(true);
		GameObject.Find("Camera Container").SendMessage("resetTracking");

	}

}


function handleEvent(state:TriggeredEvents){
	switch (state){
		case (TriggeredEvents.APPLAUSE):
		
		break;
		
		
		default:
		Debug.Log("unknown state: "+ state);
		break;

	}

}

function setupText(){

	messageText[0]= " ";
	messageText[1]= " ";
	messageText[2]= "App ready... Please wait.";
	messageText[3]= "'Ding Dong' reached number 2 in the UK Singles Chart following the death of Margaret Thatcher on 8 April 2013.";
	messageText[4]= "Which";
	messageText[5]= "Golden Snitch";
	messageText[6]= "Scratch an itch";
	messageText[7]= "In economics, bimetallism is a monetary standard in which the value of the monetary unit is defined. ";
	messageText[8]= "There's only one way to succeed in this business. Step on those guys. Gouge their eyes out. Trample on them. Kick them in the balls. You'll be a smash.";
	messageText[9]= "Scratch an itch";

}


function reset(){
	currentCue = 0;
	currentTextSelection = 0;
}

function setCompletedShow(){
	
	PlayerPrefs.SetInt("CompletedShow",1);
	PlayerPrefs.Save();

}
