#pragma strict

private var guiController: Animator;
function Start () {
	guiController = GameObject.Find("PassiveGUI").GetComponent(Animator);
}

function Update () {
	if(Input.touches.length>4){
		PlayerPrefs.SetInt("CompletedShow",1);
		PlayerPrefs.Save();
	}
}