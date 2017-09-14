using UnityEngine;
using System.Collections;
using System.IO;
using Vuforia;
using System.Collections.Generic;

public class androidObbManager : MonoBehaviour {

	public GameObject arCam;
	private bool loadedDataSet = false;

	void Start () {
		//PlayerPrefs.DeleteAll (); //only for testing
		//PlayerPrefs.Save ();
		PlayerPrefs.SetInt("readyToEnter",0);
		PlayerPrefs.Save();
		Debug.Log ("OBB MANGER");
		#if UNITY_ANDROID
		//if(PlayerPrefs.GetInt("extractedObb",0)==0) ;
		StartCoroutine(ExtractObbDatasets()) ;
		#endif
	}

	void Update(){

		if (PlayerPrefs.GetInt ("readyToEnter", 0) == 1 && !loadedDataSet && arCam.activeSelf) {
			//Tell QCAR to re-search for files; it searches before the files are loaded.
// ---->	arCam.GetComponent<DatabaseLoadARController> ().AddOSSpecificExternalDatasetSearchDirs ();
			//arCam.GetComponent<DatabaseLoadARController> ().AddExternalDatasetSearchDir	("/obb"); // Must include for split-binary, must remove for non-split-binary
			Debug.Log ("Loading Data Set when ready");
			loadedDataSet = true;
		}

	}

	private IEnumerator ExtractObbDatasets () {
		//Persistent Datapath grabs the file from within the OBB file.
		//the path will look something like:
		//jar:file:///storage/emulated/0/Android/obb/org.thebuildersassociation.ozBeta2/main.1.org.thebuildersassociation.ozBeta2.obb!/assets/QCAR/ozUnity.xml
		string toDir = Application.persistentDataPath;

		//create dir if it isn't there.
		if(!Directory.Exists(Path.GetDirectoryName( toDir + "/QCAR/" ))) Directory.CreateDirectory(Path.GetDirectoryName(toDir + "/QCAR/"));
		if(!Directory.Exists(Path.GetDirectoryName( toDir + "/Video/"))) Directory.CreateDirectory(Path.GetDirectoryName(toDir + "/Video/"));

		//grab each file and load it.
		List<string> filesInOBB = new List<string>();
		filesInOBB.Add ( Application.streamingAssetsPath + "/QCAR/ozUnity_3LD.xml" );
		filesInOBB.Add ( Application.streamingAssetsPath + "/QCAR/ozUnity_3LD.dat" );

		filesInOBB.Add ( Application.streamingAssetsPath + "/Video/rainbow_01.mp4" );
		filesInOBB.Add ( Application.streamingAssetsPath + "/Video/rainbow_02.mp4" );
		filesInOBB.Add ( Application.streamingAssetsPath + "/Video/rainbow_03.mp4" );
		filesInOBB.Add ( Application.streamingAssetsPath + "/Video/rainbow_04.mp4" );
		filesInOBB.Add ( Application.streamingAssetsPath + "/Video/rainbow_05.mp4" );
		filesInOBB.Add ( Application.streamingAssetsPath + "/Video/rainbow_06.mp4" );
		filesInOBB.Add ( Application.streamingAssetsPath + "/Video/rainbow_07.mp4" );

		Debug.Log ("AssetPath: " + Application.streamingAssetsPath);
		foreach (string filename in filesInOBB) {
			Debug.Log ("attempting: " + filename);
			//Debug.LogError("Attempting to load: " + filename + " " + Path.GetFileName(filename));
			if (!filename.EndsWith(".meta")) {

				WWW fileRequest = new WWW(filename);

				yield return fileRequest;

				if (!string.IsNullOrEmpty (fileRequest.error)) {
					Debug.LogError ("QCAR FILES DIDN'T LOAD! " + fileRequest.error);
				} else {
					if ( filename.EndsWith(".mp4") ) {
						Save(fileRequest, toDir + "/Video/" + Path.GetFileName(filename) );
					} else {
						Save(fileRequest, toDir + "/QCAR/" + Path.GetFileName(filename) );
					}
				}
			}
		}

		PlayerPrefs.SetInt("extractedObb",1);
		Debug.Log ("Extracted Obb");
		PlayerPrefs.Save();
		//Application.Quit ();
		// ReloadDataSet();

	}
	private void Save(WWW www, string outputPath) {
		Debug.LogError( "Writing File: " + www.url + " to: " + outputPath);
		File.WriteAllBytes(outputPath, www.bytes);

		// Verify that the File has been actually stored
		if(File.Exists(outputPath))
			Debug.LogWarning("File successfully saved at: " + outputPath);
		else
			Debug.LogError("Failure!! - File does not exist at: " + outputPath);
	}


	private void ReloadDataSet(){
		ObjectTracker objTracker = TrackerManager.Instance.GetTracker<ObjectTracker> ();
		DataSet dataset = objTracker.CreateDataSet();
		dataset.Load ("ozUnity_3LD");
		objTracker.Stop();
		objTracker.ActivateDataSet (dataset);
		objTracker.Start ();




	}



}
