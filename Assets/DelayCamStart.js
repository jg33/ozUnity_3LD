#pragma strict

public var camContainer: GameObject;
public var arCam: GameObject;


function Start () {
		#if UNITY_ANDROID
		if(!Input.gyro.enabled){
			Input.gyro.enabled=true;
		}

//		if(PlayerPrefs.GetInt("readyToEnter",0)==1){
//			camContainer.active=true;
//			arCam.active=true;
//		}
		#endif

		#if UNITY_IOS
			camContainer.active=true;
			arCam.active=true;
		#endif
}

function Update () {
	//if(!camContainer.active && !arCam.active){
	#if UNITY_ANDROID
	if(PlayerPrefs.GetInt("extractedObb",0)==1 && Application.loadedLevel ==0){
//		PlayerPrefs.SetInt("readyToEnter",1);
//		PlayerPrefs.Save();
//		Debug.Log("readyToEnter!");
		//Application.LoadLevel(Application.loadedLevel);
		if(!arCam.activeSelf){
			arCam.SetActive(true);
			arCam.GetComponent(Vuforia.DatabaseLoadAbstractBehaviour).AddOSSpecificExternalDatasetSearchDirs();
			Debug.Log("activated arCam");
		} else if(arCam.activeSelf && !camContainer.activeSelf){
			camContainer.SetActive(true);
			Debug.Log("activated camcontainer");

		} else if(arCam.activeSelf && camContainer.activeSelf){
			PlayerPrefs.SetInt("readyToEnter",1);
			PlayerPrefs.Save();
			Debug.Log("ready to enter. updated.");

		}

	}

	#endif


}