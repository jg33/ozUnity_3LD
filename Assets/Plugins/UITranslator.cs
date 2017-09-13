using UnityEngine;
using UnityEngine.UI;
using System.Collections;
using System.Collections.Generic;
using Mgl;

public class UITranslator : MonoBehaviour {

	private I18n i18n = I18n.Instance;
	public Dictionary<string, string> translations = new Dictionary<string, string>();
	public string[] UIText = new string[] {"BACK", "NEXT", "CLOSE", "DONE", "App ready... Please wait.", "Are you at the theater? Tap here to set up your phone for the show.", "You are now connected. Enjoy the Show!"};

	void Start()
	{
		InitLanguage();

		if (I18n.GetLocale () != "en-US") {
			for (int i=0; i < UIText.Length; i++) {
				translations.Add (UIText [i], i18n.__ (UIText [i]));
				Debug.Log("init dictionary: " + UIText [i] + " = " + i18n.__ (UIText [i]));
			}
		} else {
			for (int i=0; i < UIText.Length; i++) {
				translations.Add(UIText[i], UIText[i]);
			}
		}
	
	}

	private void SetLanguage (string locale) {
		I18n.SetLocale(locale);
	}

	private void InitLanguage () { 

		//SetLanguage("zh-CN"); return; // for debugging only
		
         switch (Application.systemLanguage) {
            case SystemLanguage.Chinese:
            case SystemLanguage.ChineseSimplified:
			case SystemLanguage.ChineseTraditional: // zh-CN is simplified, not traditional, but using here as fallback
				SetLanguage("zh-CN"); break;
            default: 
				SetLanguage("en-US"); break;
         }
     }


}