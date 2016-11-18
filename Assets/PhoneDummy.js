#pragma strict

public var gyroRaw: Quaternion;
public var gyroEuler: Vector3;
function Start () {

}

function Update () {
	var deviceRotation:Quaternion = Input.gyro.attitude;
     transform.eulerAngles = new Vector3 (
         deviceRotation.eulerAngles.x,
         deviceRotation.eulerAngles.y,
         deviceRotation.eulerAngles.z);


    gyroRaw= Input.gyro.attitude;
    gyroEuler = gyroRaw.eulerAngles;
 	}