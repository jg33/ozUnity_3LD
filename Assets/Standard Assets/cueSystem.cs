using UnityEngine;
using System.Collections;

public class cueSystem : MonoBehaviour{
	public int cueNumber = 0;
	public int tempEventTriggers = 0;
	public float moviePosition = 0;
	public int textSelection = 0;
	public float transitionSpeed = 1;

	public int tornadoState;
	public int poppyState;
	public int munchkinState;
	public int monkeyState;
	public int fireState;

	public bool forcePassive = false;

	public float imageTargetX = 0;
	public float imageTargetY = 0;
	public float imageTargetZ = 0;


	NetworkView nv;

	private GameObject seqPlayer;

	public void Start(){

		nv = this.GetComponent<NetworkView>();
	}

	public void Update(){

		if (Network.isServer){
			if (Input.GetKeyDown (KeyCode.Space)   || Input.GetKeyDown (KeyCode.UpArrow) ) {
				cueNumber += 1;

			} else if (Input.GetKeyDown (KeyCode.DownArrow) || Input.GetKeyDown (KeyCode.PageDown) ){
				cueNumber -= 1;

			} else if (Input.GetKeyDown(KeyCode.Alpha1)){
				cueNumber = 1;
			} else if (Input.GetKeyDown(KeyCode.Alpha2)){
				cueNumber = 2;
			} else if (Input.GetKeyDown(KeyCode.Alpha3)){
				cueNumber = 3;
			} else if (Input.GetKeyDown(KeyCode.Alpha4)){
				cueNumber = 4;
			} else if (Input.GetKeyDown(KeyCode.Alpha5)){
				cueNumber = 5;
			} else if (Input.GetKeyDown(KeyCode.Alpha6)){
				cueNumber = 6;
			} else if (Input.GetKeyDown(KeyCode.Alpha7)){
				cueNumber = 7;
			} else if (Input.GetKeyDown(KeyCode.Alpha8)){
				cueNumber = 8;
			} else if (Input.GetKeyDown(KeyCode.Alpha9)){
				cueNumber = 9;
			} else if (Input.GetKeyDown(KeyCode.Alpha0)){
				cueNumber = 0;
			} else if (Input.GetKeyDown(KeyCode.Q)){
				tempEventTriggers = 1;
			} else if (Input.GetKeyDown(KeyCode.W)){
				tempEventTriggers = 2;
			} else if (Input.GetKeyDown(KeyCode.E)){
				tempEventTriggers = 3;
			} else if (Input.GetKeyDown(KeyCode.R)){
				tempEventTriggers = 4;
			} else if (Input.GetKeyDown(KeyCode.T)){
				tempEventTriggers = 5;
			} else if (Input.GetKeyDown(KeyCode.Y)){
				tempEventTriggers = 6;
			} else if (Input.GetKeyDown(KeyCode.Tab)){
				tempEventTriggers = 0;
			} else if (Input.GetKeyDown(KeyCode.M)){
			
			}

			else if (Input.GetKeyDown(KeyCode.P)){
				forcePassive = !forcePassive;
			} else if( Input.GetKeyDown(KeyCode.A) ){

				nv.RPC("vibrate", RPCMode.All);

			}
		}	

		if(!seqPlayer && cueNumber ==1){
			seqPlayer = GameObject.Find ("TexturePlayer");
		}
	}

	public void GUI(){
		GUILayout.Label (cueNumber.ToString ());
	}

	private void OnSerializeNetworkView (BitStream stream, NetworkMessageInfo info){
		if (stream.isWriting) {
			stream.Serialize (ref cueNumber);
			stream.Serialize (ref tempEventTriggers);
			stream.Serialize (ref forcePassive);
			stream.Serialize (ref moviePosition);
			stream.Serialize (ref textSelection);
			stream.Serialize (ref tornadoState);
			stream.Serialize (ref munchkinState);
			stream.Serialize (ref poppyState);
			stream.Serialize (ref monkeyState);
			stream.Serialize (ref fireState);
			stream.Serialize (ref imageTargetX);
			stream.Serialize (ref imageTargetY);



		} else {
			stream.Serialize (ref cueNumber);
			stream.Serialize (ref tempEventTriggers);
			stream.Serialize (ref forcePassive);
			stream.Serialize (ref moviePosition);
			stream.Serialize (ref textSelection);
			stream.Serialize (ref tornadoState);
			stream.Serialize (ref munchkinState);
			stream.Serialize (ref poppyState);
			stream.Serialize (ref monkeyState);
			stream.Serialize (ref fireState);
			stream.Serialize (ref imageTargetX);
			stream.Serialize (ref imageTargetY);

		}
	}

