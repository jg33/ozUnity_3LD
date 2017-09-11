using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class InitArInThisScene : MonoBehaviour {


	public GameObject arCam;

	// Use this for initialization
	void Start () {
	}
	
	// Update is called once per frame
	void Update () {
		if (!arCam) {
			arCam = GameObject.Find ("ARCamera");
			if(arCam) StartCoroutine (delayedEnable ());
		}

	}

	IEnumerator delayedEnable(){
		yield return new WaitForSeconds (3);
		//arCam.GetComponent<Vuforia.VuforiaBehaviour> ().enabled = true;


	}
}
