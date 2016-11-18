﻿using UnityEngine;
using System.Collections;

enum TriggeredEvents{ MOE_VIDEO, RANDOM_RAINBOW, TORNADO_ALERT, APPLAUSE, AWW, NO_PLACE };


public class OzOscReceiver : MonoBehaviour {

	/// OSC Stuff ///
	public string RemoteIP = "127.0.0.1"; //127.0.0.1 signifies a local host (if testing locally
	public int SendToPort = 9000; //the port you will be sending from
	public int ListenerPort = 8050; //the port you will be listening on
	private Osc handler;
	//public var controller : Transform;
	//public var gameReceiver = "Cube"; //the tag of the object on stage that you want to manipulate
	
	
	/// Game Objects ///
	public cueSystem cueControl;
	public float damping;

	public int currentCue;
	public int tornadoState;
	public int poppyState;
	public int munchkinState;
	public int monkeyState;
	public int textSelection;

	// one-shot events that fire on cue or never //

	private UnityEngine.UI.Slider tornadoSlider;
	private UnityEngine.UI.Slider munchkinSlider;
	private UnityEngine.UI.Slider poppySlider;
	private UnityEngine.UI.Slider monkeySlider;
	private UnityEngine.UI.Slider fireSlider;
	private UnityEngine.UI.Slider transSpeedSlider;

	private NetworkView nv;
	private bool flagTextSend = false;
	private string textToSend;

	private bool flagAudioSend = false;
	private string audioToSend;

	private bool flagWikiSend = false;
	private string wikiHeaderToSend;
	private string wikiBodyToSend;

	private bool flagTextColorSend = false;
	private Color textColorToSend;

	private bool flagRandomTextSend = false;
	private string randomTextBundle;

	private bool flagSetAudioLoop = false;
	private bool audioLoopSend;

	private bool flagAudioDelaySend = false;
	private float minAudioDelay=0;
	private float maxAudioDelay=0;
	private bool flagAudioDelayLoopSend = false;
	private int delayAudioLoops;



	private float currentTime;

	public void Start ()
	{
		//Initializes on start up to listen for messages
		//make sure this game object has both UDPPackIO and OSC script attached
		
		UDPPacketIO udp = (UDPPacketIO)GetComponent("UDPPacketIO");
		udp.init(RemoteIP, SendToPort, ListenerPort);
		handler = (Osc)GetComponent("Osc");
		handler.init(udp);
		handler.SetAllMessageHandler(AllMessageHandler);


		tornadoSlider = GameObject.Find("Tornado Slider").GetComponent<UnityEngine.UI.Slider>();
		munchkinSlider = GameObject.Find("Munchkin Slider").GetComponent<UnityEngine.UI.Slider>();
		poppySlider = GameObject.Find("Poppy Slider").GetComponent<UnityEngine.UI.Slider>();
		monkeySlider = GameObject.Find("Monkey Slider").GetComponent<UnityEngine.UI.Slider>();
		fireSlider = GameObject.Find("Fire Slider").GetComponent<UnityEngine.UI.Slider>();
		transSpeedSlider = GameObject.Find("Transition Slider").GetComponent<UnityEngine.UI.Slider>();


		nv = GameObject.Find("Network").GetComponent<NetworkView>();

		Debug.Log("Osc Running");
		
	}
	
	public void Update () {
		
		///Send RPC?///
		if(flagTextSend){
			nv.RPC("setTextRemote", RPCMode.All, textToSend);
			flagTextSend = false;
		}
		if (flagAudioSend){
			nv.RPC("stopAudio", RPCMode.All);
			nv.RPC("playAudio", RPCMode.All , audioToSend);
			flagAudioSend = false;
		}

		if (flagWikiSend){		
			nv.RPC("setWiki", RPCMode.All, wikiHeaderToSend, wikiBodyToSend);
			flagWikiSend = false;
		}

		if (flagTextColorSend){			
			nv.RPC("setTextColor", RPCMode.All, textColorToSend.r,  textColorToSend.g,  textColorToSend.b);
			flagTextColorSend = false;
		}

		if (flagRandomTextSend){
			nv.RPC("sendRandomText", RPCMode.All, randomTextBundle);
			flagRandomTextSend = false;
		}

		if (flagSetAudioLoop){
			nv.RPC("setAudioLoop", RPCMode.All, audioLoopSend);
			flagSetAudioLoop = false;
		}

		if (flagAudioDelaySend){
			nv.RPC("stopAudio", RPCMode.All);
			nv.RPC("playAudioWithDelay", RPCMode.All, audioToSend, minAudioDelay, maxAudioDelay);
			flagAudioDelaySend = false;
		}

		if (flagAudioDelayLoopSend){
			nv.RPC("stopAudio", RPCMode.All);
			nv.RPC("loopAudioWithDelay", RPCMode.All, audioToSend, minAudioDelay, maxAudioDelay, delayAudioLoops);
			flagAudioDelayLoopSend = false;
		}


		
		currentTime = Time.time;
	}
	
	
	
