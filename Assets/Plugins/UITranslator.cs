using UnityEngine;
using UnityEngine.UI;
using Mgl;

public class UITranslator : MonoBehaviour {

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

		SetLanguage("zh-CN"); return; // for debugging only
		
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