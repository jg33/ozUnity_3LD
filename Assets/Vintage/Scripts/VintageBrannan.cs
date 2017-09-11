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
  /// Vintage Brannan.
  /// </summary>
  [ExecuteInEditMode]
  [RequireComponent(typeof(Camera))]
  [AddComponentMenu("Image Effects/Vintage/Vintage Brannan")]
  public sealed class VintageBrannan : ImageEffectBase
  {
    /// <summary>
    /// Effect description.
    /// </summary>
    public override string Description { get { return @"This low-key effect brings out the grays and greens in your game."; } }

    private Texture2D processTex;
    private Texture2D blowoutTex;
    private Texture2D contrastTex;
    private Texture2D lumaTex;
    private Texture2D screenTex;

    private const string variableProcessTex = @"_ProcessTex";
    private const string variableBlowoutTex = @"_BlowoutTex";
    private const string variableContrastTex = @"_ContrastTex";
    private const string variableLumaTex = @"_LumaTex";
    private const string variableScreenTex = @"_ScreenTex";

    /// <summary>
    /// Shader path.
    /// </summary>
    protected override string ShaderPath { get { return @"Shaders/VintageBrannan"; } }

    /// <summary>
    /// Creates the material and textures.
    /// </summary>
    protected override void CreateMaterial()
    {
      processTex = VintageHelper.LoadTextureFromResources(@"Textures/brannanProcess");
      blowoutTex = VintageHelper.LoadTextureFromResources(@"Textures/brannanBlowout");
      contrastTex = VintageHelper.LoadTextureFromResources(@"Textures/brannanContrast");
      lumaTex = VintageHelper.LoadTextureFromResources(@"Textures/brannanLuma");
      screenTex = VintageHelper.LoadTextureFromResources(@"Textures/brannanScreen");

      base.CreateMaterial();
    }

    /// <summary>
    /// Set the values to shader.
    /// </summary>
    protected override void SendValuesToShader()
    {
      this.Material.SetTexture(variableProcessTex, processTex);
      this.Material.SetTexture(variableBlowoutTex, blowoutTex);
      this.Material.SetTexture(variableContrastTex, contrastTex);
      this.Material.SetTexture(variableLumaTex, lumaTex);
      this.Material.SetTexture(variableScreenTex, screenTex);
    }
  }
}