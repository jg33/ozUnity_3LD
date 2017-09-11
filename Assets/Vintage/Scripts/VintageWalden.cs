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
  /// Vintage Walden.
  /// </summary>
  [ExecuteInEditMode]
  [RequireComponent(typeof(Camera))]
  [AddComponentMenu("Image Effects/Vintage/Vintage Walden")]
  public sealed class VintageWalden : ImageEffectBase
  {
    /// <summary>
    /// Effect description.
    /// </summary>
    public override string Description { get { return @"Gives your game washed-out, bluish colors and adds a slight corner vignetting."; } }

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
    protected override string ShaderPath { get { return @"Shaders/VintageWalden"; } }

    [SerializeField]
    public float obturation = 1.0f;

    private Texture2D levelsTex;

    private const string keywordObturation = @"OBTURATION";

    private const string variableLevelsTex = @"_LevelsTex";
    private const string variableObturation = @"_Obturation";

    /// <summary>
    /// Creates the material and textures.
    /// </summary>
    protected override void CreateMaterial()
    {
      levelsTex = VintageHelper.LoadTextureFromResources(@"Textures/waldenMap");

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
      this.Material.SetTexture(variableLevelsTex, levelsTex);

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