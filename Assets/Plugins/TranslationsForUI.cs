using UnityEngine;
using UnityEngine.UI;
using Mgl;

public class TranslationsForUI : MonoBehaviour {

	private I18n i18n = I18n.Instance;
	public string back="BACK",next="NEXT",close="CLOSE",done="DONE";

	void Start()
	{
		InitLanguage();
		if (I18n.GetLocale () != "en-US") {
			back = i18n.__(back);
			next = i18n.__(next);
			close = i18n.__(close);
			done = i18n.__(done);
		}
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