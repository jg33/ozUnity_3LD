using UnityEngine;
using UnityEngine.UI;
using Mgl;

public class AutoTranslateText : MonoBehaviour {

	private I18n i18n = I18n.Instance;
	private string originalText;
	private Text txt;

	void Start()
	{
		txt = GetComponent<Text> ();
		originalText = txt.text;
		InitLanguage();
		if (I18n.GetLocale () != "en-US") {
			DoTranslation ();
		}
	}

	private void DoTranslation(){
		txt.text = i18n.__(originalText);
	}

	private void SetLanguage (string locale) {
		I18n.SetLocale(locale);
	}

	private void InitLanguage () { 		

		//SetLanguage("zh-CN"); // for debugging
		//return;

         switch (Application.systemLanguage) {
			case SystemLanguage.English: SetLanguage("en-US"); break;
            case SystemLanguage.Chinese: SetLanguage("zh-CN"); break;
            case SystemLanguage.ChineseSimplified: SetLanguage("zh-CN"); break;
            case SystemLanguage.ChineseTraditional: SetLanguage("zh-CN"); break; // zh-CN is simplified, not traditional, but using here as fallback
            default: SetLanguage("en-US"); break;
         }
     }


}