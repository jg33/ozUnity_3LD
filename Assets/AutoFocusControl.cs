using UnityEngine;
using System.Collections;
using Vuforia;

public class AutoFocusControl : MonoBehaviour {

	// Use this for initialization
	void Start () {
		#if UNITY_ANDROID
		CameraDevice.Instance.SetFocusMode (CameraDevice.FocusMode.FOCUS_MODE_CONTINUOUSAUTO);
		#endif
	}
	
	// Update is called once per frame
	void Update () {
	
	}
}
