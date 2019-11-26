using UnityEngine;

public class OpenURL : MonoBehaviour 
{
	public string Url;

	public void Open()
	{
		Application.OpenURL("https://www.elementsofoz.com/privacy-policy");
	}

}
