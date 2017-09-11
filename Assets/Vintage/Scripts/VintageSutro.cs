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
  /// Vintage Sutro.
  /// </summary>
  [ExecuteInEditMode]
  [RequireComponent(typeof(Camera))]
  [AddComponentMenu("Image Effects/Vintage/Vintage Sutro")]
  public sealed class VintageSutro : ImageEffectBase
  {
    /// <summary>
    /// Effect description.
    /// </summary>
    public override string Description { get { return @"Sutro gives you Sepia-like tones, with an emphasis on purple and brown."; } }

    /// <summary>
    /// Obturation of the vignette [0.0 - 2.0].
    /// </summary>
    public float Obturation
    {
      get { return obturation; }
      set { obturation = Mathf.Clamp(value, 0.0f, 2.0f); }
    }

    /// <summary>
    /// Shader path.
    /// </summary>
    protected override string ShaderPath { get { return @"Shaders/VintageSutro"; } }

    private Texture2D edgeBurnTex;
    private Texture2D curvesTex;

    [SerializeField]
    private float obturation = 1.0f;

    private const string keywordObturation = @"OBTURATION";

    private const string variableEdgeBurnTex = @"_EdgeBurnTex";
    private const string variableCurvesTex = @"_CurvesTex";
    private const string variableObturation = @"_Obturation";

    /// <summary>
    /// Creates the material and textures.
    /// </summary>
    protected override void CreateMaterial()
    {
      edgeBurnTex = VintageHelper.LoadTextureFromResources(@"Textures/sutroEdgeBurn");
      curvesTex = VintageHelper.LoadTextureFromResources(@"Textures/sutroCurves");

      base.CreateMaterial();
    }

    /// <summary>
    /// Set the default values of the shader.
    /// </summary>
    public override void ResetDefaultValues()
    {
      obturation = 1.0f;

      base.ResetDefaultValues();
    }

    /// <summary>
    /// Set the values to shader.
    /// </summary>
    protected override void SendValuesToShader()
    {
      this.Material.SetTexture(variableEdgeBurnTex, edgeBurnTex);
      this.Material.SetTexture(variableCurvesTex, curvesTex);

      if (obturation > 0.0f)
      {
        this.Material.EnableKeyword(keywordObturation);

        this.Material.SetFloat(variableObturation, obturation);
      }
      else
        this.Material.DisableKeyword(keywordObturation);
    }
  }
}