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

namespace VintageImageEffects
{
  /// <summary>
  /// Image effect base.
  /// </summary>
  public abstract class ImageEffectBase : MonoBehaviour
  {
    /// <summary>
    /// Amount of the effect [0.0 - 1.0].
    /// </summary>
    public float Amount
    {
      get { return amount; }
      set { amount = Mathf.Clamp01(value); }
    }

    [SerializeField]
    private float amount = 1.0f;

    #region Color controls.
    /// <summary>
    /// 
    /// </summary>
    public bool EnableColorControls
    {
      get { return enableColorControls; }
      set { enableColorControls = value; }
    }

    /// <summary>
    /// Brightness [-1.0 - 1.0].
    /// </summary>
    public float Brightness
    {
      get { return brightness; }
      set { brightness = Mathf.Clamp(value, -1.0f, 1.0f); }
    }

    /// <summary>
    /// Contrast [-1.0 - 1.0].
    /// </summary>
    public float Contrast
    {
      get { return contrast; }
      set { contrast = Mathf.Clamp(value, -1.0f, 1.0f); }
    }

    /// <summary>
    /// Gamma [0.1 - 10.0].
    /// </summary>
    public float Gamma
    {
      get { return gamma; }
      set { gamma = Mathf.Clamp(value, 0.1f, 10.0f); }
    }

    /// <summary>
    /// Hue [0.0 - 1.0].
    /// </summary>
    public float Hue
    {
      get { return hue; }
      set { hue = Mathf.Clamp01(value); }
    }

    /// <summary>
    /// Saturation [-1.0 - 1.0].
    /// </summary>
    public float Saturation
    {
      get { return saturation; }
      set { saturation = Mathf.Clamp(value, -1.0f, 1.0f); }
    }

    [SerializeField]
    private bool enableColorControls = false;

    [SerializeField]
    private float brightness = 0.0f;

    [SerializeField]
    private float contrast = 0.0f;

    [SerializeField]
    private float gamma = 1.0f;

    [SerializeField]
    private float hue = 0.0f;

    [SerializeField]
    private float saturation = 1.0f;

    private const string variableBrightness = @"_Brightness";
    private const string variableContrast = @"_Contrast";
    private const string variableGamma = @"_Gamma";
    private const string variableHue = @"_Hue";
    private const string variableSaturation = @"_Saturation";
    #endregion

    #region Film.
    /// <summary>
    /// 
    /// </summary>
    public bool EnableFilm
    {
      get { return enableFilm; }
      set { enableFilm = value; }
    }

    /// <summary>
    /// Grain [0.0 - 1.0].
    /// </summary>
    public float FilmGrainStrength
    {
      get { return filmGrainStrength; }
      set { filmGrainStrength = Mathf.Clamp01(value); }
    }

    /// <summary>
    /// Blink strength [0.0 - 1.0].
    /// </summary>
    public float FilmBlinkStrenght
    {
      get { return filmBlinkStrenght; }
      set { filmBlinkStrenght = Mathf.Clamp01(value); }
    }

    [SerializeField]
    private bool enableFilm = false;

    [SerializeField]
    private float filmGrainStrength = 0.3f;

    [SerializeField]
    private float filmBlinkStrenght = 0.0f;

    private const string variableFilmGrainStrength = @"_FilmGrainStrength";
    private const string variableFilmBlinkStrenght = @"_FilmBlinkStrenght";
    #endregion

    private Shader shader;

    private Material material;

    private const string variableAmount = @"_Amount";

    private const string keywordEffect = @"EFFECT_ENABLED";
    private const string keywordColorControl = @"COLORCONTROL_ENABLED";
    private const string keywordFilm = @"FILM_ENABLED";

    /// <summary>
    /// Get/set the shader.
    /// </summary>
    public Shader Shader
    {
      get { return shader; }
      set
      {
        if (shader != value)
        {
          shader = value;

          CreateMaterial();
        }
      }
    }

    /// <summary>
    /// Get the material.
    /// </summary>
    public Material Material
    {
      get
      {
        if (material == null && shader != null)
          CreateMaterial();

        return material;
      }
    }

    /// <summary>
    /// Effect description.
    /// </summary>
    public abstract string Description { get; }

    /// <summary>
    /// Shader path.
    /// </summary>
    protected abstract string ShaderPath { get; }

    /// <summary>
    /// 
    /// </summary>
    private void Awake()
    {
      if (CheckHardwareRequirements() == true)
      {
        shader = Resources.Load<Shader>(ShaderPath);
        if (shader != null)
        {
          if (shader.isSupported == true)
          {
            CreateMaterial();

            if (material == null)
            {
              Debug.LogWarning(string.Format("'{0}' material null.", this.name));

              this.enabled = false;
            }
          }
          else
          {
            Debug.LogWarning(string.Format("'{0}' shader not supported.", this.GetType().ToString()));

            this.enabled = false;
          }
        }
        else
        {
          Debug.LogError(string.Format("'{0}' shader not found.", ShaderPath));

          this.enabled = false;
        }
      }
      else
        this.enabled = false;
    }

    /// <summary>
    /// Destroy resources.
    /// </summary>
    protected virtual void OnDestroy()
    {
      if (material != null)
        DestroyImmediate(material);
    }

    /// <summary>
    /// Check hardware requirements.
    /// </summary>
    protected virtual bool CheckHardwareRequirements()
    {
      if (SystemInfo.supportsImageEffects == false)
      {
        Debug.LogWarning(string.Format("Hardware not support Image Effects. '{0}' disabled.", this.GetType().ToString()));

        return false;
      }

      return true;
    }

    /// <summary>
    /// Set the default values of the shader.
    /// </summary>
    public virtual void ResetDefaultValues()
    {
      amount = 1.0f;

      brightness = 0.0f;
      contrast = 0.0f;
      gamma = 1.0f;
      hue = 0.0f;
      saturation = 1.0f;

      filmGrainStrength = 0.3f;
      filmBlinkStrenght = 0.0f;
    }

    /// <summary>
    /// Creates the material and textures.
    /// </summary>
    protected virtual void CreateMaterial()
    {
      if (material != null)
        DestroyImmediate(material);

      material = new Material(shader);
    }

    private void OnRenderImage(RenderTexture source, RenderTexture destination)
    {
      if (material != null)
      {
        material.DisableKeyword(keywordEffect);
        material.DisableKeyword(keywordColorControl);

        material.DisableKeyword(keywordFilm);

        if (amount > 0.0f)
        {
          material.EnableKeyword(keywordEffect);

          material.SetFloat(variableAmount, amount);

          if (enableColorControls == true)
          {
            material.EnableKeyword(keywordColorControl);

            material.SetFloat(variableBrightness, brightness);
            material.SetFloat(variableContrast, contrast + 1.0f);
            material.SetFloat(variableGamma, 1.0f / gamma);
            material.SetFloat(variableHue, hue);
            material.SetFloat(variableSaturation, saturation);
          }

          if (enableFilm == true)
          {
            material.EnableKeyword(keywordFilm);

            material.SetFloat(variableFilmGrainStrength, filmGrainStrength);
            material.SetFloat(variableFilmBlinkStrenght, filmBlinkStrenght);
          }
        }

        SendValuesToShader();

        Graphics.Blit(source, destination, material, QualitySettings.activeColorSpace == ColorSpace.Linear ? 1 : 0);
      }
    }

    /// <summary>
    /// Set the values to shader.
    /// </summary>
    protected abstract void SendValuesToShader();
  }
}