	[RPC] public void vibrate(){
		#if UNITY_IPHONE || UNITY_ANDROID
		Handheld.Vibrate();
		#endif
	}
	
	[RPC] public void playMovie(string clipName){
		GameObject cam = GameObject.Find ("Camera");

		if(Network.isClient && cam.GetComponent<Camera>() ){

			if (clipName == "randomRainbow") {
				Debug.Log ("randomRainbow");
				Random.seed = Time.frameCount;
				int rando = Random.Range (1, 7);
				string videoString = string.Format ("Video/rainbow_{0:00}.mp4", rando);
				#if UNITY_IPHONE
				Handheld.PlayFullScreenMovie (videoString, Color.black, FullScreenMovieControlMode.Hidden);
				#elif UNITY_ANDROID
					string path = Application.persistentDataPath + "/" + videoString;
					Debug.LogError( "The video path: " + path );
				Handheld.PlayFullScreenMovie( Application.persistentDataPath + "/" + videoString, Color.black, FullScreenMovieControlMode.Hidden);
				#endif
			}
				else if(clipName == "copyright"){
					Debug.Log("copyright");
				string videoString = string.Format ("Video/Youtube_Copyright.mp4", 0);
					#if UNITY_IPHONE
					Handheld.PlayFullScreenMovie(videoString, Color.black, FullScreenMovieControlMode.Hidden);
					#elif UNITY_ANDROID
					Handheld.PlayFullScreenMovie(videoString, Color.black, FullScreenMovieControlMode.Hidden);
					//string path = Application.persistentDataPath + "/" + videoString;
					//Debug.LogError( "The video path: " + path );
					//Handheld.PlayFullScreenMovie( Application.persistentDataPath + "/" + videoString, Color.black, FullScreenMovieControlMode.Hidden);
					#endif
			
			} 
			else if(clipName == "FireBall"){
				Debug.Log("FireBall");
				string videoString = string.Format ("Video/FireBall.mp4", 0);
					#if UNITY_IPHONE
					Handheld.PlayFullScreenMovie(videoString, Color.black, FullScreenMovieControlMode.Hidden);
					#elif UNITY_ANDROID
					Handheld.PlayFullScreenMovie(videoString, Color.black, FullScreenMovieControlMode.Hidden);
					//string path = Application.persistentDataPath + "/" + videoString;
					//Debug.LogError( "The video path: " + path );
					//Handheld.PlayFullScreenMovie( Application.persistentDataPath + "/" + videoString, Color.black, FullScreenMovieControlMode.Hidden);
					#endif

			}

			else if(clipName == "MoeTest"){
				cam.SendMessage("loadMovie", "MoeOzTest", SendMessageOptions.DontRequireReceiver);
				cam.SendMessage("gotoPosition", 0.01f, SendMessageOptions.DontRequireReceiver);
				cam.SendMessage("setNumLoops", 1);
				cam.SendMessage("setLooping", false);
				cam.SendMessage("Play", SendMessageOptions.DontRequireReceiver);
				Debug.Log("MoeTest");

			} else if(clipName == "kazoo"){
				cam.SendMessage("loadMovie", "rainbowAudioTest", SendMessageOptions.DontRequireReceiver);
				cam.SendMessage("setNumLoops", 1);
				cam.SendMessage("setLooping", false);
				cam.SendMessage ("setLastFrame", 1968);
				cam.SendMessage("gotoPosition", 0.01f, SendMessageOptions.DontRequireReceiver);
				cam.SendMessage("Play", SendMessageOptions.DontRequireReceiver);

				
				Debug.Log("kazooooooo");

			} else if(clipName == "NoPlaceLikeMoe"){
				cam.SendMessage("loadMovie", "NoPlaceLikeMoe", SendMessageOptions.DontRequireReceiver);
				cam.SendMessage("setNumLoops", 5);
				cam.SendMessage("setLooping", true);
				cam.SendMessage("setLastFrame", 100);
				cam.SendMessage("gotoPosition", 0.01f, SendMessageOptions.DontRequireReceiver);
				cam.SendMessage("Play", SendMessageOptions.DontRequireReceiver);
				Debug.Log("NoPlaceLikeMoe");
				
			} else if(clipName == "scratches"){
				seqPlayer.SendMessage("setFrames", 117);
				seqPlayer.SendMessage("loadMovie","scratchSm" );
				seqPlayer.SendMessage("play");
				seqPlayer.GetComponent<Animator>().SetBool("textureIn", true);
			} else if(clipName == "tvStatic"){
				seqPlayer.SendMessage("setFrames", 94);
				seqPlayer.SendMessage("loadMovie","tvStatic" );
				seqPlayer.SendMessage("play");
				seqPlayer.GetComponent<Animator>().SetBool("textureIn", true);

			} else if(clipName == "judyInterview"){
				seqPlayer.SendMessage("setFrames", 185);
				seqPlayer.SendMessage("loadMovie","judyInterview" );
				seqPlayer.SendMessage("play");
				seqPlayer.GetComponent<Animator>().SetBool("textureIn", true);

			} else if(clipName == "ozFace"){
				seqPlayer.SendMessage("setFrames", 120);
				seqPlayer.SendMessage("loadMovie","ozHead" );
				seqPlayer.SendMessage("play");
				seqPlayer.GetComponent<Animator>().SetBool("textureIn", true);

			}

		
		} else if (Network.isServer){

			GameObject video = GameObject.Find ("Video");

			if(clipName == "MoeTest"){
				video.SendMessage("loadMovie", "MoeOzTest", SendMessageOptions.DontRequireReceiver);
				video.SendMessage("gotoPosition", 0.01f, SendMessageOptions.DontRequireReceiver);
				video.SendMessage("setNumLoops", 1);
				video.SendMessage("setLooping", false);
				video.SendMessage("setLastFrame",299);

				video.SendMessage("Play", SendMessageOptions.DontRequireReceiver);
				//video.SendMessage("setNumLoops", 1);

				Debug.Log("moeTest");
				
			} else if(clipName == "kazoo"){
				video.SendMessage("loadMovie", "rainbowAudioTest", SendMessageOptions.DontRequireReceiver);
				video.SendMessage("setNumLoops", 1);
				video.SendMessage("setLooping", false);
				video.SendMessage("setLastFrame",1968);

				video.SendMessage("gotoPosition", 0.01f, SendMessageOptions.DontRequireReceiver);
			
				video.SendMessage("Play", SendMessageOptions.DontRequireReceiver);
				//video.SendMessage("setNumLoops", 1);

			} else if(clipName == "NoPlaceLikeMoe"){
				video.SendMessage("loadMovie", "NoPlaceLikeMoe", SendMessageOptions.DontRequireReceiver);
				video.SendMessage("setNumLoops", 5);
				video.SendMessage("setLooping", true);
				video.SendMessage("setLastFrame",94);

				video.SendMessage("gotoPosition", 0.01f, SendMessageOptions.DontRequireReceiver);
				video.SendMessage("Play", SendMessageOptions.DontRequireReceiver);
				Debug.Log("NoPlaceLikeMoe");
				
			} else{
				Debug.Log("Server cannot play "+clipName);
			}
		}
	}
	
