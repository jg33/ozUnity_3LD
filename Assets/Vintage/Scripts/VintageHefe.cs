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
  /// Vintage Hefe.
  /// </summary>
  [ExecuteInEditMode]
  [RequireComponent(typeof(Camera))]
  [AddComponentMenu("Image Effects/Vintage/Vintage Hefe")]
  public sealed class VintageHefe : ImageEffectBase
  {
    /// <summary>
    /// Effect description.
    /// </summary>
    public override string Description { get { return @"Hefe slightly increases saturation and gives a warm fuzzy tone to your game."; } }

    /// <summary>
    /// Shader path.
    /// </summary>
    protected override string ShaderPath { get { return @"Shaders/VintageHefe"; } }

    private Texture2D edgeBurnTex;
    private Texture2D levelsTex;
    private Texture2D gradientTex;
    private Texture2D softLightTex;

    private const string variableEdgeBurnTex = @"_EdgeBurnTex";
    private const string variableLevelsTex = @"_LevelsTex";
    private const string variableGradientTex = @"_GradientTex";
    private const string variableSoftLightTex = @"_SoftLightTex";

    /// <summary>
    /// Creates the material and textures.
    /// </summary>
    protected override void CreateMaterial()
    {
      edgeBurnTex = VintageHelper.LoadTextureFromResources(@"Textures/edgeBurn");
      levelsTex = VintageHelper.LoadTextureFromResources(@"Textures/hefeMap");
      gradientTex = VintageHelper.LoadTextureFromResources(@"Textures/hefeGradientMap");
      softLightTex = VintageHelper.LoadTextureFromResources(@"Textures/hefeSoftLight");

      base.CreateMaterial();
    }

    /// <summary>
    /// Set the values to shader.
    /// </summary>
    protected override void SendValuesToShader()
    {
      this.Material.SetTexture(variableEdgeBurnTex, edgeBurnTex);
      this.Material.SetTexture(variableLevelsTex, levelsTex);
      this.Material.SetTexture(variableGradientTex, gradientTex);
      this.Material.SetTexture(variableSoftLightTex, softLightTex);
    }
  }
}