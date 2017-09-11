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
using UnityEditor;

namespace VintageImageEffects
{
  /// <summary>
  /// Vintage Rise Editor.
  /// </summary>
  [CustomEditor(typeof(VintageSierra))]
  public class VintageSierraEditor : ImageEffectBaseEditor
  {
    /// <summary>
    /// Inspector.
    /// </summary>
    protected override void Inspector()
    {
      VintageSierra thisTarget = (VintageSierra)target;

      thisTarget.OverlayStrength = VintageEditorHelper.SliderWithReset("Overlay", "The strength with which the texture is applied.\nFrom 0.0 (no texture) to 1.0 (full texture).", thisTarget.OverlayStrength, 0.0f, 1.0f, 0.5f);
    }
  }
}