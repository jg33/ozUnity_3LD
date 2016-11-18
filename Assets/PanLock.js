#pragma strict

function Start () {

}

function Update () {

	
	transform.localRotation = Quaternion.Euler(transform.eulerAngles.x, 0 , transform.eulerAngles.z);
}