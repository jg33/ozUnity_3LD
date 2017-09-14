using System.Collections;
using System.Collections.Generic;
using UnityEngine;

using Vuforia;

public class InitArInThisScene : MonoBehaviour {


	public GameObject arCam;
	public GameObject camCon;
	public GameObject gyroCtrl;

	// Use this for initialization
	void Start () {
	}
	
	// Update is called once per frame
	void Update () {
		if (!arCam) {
			arCam = GameObject.Find ("ARCamera");
			arCam.GetComponent<VuforiaBehaviour> ().enabled = true;

			camCon = GameObject.Find ("Camera Container");
			camCon.SendMessage ("setTightTracking",false);

			gyroCtrl = GameObject.Find ("GyroResetter");
			gyroCtrl.SendMessage ("resetGyro");
			gyroCtrl.SendMessage ("resetResetter");
			gyroCtrl.SendMessage ("setTightTracking",false);


//			if (Vuforia.VuforiaRuntime.Instance.HasInitialized) {
//
//
//				// this breaks things....
////				Vuforia.VuforiaRuntime.Instance.Deinit();
////				Vuforia.VuforiaRuntime.Instance.InitVuforia();
//				//Debug.Log ("RESET VUFORIA...");
//			}
			
			//if(arCam) StartCoroutine (delayedEnable ());
		}

	}

	IEnumerator delayedEnable(){
		yield return new WaitForSeconds (1);
		//arCam.GetComponent<Vuforia.VuforiaBehaviour> ().enabled = true;


	}
}
