/*==============================================================================
Copyright (c) 2010-2014 Qualcomm Connected Experiences, Inc.
All Rights Reserved.
Confidential and Proprietary - Qualcomm Connected Experiences, Inc.
==============================================================================*/

using UnityEngine;

namespace Vuforia
{
	/// <summary>
	/// A custom handler that implements the ITrackableEventHandler interface.
	/// </summary>
	public class CustomAREventHandler : MonoBehaviour,
	ITrackableEventHandler
	{
		#region PRIVATE_MEMBER_VARIABLES
		
		private TrackableBehaviour mTrackableBehaviour;

		private GameObject camCtl;
		private GameObject storm;
		
		private Animator sepiaAnimator;

		#endregion // PRIVATE_MEMBER_VARIABLES
		
		
		
		#region UNTIY_MONOBEHAVIOUR_METHODS
		
		void Start()
		{
			mTrackableBehaviour = GetComponent<TrackableBehaviour>();
			if (mTrackableBehaviour)
			{
				mTrackableBehaviour.RegisterTrackableEventHandler(this);
			}

			 if (mTrackableBehaviour.TrackableName.StartsWith( "Passive" ) ){

				gameObject.transform.GetChild(0).gameObject.SetActive(false);
				Debug.Log ("Turn that shit off " + gameObject.GetComponent<ImageTargetBehaviour>().ImageTarget.Name+ " "  );
		
			}

			sepiaAnimator = GameObject.Find("Camera").GetComponent("Animator");

		}
		
		#endregion // UNTIY_MONOBEHAVIOUR_METHODS
		
		
		
		#region PUBLIC_METHODS
		
		/// <summary>
		/// Implementation of the ITrackableEventHandler function called when the
		/// tracking state changes.
		/// </summary>
		public void OnTrackableStateChanged(
			TrackableBehaviour.Status previousStatus,
			TrackableBehaviour.Status newStatus)
		{
			if (newStatus == TrackableBehaviour.Status.DETECTED ||
			    newStatus == TrackableBehaviour.Status.TRACKED ||
			    newStatus == TrackableBehaviour.Status.EXTENDED_TRACKED)
			{
				OnTrackingFound();
			}
			else
			{
				OnTrackingLost();
			}
		}
		
		#endregion // PUBLIC_METHODS
		
		
		
		#region PRIVATE_METHODS
		
		
		private void OnTrackingFound()
		{
			Renderer[] rendererComponents = GetComponentsInChildren<Renderer>(true);
			Collider[] colliderComponents = GetComponentsInChildren<Collider>(true);

			Debug.Log("Custom AR! Found: " +mTrackableBehaviour.TrackableName);

			// Enable rendering:
			foreach (Renderer component in rendererComponents)
			{
				component.enabled = true;
			}
			
			// Enable colliders:
			foreach (Collider component in colliderComponents)
			{
				component.enabled = true;
			}

			 if (mTrackableBehaviour.TrackableName == "Oz_TopTarget_inverted"){

				camCtl = GameObject.Find ("Camera Container");
				camCtl.SendMessage("updateTarget");
				camCtl.SendMessage("setFoundTarget",true);

				if(!storm) storm = GameObject.Find("storm");
				if (storm) storm.SetActive(false);

				if(gameObject.GetComponent<ImageTargetBehaviour>().ImageTarget.Name == mTrackableBehaviour.TrackableName){
					if(gameObject.transform.childCount>0) gameObject.transform.GetChild(0).gameObject.SetActive(true);
				}

				if(Application.loadedLevel ==1){
					camCtl.SendMessage("setTightTracking", true);
	
				} else{
					camCtl.SendMessage("setTightTracking", false);

				}

			} else if (mTrackableBehaviour.TrackableName.StartsWith("Passive") && PlayerPrefs.GetInt("CompletedShow",0) != 0){ //if the show's complete, display any passive target
				camCtl = GameObject.Find ("Camera Container");
				camCtl.SendMessage("setTightTracking", true);
				storm = GameObject.Find("storm");
				storm.SetActive(false);
				if(gameObject.GetComponent<ImageTargetBehaviour>().ImageTarget.Name == mTrackableBehaviour.TrackableName){
					gameObject.transform.GetChild(0).gameObject.SetActive(true);
				}

			} else if (mTrackableBehaviour.TrackableName== "Passive1Cyclone"){ //always show cyclone
				camCtl = GameObject.Find ("Camera Container");
				camCtl.SendMessage("setTightTracking", true);
				storm = GameObject.Find("storm");
				storm.SetActive(false);
				Debug.Log("Found tornado");


				if(gameObject.GetComponent<ImageTargetBehaviour>().ImageTarget.Name == mTrackableBehaviour.TrackableName){
					gameObject.transform.GetChild(0).gameObject.SetActive(true);

				}

			} else if(mTrackableBehaviour.TrackableName== "GlindaTarget"){
				sepiaAnimator.SetBool("isSepia", false);
			
			} else {
				Debug.Log("Didn't Find Named Trackable. This is: "+ gameObject.GetComponent<ImageTargetBehaviour>().ImageTarget.Name);
//				Debug.Log("Matched names: "+ gameObject.GetComponent<ImageTargetBehaviour>().ImageTarget.Name.Equals(mTrackableBehaviour.TrackableName));
//				Debug.Log(gameObject.GetComponent<ImageTargetBehaviour>().ImageTarget.Name == mTrackableBehaviour.TrackableName);
//				Debug.Log(mTrackableBehaviour.TrackableName == "Passive1Cyclone");
//				Debug.Log(mTrackableBehaviour.TrackableName);
			}



			Debug.Log("Trackable " + mTrackableBehaviour.TrackableName + " found");
		}
		
		
		private void OnTrackingLost() {

			 if (mTrackableBehaviour.TrackableName == "Oz_TopTarget_inverted"){
				GameObject camCtl = GameObject.Find ("Camera Container");
				camCtl.SendMessage("lostTarget");

				if(!storm) storm = GameObject.Find("storm");
				if (storm) storm.SetActive(true);
				
				if(gameObject.GetComponent<ImageTargetBehaviour>().ImageTarget.Name == mTrackableBehaviour.TrackableName){
					if(gameObject.transform.childCount>0) gameObject.transform.GetChild(0).gameObject.SetActive(false);
				}

			} else if (mTrackableBehaviour.TrackableName.StartsWith( "Passive" ) ){
				GameObject camCtl = GameObject.Find ("Camera Container");
				camCtl.SendMessage("setTightTracking", false);
				GameObject.Find("GyroResetter").SendMessage("setTightTracking", false);
				if(!storm) storm = GameObject.Find("storm");
				if (storm) storm.SetActive(true);

				if(gameObject.GetComponent<ImageTargetBehaviour>().ImageTarget.Name == mTrackableBehaviour.TrackableName){
					gameObject.transform.GetChild(0).gameObject.SetActive(false);
//					gameObject.transform.GetChild(1).gameObject.SetActive(false);
					Debug.Log ("BORT " + gameObject.GetComponent<ImageTargetBehaviour>().ImageTarget.Name+ " "  );

				}

				GameObject.Find("GyroResetter").SendMessage("resetResetter"); //zeros out gyro to keep storm

			} else if (mTrackableBehaviour.TrackableName== "GlindaTarget"){
				sepiaAnimator.SetBool("isSepia", true);
			}



			Renderer[] rendererComponents = GetComponentsInChildren<Renderer>(true);
			Collider[] colliderComponents = GetComponentsInChildren<Collider>(true);
			
			// Disable rendering:
			foreach (Renderer component in rendererComponents)
			{
				component.enabled = false;
			}
			
			// Disable colliders:
			foreach (Collider component in colliderComponents)
			{
				component.enabled = false;
			}
			
			Debug.Log("Trackable " + mTrackableBehaviour.TrackableName + " lost");
		}
		
		#endregion // PRIVATE_METHODS
	}
}
