#pragma strict

var angle: float;
var correctionVec:Vector3;
var correctionQuat: Quaternion;
var gyro: Quaternion;
var outputAngle:float;

function Start () {

}

function Update () {
	var angleQuat : Quaternion = Quaternion.Euler(0,angle,0);
	correctionQuat = Quaternion.Euler(correctionVec.x,correctionVec.y,correctionVec.z);
	var newQuat: Quaternion = angleQuat*correctionQuat;
	outputAngle = newQuat.eulerAngles.y;


}