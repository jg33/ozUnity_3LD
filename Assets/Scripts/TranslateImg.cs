using UnityEngine;
using UnityEngine.UI;
using Mgl;

public class TranslateImg : MonoBehaviour {

	public Sprite zh_CN;
	private string locale = "en-US";

	void Start()
	{
		switch (Application.systemLanguage) {
			case SystemLanguage.Chinese:
			case SystemLanguage.ChineseSimplified:
			case SystemLanguage.ChineseTraditional: // zh-CN is simplified, not traditional, but using here as fallback
				locale = "zh-CN"; break;
		}

		//locale = "zh-CN"; // for debugging

		if (locale == "zh-CN") {
			GetComponent<Image> ().sprite = zh_CN;
		}
	}

}