	//These functions are called when messages are received
	//Access values via: oscMessage.Values[0], oscMessage.Values[1], etc
	
	public void AllMessageHandler(OscMessage oscMessage){

		string msgString = Osc.OscMessageToString(oscMessage); //the message and value combined
		string msgAddress = oscMessage.Address; //the message parameters
		Debug.Log(msgString); //log the message and values coming from OSC
		
		//FUNCTIONS YOU WANT CALLED WHEN A SPECIFIC MESSAGE IS RECEIVED
		if(oscMessage.Values.Count>0){ // only fire if we've got values.
			switch (msgAddress){
		
			case "/cue":
				int cue = (int)oscMessage.Values[0];
				cueControl.cueNumber = cue;

				break;
			case "/triggerEvent":
				int eventID = (int)oscMessage.Values[0];
				Debug.Log ("Event! " + eventID);
				cueControl.tempEventTriggers = eventID;
				break;


			case "/selectText":
				cueControl.textSelection = (int)oscMessage.Values[0];
				Debug.Log("select text");
				break;	

			case "/sendText":
				textToSend = (string) oscMessage.Values[0];
				flagTextSend = true;
				break;

			case "/tornadoState":
				cueControl.tornadoState = (int)oscMessage.Values[0];
			//	tornadoSlider.value =  (int)oscMessage.Values[0];
				break;
			case "/munchkinState":
				cueControl.munchkinState = (int)oscMessage.Values[0]; 

				//	munchkinSlider.value =  (int)oscMessage.Values[0];
				break;

			case "/poppyState":
				cueControl.poppyState = (int)oscMessage.Values[0];
			//	poppySlider.value =  (int)oscMessage.Values[0];

				break;

			case "/monkeyState":
				cueControl.monkeyState = (int)oscMessage.Values[0];
			//	monkeySlider.value =  (int)oscMessage.Values[0];

				break;
			case "/fireState":
				cueControl.fireState = (int)oscMessage.Values[0];
			//	fireSlider.value =  (int)oscMessage.Values[0];

				break;
			case "/forcePassive":
				if((int)oscMessage.Values[0] == 1){
					cueControl.forcePassive = true;
				} else {
					cueControl.forcePassive = false;
				}
				break;

			case "/transitionSpeed":
				cueControl.transitionSpeed = (float)oscMessage.Values[0];
				break;

			case "/playAudio":
				audioToSend = (string) oscMessage.Values[0];
				flagAudioSend = true;

				break;

			case "/targetPosition":
				cueControl.imageTargetX = (float)oscMessage.Values[0];
				cueControl.imageTargetY = (float)oscMessage.Values[1];
				cueControl.imageTargetZ = (float)oscMessage.Values[2];
				break;

			case "/ping":
				Debug.Log("ping at: "+ currentTime );
				break;

			case "/sendWikiText":
				wikiHeaderToSend = (string) oscMessage.Values[0];
				wikiBodyToSend = (string) oscMessage.Values[1];
				flagWikiSend = true;

				break;

			case "/setTextColor":
				textColorToSend.r = (float)oscMessage.Values[0];
				textColorToSend.g = (float)oscMessage.Values[1];
				textColorToSend.b = (float)oscMessage.Values[2];
				Debug.Log (textColorToSend);
				flagTextColorSend = true;
				break;

			case "/sendRandomText":
				randomTextBundle = (string) oscMessage.Values[0];
				flagRandomTextSend = true;
				break;
			
			case "/setAudioLooping":
				if((int)oscMessage.Values[0] ==0){
					audioLoopSend = false;
				} else{
					audioLoopSend = true;
				}
				flagSetAudioLoop = true;
				break;

			case "/playAudioWithDelay":
				audioToSend = (string) oscMessage.Values[0];
				minAudioDelay = (float) oscMessage.Values[1];
				maxAudioDelay = (float) oscMessage.Values[2];
				flagAudioDelaySend = true;
				break;

			case "/loopAudioWithDelay":
				audioToSend = (string) oscMessage.Values[0];
				minAudioDelay = (float) oscMessage.Values[1];
				maxAudioDelay = (float) oscMessage.Values[2];
				delayAudioLoops = (int) oscMessage.Values[3];
				flagAudioDelayLoopSend = true;
				break;


			default:
				Debug.Log("unhandled osc: " + msgString );
				break;
			}
		}
	}


	


}
