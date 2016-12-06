#pragma strict
var ozFace:GameObject;
var cueComponent: cueSystem;
//var animator:Animator;

function Start () {
	ozFace = GameObject.Find("OzFace");
	cueComponent = GameObject.Find("Network").GetComponent(cueSystem);
//	animator = this.gameObject.GetComponent(Animator);

	ozFace.active = false;
}

function Update () {
	if(cueComponent.cueNumber==6){
		//animator.SetBool("active", true);
		ozFace.active = true;
	} else{
		disable();
	}

}

function disable(){
		//animator.SetBool("active", false);
		yield WaitForSeconds(3);
		ozFace.active = false;
}