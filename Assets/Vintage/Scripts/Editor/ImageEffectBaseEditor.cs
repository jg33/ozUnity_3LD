///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Vintage - Image Effects.
//
// Copyright (c) Ibuprogames <hello@ibuprogames.com>. All rights reserved.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
using UnityEngine;
using UnityEditor;

namespace VintageImageEffects
{
  /// <summary>
  /// ImageEffect Editor Base.
  /// </summary>
  [CustomEditor(typeof(ImageEffectBase))]
  public abstract class ImageEffectBaseEditor : Editor
  {
    /// <summary>
    /// Warnings.
    /// </summary>
    public string Warnings { get; set; }

    /// <summary>
    /// Errors.
    /// </summary>
    public string Errors { get; set; }

    private ImageEffectBase baseTarget;

    private GUIStyle descriptionStyle;

    private bool displayColorControls = false;
    private bool displayFilm = false;

    private string displayColorControlsKey;
    private string displayFilmKey;

    private void OnEnable()
    {
      string productID = GetType().ToString().Replace(@"Editor", string.Empty);

      displayColorControlsKey = string.Format("{0}.displayColorControls", productID);
      displayFilmKey = string.Format("{0}.displayFilm", productID);

      displayColorControls = PlayerPrefs.GetInt(displayColorControlsKey, 0) == 1;
      displayFilm = PlayerPrefs.GetInt(displayFilmKey, 0) == 1;
    }

  /// <summary>
  /// OnInspectorGUI.
  /// </summary>
  public override void OnInspectorGUI()
    {
      if (baseTarget == null)
        baseTarget = this.target as ImageEffectBase;

      EditorGUI.indentLevel = 0;

      EditorGUIUtility.fieldWidth = 0.0f;
      EditorGUIUtility.labelWidth = 125.0f;

      EditorGUILayout.BeginVertical();
      {
        /////////////////////////////////////////////////
        // Description.
        /////////////////////////////////////////////////

        if (descriptionStyle == null)
        {
          descriptionStyle = new GUIStyle(EditorStyles.miniBoldLabel);
          descriptionStyle.wordWrap = true;
        }

        if (string.IsNullOrEmpty(baseTarget.Description) == false)
        {
          EditorGUILayout.Separator();

          EditorGUILayout.LabelField(baseTarget.Description, descriptionStyle);
        }

        EditorGUILayout.Separator();

        /////////////////////////////////////////////////
        // Common.
        /////////////////////////////////////////////////
        baseTarget.Amount = VintageEditorHelper.SliderWithReset(@"Amount", "The strength of the effect.\nFrom 0.0 (no effect) to 1.0 (full effect).", baseTarget.Amount, 0.0f, 1.0f, 1.0f);
          
        Inspector();

        EditorGUILayout.Separator();

        /////////////////////////////////////////////////
        // Color controls.
        /////////////////////////////////////////////////

        baseTarget.EnableColorControls = VintageEditorHelper.Header(ref displayColorControls, baseTarget.EnableColorControls, @"Color controls");
        if (displayColorControls == true)
        {
          EditorGUI.indentLevel++;

          baseTarget.Brightness = VintageEditorHelper.SliderWithReset(@"Brightness", "The Screen appears to be more o less radiating light.\nFrom -1.0 (dark) to 1.0 (full light).", baseTarget.Brightness, -1.0f, 1.0f, 0.0f);

          baseTarget.Contrast = VintageEditorHelper.SliderWithReset(@"Contrast", "The difference in color and brightness.\nFrom -1.0 (no constrast) to 1.0 (full constrast).", baseTarget.Contrast, -1.0f, 1.0f, 0.0f);

          baseTarget.Gamma = VintageEditorHelper.SliderWithReset(@"Gamma", "Optimizes the contrast and brightness in the midtones.\nFrom 0.01 to 10.", baseTarget.Gamma, 0.01f, 10.0f, 1.0f);

          if (baseTarget.GetType() != typeof(VintageInkwell))
          {
            baseTarget.Hue = VintageEditorHelper.SliderWithReset(@"Hue", "The color wheel.\nFrom 0.0 to 1.0.", baseTarget.Hue, 0.0f, 1.0f, 0.0f);

            baseTarget.Saturation = VintageEditorHelper.SliderWithReset(@"Saturation", "Intensity of a colors.\nFrom 0.0 to 1.0.", baseTarget.Saturation, 0.0f, 1.0f, 1.0f);
          }

          EditorGUI.indentLevel--;
        }

        EditorGUILayout.Separator();

        /////////////////////////////////////////////////
        // Extra effects.
        /////////////////////////////////////////////////

        // Film.
        baseTarget.EnableFilm = VintageEditorHelper.Header(ref displayFilm, baseTarget.EnableFilm, @"Film");
        if (displayFilm == true)
        {
          EditorGUI.indentLevel++;

          baseTarget.FilmGrainStrength = VintageEditorHelper.SliderWithReset(@"Grain strength", "Film grain or granularity is noise texture due to the presence of small particles.\nFrom 0.0 (no grain) to 1.0 (full grain).", baseTarget.FilmGrainStrength, 0.0f, 1.0f, 0.3f);

          baseTarget.FilmBlinkStrenght = VintageEditorHelper.SliderWithReset(@"Blink strength", "Brightness variation.\nFrom 0.0 (no fluctuation) to 1.0 (full epilepsy).", baseTarget.FilmBlinkStrenght, 0.0f, 1.0f, 0.0f);

          EditorGUI.indentLevel--;
        }

        EditorGUILayout.Separator();

        /////////////////////////////////////////////////
        // Misc.
        /////////////////////////////////////////////////

        EditorGUILayout.BeginHorizontal();
        {
          if (GUILayout.Button(new GUIContent("[doc]", "Online documentation"), GUI.skin.label) == true)
            Application.OpenURL(VintageEditorHelper.DocumentationURL);

          GUILayout.FlexibleSpace();

          if (GUILayout.Button("Reset ALL") == true)
            baseTarget.ResetDefaultValues();
        }
        EditorGUILayout.EndHorizontal();

        EditorGUILayout.Separator();

        if (string.IsNullOrEmpty(Warnings) == false)
        {
          EditorGUILayout.HelpBox(Warnings, MessageType.Warning);

          EditorGUILayout.Separator();
        }

        if (string.IsNullOrEmpty(Errors) == false)
        {
          EditorGUILayout.HelpBox(Errors, MessageType.Error);

          EditorGUILayout.Separator();
        }
      }
      EditorGUILayout.EndVertical();

      Warnings = Errors = string.Empty;

      if (GUI.changed == true)
      {
        PlayerPrefs.SetInt(displayColorControlsKey, displayColorControls == true ? 1 : 0);
        PlayerPrefs.SetInt(displayFilmKey, displayFilm == true ? 1 : 0);

        EditorUtility.SetDirty(target);
      }

      EditorGUIUtility.fieldWidth = EditorGUIUtility.labelWidth = 0.0f;

      EditorGUI.indentLevel = 0;
    }

    /// <summary>
    /// Inspector.
    /// </summary>
    protected virtual void Inspector()
    {
      DrawDefaultInspector();
    }
  }
}