	[RPC] public void  stopMovie(){

		if (Network.isClient){

			seqPlayer.GetComponent<Animator>().SetBool("textureIn", false);
			GameObject.Find ("Camera").SendMessage("Stop");
			seqPlayer.SendMessage("stop");

		}else if (Network.isServer){
			GameObject.Find ("Video").SendMessage("Stop");
		}

		
	}
	
	[RPC] public void  playAudio(string clipName){

		if(Network.isClient){
			AudioSource source = (AudioSource)GameObject.Find("Camera").GetComponent<AudioSource>();
			AudioClip clip = new AudioClip();

			source.Stop();

			switch (clipName){
			case "applause":
				clip = Resources.Load ("Audience_Applause_1") as AudioClip;
				break;
			case "noPlace":
				clip = Resources.Load ("no_place_like_home2") as AudioClip;
				break;
			case "cicada":
				clip = Resources.Load ("Audio/ambiance/cicada") as AudioClip;
				break;
			case "cicada2":
				clip = Resources.Load ("Audio/ambiance/cicada2") as AudioClip;
				break;
			case "drums1":
				clip = Resources.Load ("Audio/drums/DRUMS-76") as AudioClip;				
				break;
			case "drums2":
				clip = Resources.Load ("Audio/drums/riser drum open") as AudioClip;				
				break;
			case "wind":
				clip = Resources.Load ("Audio/wind/wind") as AudioClip;	
				break;
			case "wind2":
				clip = Resources.Load ("Audio/wind/wind2") as AudioClip;	
				break;
			case "wind3":
				clip = Resources.Load ("Audio/wind/wind3") as AudioClip;	
				break;
			case "wind4":
				clip = Resources.Load ("Audio/wind/wind4") as AudioClip;
				break;
			case "applause1":
				clip = Resources.Load ("Audio/applause/applause1") as AudioClip;
				break;
			case "applauses":
				clip = Resources.Load ("Audio/applause/applauses") as AudioClip;
				break;
			case "applauses2":
				clip = Resources.Load ("Audio/applause/applauses2") as AudioClip;
				break;
			case "applauses9":
				clip = Resources.Load ("Audio/applause/applauses9") as AudioClip;
				break;
			case "dudescheering":
				clip = Resources.Load ("Audio/applause/dudescheering") as AudioClip;
				break;
			case "dudescheering2":
				clip = Resources.Load ("Audio/applause/dudescheering2") as AudioClip;
				break;
			case "dudescheering3":
				clip = Resources.Load ("Audio/applause/dudescheering3") as AudioClip;
				break;
			case "ladiescheering":
				clip = Resources.Load ("Audio/applause/ladiescheering") as AudioClip;
				break;
			case "ladiescheering2":
				clip = Resources.Load ("Audio/applause/ladiescheering2") as AudioClip;
				break;
			case "ladiescheering3":
				clip = Resources.Load ("Audio/applause/ladiescheering3") as AudioClip;
				break;

//3LD 2016 SOUNDS START

			case "YouWereThereAmbient":
				switch (Random.Range (0, 5)) {
				case 0:
					//clip = Resources.Load ("Audio/FilmingAmbient/new/Dotty/dotty scene1") as AudioClip;
					break;
				case 1:
					clip = Resources.Load ("Audio/FilmingAmbient/New_11.26.16/new birds/Birdy1") as AudioClip;
					break;
				case 2:
					clip = Resources.Load ("Audio/FilmingAmbient/New_11.26.16/new birds/Birdy2") as AudioClip;
					break;
				case 3:
					clip = Resources.Load ("Audio/FilmingAmbient/New_11.26.16/new birds/Birdy3") as AudioClip;
					break;
				case 4:
					clip = Resources.Load ("Audio/FilmingAmbient/New_11.26.16/new birds/Birdy4") as AudioClip;
					break;
				case 5:
					clip = Resources.Load ("Audio/FilmingAmbient/SILENCE") as AudioClip;
					break;
				}
				break;

			case "Barnyard":
				switch (Random.Range (0, 1)) {
				/*
				case 0:
					clip = Resources.Load ("Audio/FilmingAmbient/New_11.26.16/new barnyard/12 sheep") as AudioClip;
					break;
				
				case 1:
					clip = Resources.Load ("Audio/FilmingAmbient/New_11.26.16/new barnyard/15 Pigs") as AudioClip;
					break;
				*/
				case 0:
					clip = Resources.Load ("Audio/FilmingAmbient/New_11.26.16/new barnyard/16 Hen") as AudioClip;
					break;
				case 1:
					clip = Resources.Load ("Audio/FilmingAmbient/New_11.26.16/new barnyard/chicken") as AudioClip;
					break;
				}
				break;

			case "TwisterEvent":
				switch (Random.Range (0, 3)) {
				case 0:
					clip = Resources.Load ("Audio/FilmingAmbient/New_11.26.16/new cyclone/TWISTy SIREN") as AudioClip;
					break;
				case 1:
					clip = Resources.Load ("Audio/FilmingAmbient/New_11.26.16/new cyclone/TWISTy1") as AudioClip;
					break;
				case 2:
					clip = Resources.Load ("Audio/FilmingAmbient/New_11.26.16/new cyclone/TWISTy2") as AudioClip;
					break;
				case 3:
					clip = Resources.Load ("Audio/FilmingAmbient/New_11.26.16/new cyclone/TWISTy3") as AudioClip;
					break;
				}
				break;

			case "PlayMoney":
				switch (Random.Range (0, 6)) {
				case 0:
					clip = Resources.Load ("Audio/FilmingAmbient/coins/cashRegister") as AudioClip;
					break;
				case 1:
					clip = Resources.Load ("Audio/FilmingAmbient/coins/coins_1") as AudioClip;
					break;
				case 2:
					//clip = Resources.Load ("Audio/FilmingAmbient/coins/coins_2") as AudioClip;
					break;
				case 3:
					clip = Resources.Load ("Audio/FilmingAmbient/coins/coins_3") as AudioClip;
					break;
				case 4:
					//clip = Resources.Load ("Audio/FilmingAmbient/coins/coins_4") as AudioClip;
					break;
				case 5:
					clip = Resources.Load ("Audio/FilmingAmbient/coins/coins_5") as AudioClip;
					break;
				case 6:
					clip = Resources.Load ("Audio/FilmingAmbient/coins/coins") as AudioClip;
					break;
				}
				break;
			case "MargetHamiltonSizzle":
				clip = Resources.Load ("Audio/FilmingAmbient/New_11.26.16/Sizzle Flesh30") as AudioClip;
				break;
			case "Mland_Locals":
				switch (Random.Range (0, 9)) {
				case 0:
					clip = Resources.Load ("Audio/FilmingAmbient/New_11.26.16/new munch/munch chatter_1") as AudioClip;
					break;
				case 1:
					clip = Resources.Load ("Audio/FilmingAmbient/New_11.26.16/new munch/munch chatter_2") as AudioClip;
					break;
				case 2:
					clip = Resources.Load ("Audio/FilmingAmbient/New_11.26.16/new munch/munch chatter_3") as AudioClip;
					break;
				case 3:
					clip = Resources.Load ("Audio/FilmingAmbient/New_11.26.16/new munch/munch chatter_4") as AudioClip;
					break;
				case 4:
					clip = Resources.Load ("Audio/FilmingAmbient/munchkins/quieter chatter/munch chatter_5") as AudioClip;
					break;
				case 5:
					clip = Resources.Load ("Audio/FilmingAmbient/New_11.26.16/new munch/munch chatter_6") as AudioClip;
					break;
				case 6:
					clip = Resources.Load ("Audio/FilmingAmbient/New_11.26.16/new munch/munch chatter_7") as AudioClip;
					break;
				case 7:
					clip = Resources.Load ("Audio/FilmingAmbient/New_11.26.16/new munch/munch chatter_8") as AudioClip;
					break;
				case 8:
					clip = Resources.Load ("Audio/FilmingAmbient/New_11.26.16/new munch/munch chatter_9") as AudioClip;
					break;
				case 9:
					clip = Resources.Load ("Audio/FilmingAmbient/New_11.26.16/new munch/munch chatter") as AudioClip;
					break;
				case 10:
					clip = Resources.Load ("Audio/FilmingAmbient/SILENCE") as AudioClip;
					break;
				}
				break;

			case "OhWeOh":
				switch (Random.Range (0, 5)) {
				case 0:
					clip = Resources.Load ("Audio/FilmingAmbient/oWEo_1 minute") as AudioClip;
					break;
				case 1:
					clip = Resources.Load ("Audio/FilmingAmbient/new/oWEo_1 minute2") as AudioClip;
					break;
				case 2:
					clip = Resources.Load ("Audio/FilmingAmbient/new/oWEo_1") as AudioClip;
					break;
				case 3:
					clip = Resources.Load ("Audio/FilmingAmbient/new/oWEo") as AudioClip;
					break;
				case 4:
					clip = Resources.Load ("Audio/FilmingAmbient/new/oWEoDAN") as AudioClip;
					break;
				case 5:
					clip = Resources.Load ("Audio/FilmingAmbient/new/oWEoPAD") as AudioClip;
					break;
				}
				break;

			case "Mland_Panic":
				switch (Random.Range (0, 17)) {
				case 0:
					clip = Resources.Load ("Audio/FilmingAmbient/New_11.26.16/new munch/munch panic_1") as AudioClip;
					break;
				case 1:
					clip = Resources.Load ("Audio/FilmingAmbient/New_11.26.16/new munch/munch panic_2") as AudioClip;
					break;
				case 2:
					clip = Resources.Load ("Audio/FilmingAmbient/New_11.26.16/new munch/munch panic_3") as AudioClip;
					break;
				case 3:
					clip = Resources.Load ("Audio/FilmingAmbient/New_11.26.16/new munch/munch panic") as AudioClip;
					break;
				case 4:
					clip = Resources.Load ("Audio/FilmingAmbient/New_11.26.16/new munch/munch panic_4") as AudioClip;
					break;
				case 5:
					clip = Resources.Load ("Audio/FilmingAmbient/new/witch aura") as AudioClip;
					break;
				case 6:
					clip = Resources.Load ("Audio/FilmingAmbient/New_11.26.16/new munch/Immigrant1") as AudioClip;
					break;
				case 7:
					clip = Resources.Load ("Audio/FilmingAmbient/New_11.26.16/new munch/Immigrant2") as AudioClip;
					break;
				case 8:
					clip = Resources.Load ("Audio/FilmingAmbient/New_11.26.16/new munch/Immigrant3") as AudioClip;
					break;
				case 9:
					clip = Resources.Load ("Audio/FilmingAmbient/New_11.26.16/new munch/Immigrant4") as AudioClip;
					break;
				case 10:
					clip = Resources.Load ("Audio/FilmingAmbient/New_11.26.16/new munch/Immigrant5") as AudioClip;
					break;
				case 11:
					clip = Resources.Load ("Audio/FilmingAmbient/New_11.26.16/new munch/Immigrant6") as AudioClip;
					break;
				case 12:
					clip = Resources.Load ("Audio/FilmingAmbient/New_11.26.16/new munch/Immigrant7") as AudioClip;
					break;
				case 13:
					clip = Resources.Load ("Audio/FilmingAmbient/New_11.26.16/new munch/Immigrant8") as AudioClip;
					break;
				case 14:
					clip = Resources.Load ("Audio/FilmingAmbient/New_11.26.16/new munch/Immigrant9") as AudioClip;
					break;
				case 15:
					clip = Resources.Load ("Audio/FilmingAmbient/New_11.26.16/new munch/Immigrant10") as AudioClip;
					break;
				case 16:
					clip = Resources.Load ("Audio/FilmingAmbient/New_11.26.16/new munch/Immigrant11") as AudioClip;
					break;
				case 17:
					clip = Resources.Load ("Audio/FilmingAmbient/New_11.26.16/new munch/Immigrant13") as AudioClip;
					break;
				}
				break;

			case "WitchPoof":
				clip = Resources.Load ("Audio/FilmingAmbient/new/witch poof") as AudioClip;
				break;
			
			case "FireBall":
				clip = Resources.Load ("Audio/FilmingAmbient/new/fireball") as AudioClip;
				break;

			case "toto":
				clip = Resources.Load ("Audio/FilmingAmbient/new/dog bark") as AudioClip;
				break;

//3LD 2016 SOUNDS END

			case "laughShort":
				switch (Random.Range (0, 3)) {
				case 0:
					clip = Resources.Load ("Audio/laughter/Laugh Track 2-02") as AudioClip;
					break;
				case 1:
					clip = Resources.Load ("Audio/laughter/Laugh Track 2-06") as AudioClip;
					break;
				case 2:
					clip = Resources.Load ("Audio/laughter/Laugh Track 2-10") as AudioClip;
					break;
				case 3:
					clip = Resources.Load ("Audio/laughter/Laugh Track 2-14") as AudioClip;
					break;
				default:
					clip = Resources.Load ("Audio/laughter/Laugh Track 2-02") as AudioClip;
					break;
				}
				break;
			case "laughLong":
					clip = Resources.Load ("Audio/laughter/Laugh Track") as AudioClip;
				break;
			case "munchkinLaugh":
					switch (Random.Range (0, 3)) {
					case 0:
						clip = Resources.Load ("Audio/munchkins/munchkins1") as AudioClip;
						break;
					case 1:
						clip = Resources.Load ("Audio/munchkins/munchkins2") as AudioClip;
						break;
					case 2:
						clip = Resources.Load ("Audio/munchkins/munchkins3") as AudioClip;
						break;
					case 3:
						clip = Resources.Load ("Audio/munchkins/munchkins4") as AudioClip;
						break;
					default:
						clip = Resources.Load ("AuAudio/munchkins/munchkins1") as AudioClip;
						break;
					}
				break;

			default:
				clip = Resources.Load ("Audio/etc/"+clipName) as AudioClip;			
				break;
			}
			source.clip = clip;
			source.Play();

		}
		
	}
	
