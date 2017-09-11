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
  /// Vintage Amaro.
  /// </summary>
  [ExecuteInEditMode]
  [RequireComponent(typeof(Camera))]
  [AddComponentMenu("Image Effects/Vintage/Vintage Amaro")]
  public sealed class VintageAmaro : ImageEffectBase
  {
    /// <summary>
    /// Effect description.
    /// </summary>
    public override string Description { get { return @"This effect adds more light to the centre of the screen and darkens around the edges."; } }

    /// <summary>
    /// Overlay strength [0.0 - 1.0].
    /// </summary>
    public float Overlay
    {
      get { return overlayStrength; }
      set { overlayStrength = Mathf.Clamp01(value); }
    }

    private Texture2D blowoutTex;
    private Texture2D overlayTex;
    private Texture2D levelsTex;

    [SerializeField]
    private float overlayStrength = 0.6f;

    /// <summary>
    /// Shader path.
    /// </summary>
    protected override string ShaderPath { get { return @"Shaders/VintageAmaro"; } }

    private const string keywordOverlay = @"OVERLAY";

    private const string variableBlowoutTex = @"_BlowoutTex";
    private const string variableOverlayTex = @"_OverlayTex";
    private const string variableLevelsTex = @"_LevelsTex";
    private const string variableOverlayStrength = @"_OverlayStrength";

    /// <summary>
    /// Creates the material and textures.
    /// </summary>
    protected override void CreateMaterial()
    {
      blowoutTex = VintageHelper.LoadTextureFromResources(@"Textures/blackboard1024");
      overlayTex = VintageHelper.LoadTextureFromResources(@"Textures/overlayMap");
      levelsTex = VintageHelper.LoadTextureFromResources(@"Textures/amaroMap");

      base.CreateMaterial();
    }

    /// <summary>
    /// Set the default values of the shader.
    /// </summary>
    public override void ResetDefaultValues()
    {
      overlayStrength = 0.6f;

      base.ResetDefaultValues();
    }

    /// <summary>
    /// Set the values to shader.
    /// </summary>
    protected override void SendValuesToShader()
    {
      this.Material.SetTexture(variableBlowoutTex, blowoutTex);
      this.Material.SetTexture(variableLevelsTex, levelsTex);

      if (overlayStrength > 0.0f)
      {
        this.Material.EnableKeyword(keywordOverlay);

        this.Material.SetTexture(variableOverlayTex, overlayTex);

        this.Material.SetFloat(variableOverlayStrength, overlayStrength);
      }
      else
        this.Material.DisableKeyword(keywordOverlay);
    }
  }
}