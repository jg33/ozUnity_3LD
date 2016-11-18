#pragma strict

function Start () {

}

function Update () {
	transform.LookAt(Input.gyro.gravity);
}