﻿#pragma strict

var targetRotation: Quaternion;
var tightRotation: Quaternion;
var tightTracking: boolean;


function Awake(){
	Input.gyro.enabled = true;
}

function Start () {
	targetRotation = Quaternion.identity;
	targetRotation.SetFromToRotation(Input.gyro.gravity, Vector3(0,0,0));
	//resetGyro();
}

function Update () {

	//Debug.Log("grav: "+Input.gyro.gravity);
	if(tightTracking){
		transform.localRotation = tightRotation;
	} else{
		transform.localRotation = Quaternion.Lerp(transform.localRotation, targetRotation,0.04  );
	}

}

public function resetGyro(){
    		var  invertedOrientation:Quaternion;
    		invertedOrientation = Quaternion.Inverse(GameObject.Find("UPFTHeadTracker").transform.localRotation);
    		var invertedEulers = invertedOrientation.eulerAngles;
    		invertedOrientation = Quaternion.Euler(invertedEulers.x, invertedEulers.y, invertedEulers.z   );
		
		if(tightTracking){ //gotta keep 'em separated..
    		tightRotation = invertedOrientation;
    		} else{
    		targetRotation = invertedOrientation;
    		}

   		 }
   		 
public function setTightTracking(t:boolean){

	tightTracking = t;
}

public function resetResetter(){
	targetRotation = Quaternion.identity;
	targetRotation.SetFromToRotation(Input.gyro.gravity, Vector3(0,0,0));
	Debug.Log("---RESET RESETTER---");
}