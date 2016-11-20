#pragma strict

var pink:UI.Image;
var fadeAmt:float;

function Start () {
	pink= this.gameObject.GetComponent(UI.Image);

}

function FixedUpdate () {
	pink.color.a = fadeAmt;
	
}