﻿#pragma strict
var cueComponent: cueSystem;
var headTracker: GameObject;
var hasOriented: boolean;


function Start () {
	cueComponent = GameObject.Find("Network").GetComponent(cueSystem);
	headTracker = GameObject.Find("UPFTHeadTracker");
}

function FixedUpdate () {
	if(!hasOriented && cueComponent.munchkinState == 4){
		transform.localPosition = headTracker.transform.parent.parent.localPosition;
		var targetRotation:Quaternion = Quaternion.Euler(
			0,
			headTracker.transform.localRotation.eulerAngles.y,
			0);
		transform.localRotation = targetRotation;

		hasOriented = true;
	}
}