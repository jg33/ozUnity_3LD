#pragma strict

var flasher:UI.RawImage;


function Start () {
	flasher= this.gameObject.GetComponent(UI.RawImage);

}

function Update () {
	flasher.color.a = Mathf.PerlinNoise(Time.frameCount*0.2,Time.frameCount*0.024);
	
}