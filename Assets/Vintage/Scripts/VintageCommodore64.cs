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
  /// Vintage Commodore 64.
  /// </summary>
  [ExecuteInEditMode]
  [RequireComponent(typeof(Camera))]
  [AddComponentMenu("Image Effects/Vintage/Vintage Commodore 64")]
  public sealed class VintageCommodore64 : ImageEffectBase
  {
    /// <summary>
    /// Effect description.
    /// </summary>
    public override string Description { get { return @"Simulates the palette of the Commodore64 graphic chip (VIC-II)."; } }

    /// <summary>
    /// Pixel size [1.0 - 25.0].
    /// </summary>
    public float PixelSize
    {
      get { return pixelSize; }
      set { pixelSize = Mathf.Clamp(value, 1.0f, 25.0f); }
    }

    /// <summary>
    /// Dither saturation [-2.0 - 2.0].
    /// </summary>
    public float DitherSaturation
    {
      get { return ditherSaturation; }
      set { ditherSaturation = Mathf.Clamp(value, -2.0f, 2.0f); }
    }

    /// <summary>
    /// Dither noise [0.0 - 1.0].
    /// </summary>
    public float DitherNoise
    {
      get { return ditherNoise; }
      set { ditherNoise = Mathf.Clamp(value, 0.0f, 1.0f); }
    }

    /// <summary>
    /// Shader path.
    /// </summary>
    protected override string ShaderPath { get { return @"Shaders/VintageCommodore64"; } }

    private float pixelSize = 2.0f;
    private float ditherSaturation = 1.0f;
    private float ditherNoise = 1.0f;

    private const string variablePixelSize = @"_PixelSize";
    private const string variableSaturation = @"_DitherSaturation";
    private const string variableNoise = @"_DitherNoise";

    /// <summary>
    /// Set the default values of the shader.
    /// </summary>
    public override void ResetDefaultValues()
    {
      pixelSize = 2.0f;
      ditherSaturation = 1.0f;
      ditherNoise = 1.0f;

      base.ResetDefaultValues();
    }

    /// <summary>
    /// Set the values to shader.
    /// </summary>
    protected override void SendValuesToShader()
    {
      this.Material.SetFloat(variablePixelSize, pixelSize);
      this.Material.SetFloat(variableSaturation, ditherSaturation);
      this.Material.SetFloat(variableNoise, ditherNoise);
    }
  }
}