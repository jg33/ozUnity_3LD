using UnityEngine;
using System.Collections;
using Vuforia;

public class AutoFocusControl : MonoBehaviour {
	public bool triggeredAutoFocus;

	public bool hasSetFocus = false;
	// Use this for initialization
	void Start () {
		#if UNITY_ANDROID
		//StartCoroutine(setAutofocus());
		CameraDevice.Instance.SetFocusMode (CameraDevice.FocusMode.FOCUS_MODE_CONTINUOUSAUTO);
		VuforiaARController.Instance.RegisterVuforiaStartedCallback(OnVuforiaStarted);
		VuforiaARController.Instance.RegisterOnPauseCallback(OnVuforiaStarted);

		#endif
	}

	void FixedUpdate(){
		if (!hasSetFocus) {
			hasSetFocus = CameraDevice.Instance.SetFocusMode (
				CameraDevice.FocusMode.FOCUS_MODE_CONTINUOUSAUTO);
			Debug.Log ("setting focus in update... returned: "+hasSetFocus);
		}
	}
	
	IEnumerator setAutofocus(){
		yield return new WaitForSeconds (3);
		CameraDevice.Instance.SetFocusMode (CameraDevice.FocusMode.FOCUS_MODE_CONTINUOUSAUTO);
	}

	private void OnVuforiaStarted() {
		hasSetFocus = CameraDevice.Instance.SetFocusMode(
			CameraDevice.FocusMode.FOCUS_MODE_CONTINUOUSAUTO);
		Debug.Log ("set auto focus (start callback)");
	}
		
	private void OnVuforiaStarted(bool boo) {
		hasSetFocus = CameraDevice.Instance.SetFocusMode(
			CameraDevice.FocusMode.FOCUS_MODE_CONTINUOUSAUTO);
		Debug.Log ("set auto focus (pause callback)");
	}
}
