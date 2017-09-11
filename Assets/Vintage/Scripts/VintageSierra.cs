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
  /// Vintage Sierra.
  /// </summary>
  [ExecuteInEditMode]
  [RequireComponent(typeof(Camera))]
  [AddComponentMenu("Image Effects/Vintage/Vintage Sierra")]
  public sealed class VintageSierra : ImageEffectBase
  {
    /// <summary>
    /// Effect description.
    /// </summary>
    public override string Description { get { return @"Sierra makes the game appear softer by adding bluish tones while emphasizing darks and yellows."; } }

    /// <summary>
    /// Overlay strength [0.0 - 1.0].
    /// </summary>
    public float OverlayStrength
    {
      get { return overlayStrength; }
      set { overlayStrength = Mathf.Clamp(value, 0.0f, 1.0f); }
    }

    /// <summary>
    /// Shader path.
    /// </summary>
    protected override string ShaderPath { get { return @"Shaders/VintageSierra"; } }

    private Texture2D blowoutTex;
    private Texture2D overlayTex;
    private Texture2D levelsTex;

    [SerializeField]
    private float overlayStrength = 0.5f;

    private const string variableBlowoutTex = @"_BlowoutTex";
    private const string variableOverlayTex = @"_OverlayTex";
    private const string variableLevelsTex = @"_LevelsTex";
    private const string variableOverlayStrength = @"_OverlayStrength";

    /// <summary>
    /// Creates the material and textures.
    /// </summary>
    protected override void CreateMaterial()
    {
      blowoutTex = VintageHelper.LoadTextureFromResources(@"Textures/sierraVignette");
      overlayTex = VintageHelper.LoadTextureFromResources(@"Textures/overlayMap");
      levelsTex = VintageHelper.LoadTextureFromResources(@"Textures/sierraMap");

      base.CreateMaterial();
    }

    /// <summary>
    /// Set the default values of the shader.
    /// </summary>
    public override void ResetDefaultValues()
    {
      overlayStrength = 0.5f;

      base.ResetDefaultValues();
    }

    /// <summary>
    /// Set the values to shader.
    /// </summary>
    protected override void SendValuesToShader()
    {
      this.Material.SetTexture(variableBlowoutTex, blowoutTex);
      this.Material.SetTexture(variableOverlayTex, overlayTex);
      this.Material.SetTexture(variableLevelsTex, levelsTex);

      this.Material.SetFloat(variableOverlayStrength, overlayStrength);
    }
  }
}