	[RPC] public void stopAudio(){
		GameObject sourceObj = GameObject.Find("Camera");
		if(sourceObj) {
			AudioSource source = (AudioSource)sourceObj.GetComponent<AudioSource>();
			source.Stop();
		}
		
	}

	[RPC] public void setAudioLoop(bool _looping){
		AudioSource source = (AudioSource)GameObject.Find("Camera").GetComponent<AudioSource>();
		source.loop = _looping;
	}


	[RPC] public IEnumerator playAudioWithDelay(string _clip, float _minDelay, float _maxDelay){
		float _delay = Random.value;
		_delay *= _maxDelay-_minDelay;
		_delay += _minDelay;
		yield return new WaitForSeconds(_delay);
		stopAudio();
		playAudio(_clip);

	}

	[RPC] public IEnumerator loopAudioWithDelay(string _clip, float _minDelay, float _maxDelay, int loops, float _clipLength){
		//float _clipLength = 0;
		Debug.Log("loop called");

		for (int i=0;i<loops;i++){
			Debug.Log("looped");
			float _delay = Random.value;
			_delay *= _maxDelay-_minDelay;
			_delay += _minDelay;
			yield return new WaitForSeconds( _delay );
			stopAudio();
			playAudio(_clip);
			yield return new WaitForSeconds(_clipLength);
		}
	}


