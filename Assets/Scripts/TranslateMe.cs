using UnityEngine;
using UnityEngine.UI;
using Mgl;

public class TranslateMe : MonoBehaviour {

	private I18n i18n = I18n.Instance;
	public string originalText;
	public Text txt;

	public string d1 = "",d2="";

	void Start()
	{
		txt = GetComponent<Text> ();
		originalText = txt.text;
		InitLanguage();
		d1 = I18n.GetLocale ();
		if (I18n.GetLocale () != "en-US") {
			DoTranslation ();
		}
	}

	private void DoTranslation(){
		txt.text = i18n.__(originalText);
		d2 = i18n.__(originalText);
	}

	private void SetLanguage (string locale) {
		I18n.SetLocale(locale);
	}

	private void InitLanguage () { 		

		//SetLanguage("zh-CN");
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