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
  /// Vintage Toaster.
  /// </summary>
  [ExecuteInEditMode]
  [RequireComponent(typeof(Camera))]
  [AddComponentMenu("Image Effects/Vintage/Vintage Toaster")]
  public sealed class VintageToaster : ImageEffectBase
  {
    /// <summary>
    /// Effect description.
    /// </summary>
    public override string Description { get { return @"Gives your game a burnt, aged look. It also also adds a slight texture plus vignetting."; } }

    /// <summary>
    /// Shader path.
    /// </summary>
    protected override string ShaderPath { get { return @"Shaders/VintageToaster"; } }

    private Texture2D metalTex;
    private Texture2D softLightTex;
    private Texture2D curvesTex;
    private Texture2D overlayWarmTex;
    private Texture2D colorShiftTex;

    private const string variableMetalTex = @"_MetalTex";
    private const string variableSoftLightTex = @"_SoftLightTex";
    private const string variableCurvesTex = @"_CurvesTex";
    private const string variableOverlayWarmTex = @"_OverlayWarmTex";
    private const string variableColorShiftTex = @"_ColorShiftTex";

    /// <summary>
    /// Creates the material and textures.
    /// </summary>
    protected override void CreateMaterial()
    {
      metalTex = VintageHelper.LoadTextureFromResources(@"Textures/toasterMetal");
      softLightTex = VintageHelper.LoadTextureFromResources(@"Textures/toasterSoftLight");
      curvesTex = VintageHelper.LoadTextureFromResources(@"Textures/toasterCurves");
      overlayWarmTex = VintageHelper.LoadTextureFromResources(@"Textures/toasterOverlayMapWarm");
      colorShiftTex = VintageHelper.LoadTextureFromResources(@"Textures/toasterColorShift");

      base.CreateMaterial();
    }

    /// <summary>
    /// Set the values to shader.
    /// </summary>
    protected override void SendValuesToShader()
    {
      this.Material.SetTexture(variableMetalTex, metalTex);
      this.Material.SetTexture(variableSoftLightTex, softLightTex);
      this.Material.SetTexture(variableCurvesTex, curvesTex);
      this.Material.SetTexture(variableOverlayWarmTex, overlayWarmTex);
      this.Material.SetTexture(variableColorShiftTex, colorShiftTex);
    }
  }
}