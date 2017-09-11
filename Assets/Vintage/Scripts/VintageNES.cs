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
  /// Vintage NES (Nintendo Entertainment System) http://pixeljoint.com/forum/forum_posts.asp?TID=12795.
  /// </summary>
  [ExecuteInEditMode]
  [RequireComponent(typeof(Camera))]
  [AddComponentMenu("Image Effects/Vintage/Vintage NES")]
  public sealed class VintageNES : ImageEffectBase
  {
    /// <summary>
    /// Effect description.
    /// </summary>
    public override string Description { get { return @"Simulates NES using DawnBringer's palettes plus dithering."; } }

    /// <summary>
    /// Luminosity [0.0 - 1.0].
    /// </summary>
    public float Luminosity
    {
      get { return luminosity; }
      set { luminosity = Mathf.Clamp01(value); }
    }

    /// <summary>
    /// Shader path.
    /// </summary>
    protected override string ShaderPath { get { return @"Shaders/VintageNES"; } }

    [SerializeField]
    public float luminosity = 1.0f;

    private const string variableLuminosity = @"_Luminosity";

    /// <summary>
    /// Set the default values of the shader.
    /// </summary>
    public override void ResetDefaultValues()
    {
      luminosity = 1.0f;

      base.ResetDefaultValues();
    }

    /// <summary>
    /// Set the values to shader.
    /// </summary>
    protected override void SendValuesToShader()
    {
      this.Material.SetFloat(variableLuminosity, luminosity);
    }
  }
}