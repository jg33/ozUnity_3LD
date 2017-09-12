using System.Collections;
using System.Collections.Generic;
using UnityEngine;

using Vuforia;

public class InitArInThisScene : MonoBehaviour {


	public GameObject arCam;

	// Use this for initialization
	void Start () {
	}
	
	// Update is called once per frame
	void Update () {
		if (!arCam) {
			arCam = GameObject.Find ("ARCamera");

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