	[RPC] public void setTextRemote(string _text){
		GameObject msg = GameObject.Find("Message");
		if (msg) msg.SendMessage("changeText", _text);
		Debug.Log ("Changed Text: "+ _text);
	}

	[RPC] public void setWiki(string _header, string _body){
		GameObject headerObj = GameObject.Find("WikiHeader");
		GameObject bodyObj = GameObject.Find("WikiBody");

		if (headerObj) headerObj.SendMessage("changeText", _header);
		if (bodyObj) bodyObj.SendMessage("changeText", _body);

		Debug.Log ("Changed Wiki: "+ _header +" / "+ _body);
	}


	[RPC] public void setTextColor(float _r, float _g, float _b){
		Color newColor = new Color(_r,_g,_b);
		GameObject msg = GameObject.Find("Message");
		if (msg) msg.SendMessage("setColor", newColor);
	}

	[RPC] public void sendRandomText(string _textBundle){
		string selectedText;
		string[] splitStrings = _textBundle.Split('|');

		Random.seed = Time.frameCount;
		selectedText = splitStrings[  (int)Random.Range(0, splitStrings.Length) ];

		GameObject msg = GameObject.Find("Message");
		if (msg) msg.SendMessage("changeText", selectedText);
		Debug.Log ("Changed Text: "+ selectedText);
		
	}



	public void setTransitionSpeed(float f){
		transitionSpeed = f;
	}


	public void selectText( int i){
		textSelection = i;
	}

	public void setTornadoState(float i){
		tornadoState = (int)i;
	}

	public void setPoppyState(float i){
		poppyState = (int) i;
	}

	public void setMunchkinState(float i){
		munchkinState = (int) i;
	}

	public void setMonkeyState(float i){
		monkeyState = (int) i;
	}
	public void setFireState(float i){
		fireState = (int) i;
	}

	public void setTargetXPos(float f){
		imageTargetX = f;
	}

	public void setTargetYPos(float f){
		imageTargetY = f;

	}

	public void setTargetZPos(float f){
		imageTargetZ = f;
		
	}


}