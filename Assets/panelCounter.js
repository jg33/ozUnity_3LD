#pragma strict


var currentPanel:int;
var animator:Animator;

private var backButton:GameObject;
private var nextButton:GameObject;
private var totalPanels = 3;

public var localizedString:UITranslator;


function Start () {
	currentPanel = 0;

	localizedString = GameObject.Find("UITranslator").GetComponent(UITranslator);
}

function Update () {

}

function panelUp(){
	currentPanel++;
	if (currentPanel > totalPanels) currentPanel = 0;
		animator.SetInteger("panel #", currentPanel);
	setButtons();

}

function panelDown(){
	currentPanel--;
	if (currentPanel < 1) currentPanel = 0;
	animator.SetInteger("panel #", currentPanel);
	
	setButtons();
}

function setButtons(){
	/// Button ///
	backButton = GameObject.Find("InstructionBackText");
	nextButton = GameObject.Find("InstructionNextText");

	if(currentPanel == 1){
		//backButton.GetComponent(UI.Text).text = "CLOSE";
		//nextButton.GetComponent(UI.Text).text = "NEXT";
		backButton.GetComponent(UI.Text).text = localizedString.back;
		nextButton.GetComponent(UI.Text).text = localizedString.next;

		} else if(currentPanel == 3){
		//nextButton.GetComponent(UI.Text).text = "DONE";
		//backButton.GetComponent(UI.Text).text = "BACK";
		nextButton.GetComponent(UI.Text).text = localizedString.done;
		backButton.GetComponent(UI.Text).text = localizedString.back;

		} else{
		//backButton.GetComponent(UI.Text).text = "BACK";
		//nextButton.GetComponent(UI.Text).text = "NEXT";
		backButton.GetComponent(UI.Text).text = localizedString.back;
		nextButton.GetComponent(UI.Text).text = localizedString.next;

		}
}