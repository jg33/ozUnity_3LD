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
  /// Vintage Slumber.
  /// </summary>
  [ExecuteInEditMode]
  [RequireComponent(typeof(Camera))]
  [AddComponentMenu("Image Effects/Vintage/Vintage Slumber")]
  public sealed class VintageSlumber : ImageEffectBase
  {
    /// <summary>
    /// Effect description.
    /// </summary>
    public override string Description { get { return @"Slumber desaturate the game and makes them hazy and dreamy look."; } }

    /// <summary>
    /// Shader path.
    /// </summary>
    protected override string ShaderPath { get { return @"Shaders/VintageSlumber"; } }

    private Texture3D lutTex = null;

    private const string variableScale = @"_Scale";
    private const string variableOffset = @"_Offset";
    private const string variableLutTex = @"_LutTex";

    /// <summary>
    /// Destroy resources.
    /// </summary>
    protected override void OnDestroy()
    {
      DestroyLut();

      base.OnDestroy();
    }

    protected override bool CheckHardwareRequirements()
    {
      if (base.CheckHardwareRequirements() == true)
      {
        if (SystemInfo.supports3DTextures == false)
        {
          Debug.LogWarning(string.Format("Hardware not support 3D textures. '{0}' disabled.", this.GetType().ToString()));

          return false;
        }
      }

      return true;
    }

    private void DestroyLut()
    {
      if (lutTex != null)
      {
        DestroyImmediate(lutTex);

        lutTex = null;
      }
    }

    /// <summary>
    /// Creates the material and textures.
    /// </summary>
    protected override void CreateMaterial()
    {
      DestroyLut();

      lutTex = VintageHelper.CreateTexture3DFromResources(@"Textures/slumberLut", 16);

      base.CreateMaterial();
    }

    /// <summary>
    /// Set the values to shader.
    /// </summary>
    protected override void SendValuesToShader()
    {
      if (lutTex != null)
      {
        int lutSize = lutTex.width;

        this.Material.SetFloat(variableScale, (lutSize - 1) / (1.0f * lutSize));
        this.Material.SetFloat(variableOffset, 1.0f / (2.0f * lutSize));
        this.Material.SetTexture(variableLutTex, lutTex);
      }
    }
  }
}