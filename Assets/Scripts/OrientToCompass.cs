using UnityEngine;
 
public class OrientToCompass : MonoBehaviour
{
	public float stageHeading;
	public bool bCalibrationEnabled = true;
	public Quaternion rotationQuat;
	public UnityEngine.UI.Text debugUI;

    private double _lastCompassUpdateTime = 0;
    private Quaternion _correction = Quaternion.identity;
    private Quaternion _targetCorrection = Quaternion.identity;
    private Quaternion _compassOrientation = Quaternion.identity;

    private Quaternion lastGyro;

    private float north;
   
    void Start()
    {
        Input.compass.enabled = true;
		Input.gyro.enabled = true;
		//initialHeading = Input.compass.trueHeading;

        //stageHeading =  stageHeading;

    }
   
    void FixedUpdate()
    {

        // See if the compass has new data
        if (Input.compass.timestamp > _lastCompassUpdateTime)
        {
            _lastCompassUpdateTime = Input.compass.timestamp;
       
  			
        }
		Quaternion correctedGyro = Input.gyro.attitude;// * rotationQuat;

		float tilt = correctedGyro.eulerAngles.z;
		if (tilt<180 ) tilt = 360-tilt; //fix gimbal lock?

		Vector3 gravity = Input.gyro.gravity.normalized;
		Vector3 projectedHeading = Vector3.ProjectOnPlane(Input.compass.rawVector, -gravity); //project on plane

		//calc heading
		float heading =0;
		float x= -projectedHeading.y;
		float y= projectedHeading.x;
		if (y>0) heading = 90f - Mathf.Atan2(x,y)*180f / Mathf.PI;
		else if (y<0) heading = 270f - Mathf.Atan2(x,y)*180f / Mathf.PI;
		else if (y==0 && x<0f) heading = 180.0f;
		else if (y==0 && x>0f) heading = 0.0f;


		//float tiltCompensatedHeading = stageHeading-Input.compass.trueHeading ;
		//_targetCorrection = Quaternion.Inverse(Quaternion.Euler(0,Input.compass.trueHeading,0));
//		Quaternion invNorth = Quaternion.Inverse(Quaternion.LookRotation(Input.compass.rawVector));
//		_compassOrientation = Quaternion.Euler(
//			Mathf.Rad2Deg * Mathf.Asin(-Input.gyro.gravity.z),
//			Input.compass.trueHeading,
//			Mathf.Rad2Deg * Mathf.Atan2(Input.gyro.gravity.y, -Input.gyro.gravity.x));

		_targetCorrection = Quaternion.Euler(0,Input.compass.trueHeading,0)*Quaternion.Euler(0,0,90)  ;
		float shiftHeading = _targetCorrection.eulerAngles.y  ;

        _correction = Quaternion.Slerp(_correction, _targetCorrection, 0.1f);
   
		float vectorDiff = Vector3.Angle(Input.compass.rawVector, Vector3.forward);
        // Easy bit :)
		transform.localRotation = _correction;

		debugUI.text = "rawVec= "+Input.compass.rawVector.normalized.ToString()+ 
			" API heading= "+ Input.compass.trueHeading.ToString() + 
			" shiftHeading= "+ shiftHeading ;
	
        
    }

	void Update(){
		if(Input.touchCount>0 && bCalibrationEnabled){
			stageHeading= Input.compass.trueHeading;
		}

	}

	static float GetPitch(Quaternion rotation)
	{
		var dir = rotation * Vector3.forward;
		Vector2 xz = new Vector2(dir.x,dir.z);
		var angle = Mathf.Atan2(dir.y, xz.magnitude);
		return angle * Mathf.Rad2Deg; 
	}

	static float GetYaw(Quaternion rotation)
	{
		var dir = rotation * Vector3.forward;
		var angle = Mathf.Atan2(dir.x, dir.z); 
		return angle * Mathf.Rad2Deg; 
	}

	static float GetRoll(Quaternion rotation)
	{
		var dir = rotation * Vector3.left;
		Vector2 xz = new Vector2(dir.x,dir.z);
		var angle = Mathf.Atan2(dir.y, xz.magnitude);
		return angle * Mathf.Rad2Deg; 
	}

	static float GetYaw360(Quaternion rotation)
	{
		var rot = GetYaw(rotation);
		if (rot < 0) rot += 360;
		return rot;
	}



}
 