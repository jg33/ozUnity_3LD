using UnityEngine;
using System.Collections;
using Vuforia;

public class AutoFocusControl : MonoBehaviour {
	public bool triggeredAutoFocus;
	// Use this for initialization
	void Start () {
		#if UNITY_ANDROID
		//StartCoroutine(setAutofocus());
		CameraDevice.Instance.SetFocusMode (CameraDevice.FocusMode.FOCUS_MODE_CONTINUOUSAUTO);
		VuforiaBehaviour.Instance.RegisterVuforiaStartedCallback(OnVuforiaStarted);
		VuforiaBehaviour.Instance.RegisterOnPauseCallback(OnVuforiaStarted);
		#endif
	}
	
	IEnumerator setAutofocus(){
		yield return new WaitForSeconds (3);
		CameraDevice.Instance.SetFocusMode (CameraDevice.FocusMode.FOCUS_MODE_CONTINUOUSAUTO);
	}

	private void OnVuforiaStarted() {
		CameraDevice.Instance.SetFocusMode(CameraDevice.FocusMode.FOCUS_MODE_CONTINUOUSAUTO);
		Debug.Log ("set auto focus");
	}
}
