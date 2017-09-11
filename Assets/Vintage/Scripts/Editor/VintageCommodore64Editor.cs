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
using UnityEditor;

namespace VintageImageEffects
{
  /// <summary>
  /// Vintage Commodore 64 Editor.
  /// </summary>
  [CustomEditor(typeof(VintageCommodore64))]
  public class VintageCommodore64Editor : ImageEffectBaseEditor
  {
    /// <summary>
    /// Inspector.
    /// </summary>
    protected override void Inspector()
    {
      VintageCommodore64 thisTarget = (VintageCommodore64)target;

      thisTarget.PixelSize = VintageEditorHelper.IntSliderWithReset("Pixel size", @"Pixel size", (int)thisTarget.PixelSize, 1, 25, 2);
      thisTarget.DitherSaturation = VintageEditorHelper.SliderWithReset("Saturation", @"Dither saturation", thisTarget.DitherSaturation, -2.0f, 2.0f, 1.0f);
      thisTarget.DitherNoise = VintageEditorHelper.SliderWithReset("Noise", @"Dither noise", thisTarget.DitherNoise, 0.0f, 1.0f, 1.0f);
    }
  }
}